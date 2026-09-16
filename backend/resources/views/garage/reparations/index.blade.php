@extends('base')

@section('title', 'Liste des Réparations')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2>Réparations</h2>
    <a href="{{ route('reparations.create') }}" class="btn btn-success">+ Nouvelle Réparation</a>
</div>

<div class="list-group">
    @forelse($reparations as $reparation)
        <div class="list-group-item list-group-item-action mb-2 rounded shadow-sm">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1 text-primary">{{ $reparation->objet_reparation }}</h5>
                <small class="text-muted">{{ $reparation->date }}</small>
            </div>
            <p class="mb-1">
                <strong>Véhicule :</strong> {{ $reparation->vehicule->marque ?? 'N/A' }} {{ $reparation->vehicule->modele ?? '' }}
                ({{ $reparation->vehicule->immatriculation ?? 'Sans immatriculation' }})
            </p>
            <p class="mb-1"><strong>Main-d'œuvre :</strong> {{ $reparation->duree_main_oeuvre }} heures</p>
            <small class="text-muted">
                <strong>Techniciens :</strong>
                @forelse($reparation->techniciens as $tech)
                    <span class="badge bg-info text-dark">{{ $tech->prenom }} {{ $tech->nom }}</span>
                @empty
                    <span class="badge bg-secondary">Aucun technicien affecté</span>
                @endforelse
            </small>
        </div>
    @empty
        <div class="alert alert-info">Aucune réparation enregistrée.</div>
    @endforelse
</div>

<div class="mt-4">
    {{ $reparations->links('pagination::bootstrap-5') }}
</div>
@endsection
