<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Vehicule;
use Illuminate\Http\Request;

class VehiculeApiController extends Controller
{
    public function index() { return response()->json(Vehicule::all()); }
    public function store(Request $request) { return response()->json(Vehicule::create($request->all()), 201); }
    public function show(Vehicule $vehicule) { return response()->json($vehicule); }
    public function update(Request $request, Vehicule $vehicule) { $vehicule->update($request->all()); return response()->json($vehicule); }
    public function destroy(Vehicule $vehicule) { $vehicule->delete(); return response()->json(null, 204); }
}
