@extends('base')

@section('title', 'Liste des Véhicules')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2>Parc Automobile</h2>
    <form action="{{ route('vehicules.index') }}" method="GET" class="d-flex col-md-4">
        <input type="text" name="search" value="{{ $search }}" class="form-control me-2" placeholder="Marque ou Immatriculation...">
        <button type="submit" class="btn btn-primary">Rechercher</button>
    </form>
</div>

<div class="row g-4">
    @forelse($vehicules as $vehicule)
        <div class="col-md-4">
            <x-vehicule-card :vehicule="$vehicule" />
        </div>
    @empty
        <div class="col-12"><p class="alert alert-warning">Aucun véhicule trouvé.</p></div>
    @endforelse
</div>

<div class="mt-4">
    {{ $vehicules->links('pagination::bootstrap-5') }}
</div>
@endsection
