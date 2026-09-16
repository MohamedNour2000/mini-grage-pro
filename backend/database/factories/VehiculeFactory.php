<?php

namespace Database\Factories;

use App\Models\Vehicule;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Vehicule>
 */
class VehiculeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'immatriculation' => strtoupper(fake()->bothify('??-###-??')),
            'marque' => fake()->randomElement(['Toyota', 'Peugeot', 'Renault', 'Mercedes']),
            'modele' => fake()->word(),
            'couleur' => fake()->safeColorName(),
            'annee' => fake()->numberBetween(2010, 2024),
            'kilometrage' => fake()->numberBetween(10000, 200000),
            'carrosserie' => fake()->randomElement(['Berline', 'SUV', 'Pickup']),
            'energie' => fake()->randomElement(['Essence', 'Diesel', 'Hybride']),
            'boite' => fake()->randomElement(['Manuelle', 'Automatique']),
        ];
    }
}
