# 🔧 Mini Garage Pro

Application web Full-Stack découplée pour la gestion d'un garage automobile.

## Stack technique

| Couche     | Technologie                        |
|------------|------------------------------------|
| Frontend   | React 18, Vite, React Router, Bootstrap 5 |
| Backend    | Laravel 11, PHP 8.3                |
| Base de données | MySQL / SQLite (tests)        |
| API        | REST JSON — préfixe `/api/v1`      |

## Structure du projet

```
Mini_projet_num_Mohamed_Nour_Sylla_S5/
├── backend/     # API Laravel 11
├── frontend/    # Application React + Vite
└── README.md
```

## Fonctionnalités

- **Dashboard** — KPIs (nombre de réparations, total heures main-d'œuvre, véhicules enregistrés) + tableau des dernières interventions
- **Liste des réparations** — Tableau complet avec véhicule, techniciens, date et durée
- **Formulaire de réparation** — Création avec sélection du véhicule, techniciens, date et objet

## Lancer le projet

### Prérequis
- PHP 8.3+, Composer, Node.js 18+, MySQL

### Backend (Laravel API)

```bash
cd backend
composer install
cp .env.example .env      # Configurer DB_DATABASE, DB_USERNAME, DB_PASSWORD
php artisan key:generate
php artisan migrate --seed
php artisan serve
```

API disponible sur : `http://localhost:8000/api/v1`

### Frontend (React)

```bash
cd frontend
npm install
npm run dev
```

Application disponible sur : `http://localhost:5173`

## Endpoints API

| Méthode | Endpoint                  | Description                  |
|---------|---------------------------|------------------------------|
| GET     | /api/v1/reparations       | Liste toutes les réparations |
| POST    | /api/v1/reparations       | Créer une réparation         |
| GET     | /api/v1/vehicules         | Liste tous les véhicules     |
| GET     | /api/v1/techniciens       | Liste tous les techniciens   |

## Tests

```bash
cd backend
php artisan test
```

---

Projet réalisé dans le cadre du cours **Développement Web Niveau Avancé** — OIF S5
