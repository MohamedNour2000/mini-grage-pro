<div class="card h-100 shadow-sm border-0">
    <div class="card-body">
        <h5 class="card-title text-primary">{{ $vehicule->marque }} {{ $vehicule->modele }}</h5>
        <h6 class="card-subtitle mb-2 text-muted">{{ $vehicule->immatriculation }}</h6>
        <p class="card-text mb-1"><strong>Année :</strong> {{ $vehicule->annee }}</p>
        <p class="card-text mb-1"><strong>Énergie :</strong> {{ $vehicule->energie }}</p>
        <p class="card-text"><strong>Kilométrage :</strong> {{ number_format($vehicule->kilometrage, 0, ',', ' ') }} km</p>
    </div>
    <div class="card-footer bg-white border-0 d-flex gap-2">
        <a href="{{ route('vehicules.show', $vehicule) }}" class="btn btn-outline-primary btn-sm w-50">Voir Détails</a>
        <a href="{{ route('reparations.index') }}" class="btn btn-outline-success btn-sm w-50">Réparations</a>
    </div>
</div>
