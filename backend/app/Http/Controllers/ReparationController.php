<?php

namespace App\Http\Controllers;

use App\Models\Reparation;
use App\Models\Vehicule;
use App\Models\Technicien;
use Illuminate\Http\Request;

class ReparationController extends Controller
{
    public function index()
    {
        $reparations = Reparation::with(['vehicule', 'techniciens'])->latest()->paginate(8);
        return view('garage.reparations.index', compact('reparations'));
    }

    public function create()
    {
        $vehicules = Vehicule::all();
        $techniciens = Technicien::all();
        return view('garage.reparations.create', compact('vehicules', 'techniciens'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'vehicule_id' => 'required|exists:vehicules,id',
            'date' => 'required|date',
            'duree_main_oeuvre' => 'required|numeric|min:0.5',
            'objet_reparation' => 'required|string',
            'techniciens' => 'required|array',
            'techniciens.*' => 'exists:techniciens,id'
        ]);

        $reparation = Reparation::create($validated);
        $reparation->techniciens()->sync($request->input('techniciens'));

        return redirect()->route('reparations.index')->with('success', 'Réparation enregistrée avec succès.');
    }

    public function show($id)
    {
        $reparation = Reparation::with(['vehicule', 'techniciens'])->findOrFail($id);
        return view('garage.reparations.show', compact('reparation'));
    }

    public function edit($id)
    {
        $reparation = Reparation::with('techniciens')->findOrFail($id);
        $vehicules = Vehicule::all();
        $techniciens = Technicien::all();
        return view('garage.reparations.edit', compact('reparation', 'vehicules', 'techniciens'));
    }

    public function update(Request $request, $id)
    {
        $reparation = Reparation::findOrFail($id);

        $validated = $request->validate([
            'vehicule_id' => 'required|exists:vehicules,id',
            'date' => 'required|date',
            'duree_main_oeuvre' => 'required|numeric|min:0.5',
            'objet_reparation' => 'required|string',
            'techniciens' => 'required|array',
            'techniciens.*' => 'exists:techniciens,id'
        ]);

        $reparation->update($validated);
        $reparation->techniciens()->sync($request->input('techniciens'));

        return redirect()->route('reparations.index')->with('success', 'Réparation mise à jour avec succès.');
    }

    public function destroy($id)
    {
        $reparation = Reparation::findOrFail($id);
        $reparation->techniciens()->detach();
        $reparation->delete();

        return redirect()->route('reparations.index')->with('success', 'Réparation supprimée avec succès.');
    }
}
