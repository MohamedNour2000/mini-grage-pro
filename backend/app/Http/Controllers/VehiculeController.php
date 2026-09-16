<?php

namespace App\Http\Controllers;

use App\Models\Vehicule;
use Illuminate\Http\Request;

class VehiculeController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search');
        $vehicules = Vehicule::when($search, function ($query, $search) {
            return $query->where('marque', 'like', "%{$search}%")
                         ->orWhere('immatriculation', 'like', "%{$search}%");
        })->paginate(6);

        return view('garage.vehicules.index', compact('vehicules', 'search'));
    }

    public function show(Vehicule $vehicule) // Model Binding
    {
        $vehicule->load('reparations.techniciens');
        return view('garage.vehicules.show', compact('vehicule'));
    }
}
