@extends('base')

@section('title', 'Détails du Véhicule')

@section('content')
<div class="card p-4 shadow-sm mb-4">
    <div class="d-flex justify-content-between align-items-center">
        <h2>{{ $vehicule->marque }} {{ $vehicule->modele }}</h2>
        <span class="badge bg-secondary fs-6">{{ $vehicule->immatriculation }}</span>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-4"><p><strong>Année :</strong> {{ $vehicule->annee }}</p></div>
        <div class="col-md-4"><p><strong>Énergie :</strong> {{ $vehicule->energie }}</p></div>
        <div class="col-md-4"><p><strong>Kilométrage :</strong> {{ number_format($vehicule->kilometrage, 0, ',', ' ') }} km</p></div>
        <div class="col-md-4"><p><strong>Couleur :</strong> {{ $vehicule->couleur }}</p></div>
        <div class="col-md-4"><p><strong>Boîte :</strong> {{ $vehicule->boite }}</p></div>
        <div class="col-md-4"><p><strong>Carrosserie :</strong> {{ $vehicule->carrosserie }}</p></div>
    </div>
</div>

<h3 class="mb-3">Historique des Réparations</h3>
<div class="list-group">
    @forelse($vehicule->reparations as $reparation)
        <div class="list-group-item list-group-item-action">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1 text-primary">{{ $reparation->objet_reparation }}</h5>
                <small class="text-muted">Date : {{ $reparation->date }}</small>
            </div>
            <p class="mb-1"><strong>Main-d'œuvre :</strong> {{ $reparation->duree_main_oeuvre }} heures</p>
            <small class="text-muted">
                <strong>Techniciens :</strong>
                @foreach($reparation->techniciens as $tech)
                    <span class="badge bg-info text-dark">{{ $tech->prenom }} {{ $tech->nom }} ({{ $tech->specialite }})</span>
                @endforeach
            </small>
        </div>
    @empty
        <div class="alert alert-info">Aucune réparation enregistrée pour ce véhicule.</div>
    @endforelse
</div>

<div class="mt-4">
    <a href="{{ route('vehicules.index') }}" class="btn btn-secondary">← Retour au parc</a>
</div>
@endsection
