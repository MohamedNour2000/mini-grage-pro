<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Reparation;
use Illuminate\Http\Request;

class ReparationApiController extends Controller
{
    public function index()
    {
        return response()->json(Reparation::with(['vehicule', 'techniciens'])->latest()->get(), 200);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'vehicule_id' => 'required|exists:vehicules,id',
            'date' => 'required|date',
            'duree_main_oeuvre' => 'required|numeric',
            'objet_reparation' => 'required|string|max:255',
        ]);

        $reparation = Reparation::create($validated);

        return response()->json($reparation, 201);
    }

    public function show($id)
    {
        $reparation = Reparation::with(['vehicule', 'techniciens'])->find($id);

        if (!$reparation) {
            return response()->json(['message' => 'Réparation non trouvée'], 404);
        }

        return response()->json($reparation, 200);
    }

    public function update(Request $request, $id)
    {
        $reparation = Reparation::find($id);

        if (!$reparation) {
            return response()->json(['message' => 'Réparation non trouvée'], 404);
        }

        $validated = $request->validate([
            'vehicule_id' => 'sometimes|required|exists:vehicules,id',
            'date' => 'sometimes|required|date',
            'duree_main_oeuvre' => 'sometimes|required|numeric',
            'objet_reparation' => 'sometimes|required|string|max:255',
        ]);

        $reparation->update($validated);

        return response()->json($reparation, 200);
    }

    public function destroy($id)
    {
        $reparation = Reparation::find($id);

        if (!$reparation) {
            return response()->json(['message' => 'Réparation non trouvée'], 404);
        }

        $reparation->delete();

        return response()->json(null, 204);
    }
}
