<?php

namespace Tests\Feature;

use App\Models\Technicien;
use App\Models\Vehicule;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ReparationTest extends TestCase
{
    use RefreshDatabase;

    public function test_la_page_des_reparations_s_affiche_correctement()
    {
        $response = $this->get('/reparations');
        $response->assertStatus(200);
    }

    public function test_un_formulaire_de_reparation_rejette_les_donnees_vides()
    {
        $response = $this->post('/reparations', []);

        $response->assertSessionHasErrors(['vehicule_id', 'date', 'duree_main_oeuvre', 'objet_reparation']);
    }

    public function test_parcours_navigation_et_soumission_formulaire()
    {
        $vehicule = Vehicule::create([
            'immatriculation' => 'ZD-573-GI',
            'marque'          => 'Mercedes',
            'modele'          => 'Classe C',
            'annee'           => 2020,
            'kilometrage'     => 50000,
        ]);

        // Navigation : page liste réparations
        $this->get('/reparations')->assertStatus(200);

        // Navigation : page nouvelle réparation
        $this->get('/reparations/create')->assertStatus(200);

        $technicien = Technicien::create([
            'nom'        => 'Dupont',
            'prenom'     => 'Jean',
            'specialite' => 'Mécanique',
        ]);

        // Soumission du formulaire
        $response = $this->post('/reparations', [
            'vehicule_id'       => $vehicule->id,
            'date'              => '2026-09-14',
            'duree_main_oeuvre' => 5,
            'objet_reparation'  => 'Test reparation',
            'techniciens'       => [$technicien->id],
        ]);

        $response->assertRedirect();
        $this->assertDatabaseHas('reparations', [
            'vehicule_id'      => $vehicule->id,
            'date'             => '2026-09-14',
            'objet_reparation' => 'Test reparation',
        ]);
    }
}
