<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;
use App\Models\Vehicule;

class VehiculeCard extends Component
{
    public function __construct(public Vehicule $vehicule) {}

    public function render(): View|Closure|string
    {
        return view('components.vehicule-card');
    }
}
