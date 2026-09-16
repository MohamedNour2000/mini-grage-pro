<?php

namespace Database\Factories;

use App\Models\Reparation;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Reparation>
 */
class ReparationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'vehicule_id' => \App\Models\Vehicule::factory(),
            'date' => fake()->date(),
            'duree_main_oeuvre' => fake()->randomFloat(2, 1, 10),
            'objet_reparation' => fake()->randomElement([
                'Vidange moteur', 'Remplacement des plaquettes de frein', 'Changement des pneus',
                'Révision générale', 'Remplacement de la batterie', 'Réparation de la climatisation',
                'Changement des bougies', 'Remplacement du filtre à air', 'Réparation de la boîte de vitesses',
                'Remplacement de l\'embrayage', 'Diagnostic électronique', 'Remplacement du pare-brise',
            ]),
        ];
    }
}
