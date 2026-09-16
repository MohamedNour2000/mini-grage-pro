<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\VehiculeApiController;
use App\Http\Controllers\Api\ReparationApiController;
use App\Http\Controllers\Api\TechnicienApiController;

Route::prefix('v1')->name('api.')->group(function () {
    Route::apiResource('vehicules', VehiculeApiController::class);
    Route::apiResource('reparations', ReparationApiController::class);
    Route::apiResource('techniciens', TechnicienApiController::class);
});
