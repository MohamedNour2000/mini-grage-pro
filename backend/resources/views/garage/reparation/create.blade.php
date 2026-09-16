@extends('base')

@section('title', 'Nouvelle Réparation')

@section('content')
<div class="col-md-8 mx-auto card p-4 shadow-sm">
    <h3 class="mb-4">Créer une Réparation</h3>
    <form action="{{ route('reparations.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label class="form-label">Sélectionner le Véhicule :</label>
            <select name="vehicule_id" class="form-select" required>
                @foreach($vehicules as $v)
                    <option value="{{ $v->id }}">{{ $v->marque }} {{ $v->modele }} ({{ $v->immatriculation }})</option>
                @endforeach
            </select>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Date :</label>
                <input type="date" name="date" class="form-control" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Durée Main d'Œuvre (heures) :</label>
                <input type="number" step="0.5" name="duree_main_oeuvre" class="form-control" required>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Objet de la réparation :</label>
            <textarea name="objet_reparation" class="form-control" rows="3" required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Techniciens (Sélection multiple) :</label>
            <div class="border p-3 rounded">
                @foreach($techniciens as $tech)
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="techniciens[]" value="{{ $tech->id }}" id="tech-{{ $tech->id }}">
                        <label class="form-check-label" for="tech-{{ $tech->id }}">
                            {{ $tech->prenom }} {{ $tech->nom }} (Spécialité: {{ $tech->specialite }})
                        </label>
                    </div>
                @endforeach
            </div>
        </div>

        <button type="submit" class="btn btn-success">Enregistrer la Réparation</button>
    </form>
</div>
@endsection
