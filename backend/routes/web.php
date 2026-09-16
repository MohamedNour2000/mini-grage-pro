<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\VehiculeController;
use App\Http\Controllers\ReparationController; // <-- IMPORTANT : C'est le contrôleur Web, pas API !

Route::redirect('/', '/vehicules');

Route::resource('vehicules', VehiculeController::class)->only(['index', 'show']);

// C'est cette ligne qui doit pointer vers ReparationController (Web)
Route::resource('reparations', ReparationController::class);
