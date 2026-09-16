<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
   public function run(): void
    {
        $techniciens = \App\Models\Technicien::factory(5)->create();

        \App\Models\Vehicule::factory(10)->create()->each(function ($vehicule) use ($techniciens) {
            $reparations = \App\Models\Reparation::factory(2)->create(['vehicule_id' => $vehicule->id]);
            foreach ($reparations as $reparation) {
                $reparation->techniciens()->attach($techniciens->random(rand(1, 2)));
            }
        });
    }
}
