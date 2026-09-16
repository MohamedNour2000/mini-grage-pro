<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Technicien;
use Illuminate\Http\Request;

class TechnicienApiController extends Controller
{
    public function index()
    {
        return response()->json(Technicien::all(), 200);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nom' => 'required|string|max:255',
            'prenom' => 'required|string|max:255',
            'specialite' => 'required|string|max:255',
        ]);

        $technicien = Technicien::create($validated);

        return response()->json($technicien, 201);
    }

    public function show($id)
    {
        $technicien = Technicien::find($id);

        if (!$technicien) {
            return response()->json(['message' => 'Technicien non trouvé'], 404);
        }

        return response()->json($technicien, 200);
    }

    public function update(Request $request, $id)
    {
        $technicien = Technicien::find($id);

        if (!$technicien) {
            return response()->json(['message' => 'Technicien non trouvé'], 404);
        }

        $validated = $request->validate([
            'nom' => 'sometimes|required|string|max:255',
            'prenom' => 'sometimes|required|string|max:255',
            'specialite' => 'sometimes|required|string|max:255',
        ]);

        $technicien->update($validated);

        return response()->json($technicien, 200);
    }

    public function destroy($id)
    {
        $technicien = Technicien::find($id);

        if (!$technicien) {
            return response()->json(['message' => 'Technicien non trouvé'], 404);
        }

        $technicien->delete();

        return response()->json(null, 204);
    }
}
