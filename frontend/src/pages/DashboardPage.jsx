import { useEffect, useState } from 'react';
import { getReparations, getVehicules } from '../services/api';
import { Link } from 'react-router-dom';

export default function DashboardPage() {
  const [reparations, setReparations] = useState([]);
  const [vehiculesCount, setVehiculesCount] = useState(0);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Promise.all([getReparations(), getVehicules()])
      .then(([repRes, vehRes]) => {
        setReparations(repRes.data);
        setVehiculesCount(vehRes.data.length);
      })
      .finally(() => setLoading(false));
  }, []);

  const totalHeures = reparations.reduce(
    (sum, r) => sum + parseFloat(r.duree_main_oeuvre || 0),
    0
  );

  if (loading) return <div className="text-center py-5"><div className="spinner-border" /></div>;

  return (
    <>
      <h2 className="mb-4 fw-bold">Tableau de bord</h2>

      {/* KPI Cards */}
      <div className="row g-4 mb-5">
        <div className="col-md-4">
          <div className="card border-0 shadow-sm text-white bg-primary h-100">
            <div className="card-body text-center py-4">
              <div className="fs-1 fw-bold">{reparations.length}</div>
              <div className="mt-1">Réparations totales</div>
            </div>
          </div>
        </div>
        <div className="col-md-4">
          <div className="card border-0 shadow-sm text-white bg-success h-100">
            <div className="card-body text-center py-4">
              <div className="fs-1 fw-bold">{totalHeures.toFixed(1)}h</div>
              <div className="mt-1">Total heures main-d'œuvre</div>
            </div>
          </div>
        </div>
        <div className="col-md-4">
          <div className="card border-0 shadow-sm text-white bg-warning h-100">
            <div className="card-body text-center py-4">
              <div className="fs-1 fw-bold">{vehiculesCount}</div>
              <div className="mt-1">Véhicules enregistrés</div>
            </div>
          </div>
        </div>
      </div>

      {/* Tableau résumé */}
      <div className="card border-0 shadow-sm">
        <div className="card-header bg-dark text-white d-flex justify-content-between align-items-center">
          <span className="fw-semibold">Dernières interventions</span>
          <Link to="/reparations" className="btn btn-sm btn-outline-light">Voir tout</Link>
        </div>
        <div className="card-body p-0">
          <table className="table table-hover mb-0">
            <thead className="table-light">
              <tr>
                <th>#</th>
                <th>Véhicule</th>
                <th>Objet</th>
                <th>Date</th>
                <th>Durée (h)</th>
              </tr>
            </thead>
            <tbody>
              {reparations.slice(0, 5).map((r) => (
                <tr key={r.id}>
                  <td>{r.id}</td>
                  <td>{r.vehicule ? `${r.vehicule.marque} (${r.vehicule.immatriculation})` : '—'}</td>
                  <td>{r.objet_reparation}</td>
                  <td>{r.date}</td>
                  <td>{r.duree_main_oeuvre}</td>
                </tr>
              ))}
              {reparations.length === 0 && (
                <tr><td colSpan={5} className="text-center text-muted py-3">Aucune réparation</td></tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </>
  );
}
