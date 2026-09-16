import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { getReparations } from '../services/api';

export default function ReparationListPage() {
  const [reparations, setReparations] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    getReparations()
      .then((res) => setReparations(res.data))
      .catch(() => setError('Impossible de charger les réparations.'))
      .finally(() => setLoading(false));
  }, []);

  if (loading) return <div className="text-center py-5"><div className="spinner-border" /></div>;
  if (error) return <div className="alert alert-danger">{error}</div>;

  return (
    <>
      <div className="d-flex justify-content-between align-items-center mb-4">
        <h2 className="fw-bold mb-0">Réparations</h2>
        <Link to="/reparations/new" className="btn btn-dark">+ Nouvelle Réparation</Link>
      </div>

      <div className="card border-0 shadow-sm">
        <div className="card-body p-0">
          <table className="table table-hover mb-0">
            <thead className="table-dark">
              <tr>
                <th>#</th>
                <th>Véhicule</th>
                <th>Immatriculation</th>
                <th>Objet</th>
                <th>Date</th>
                <th>Durée (h)</th>
                <th>Techniciens</th>
              </tr>
            </thead>
            <tbody>
              {reparations.map((r) => (
                <tr key={r.id}>
                  <td>{r.id}</td>
                  <td>{r.vehicule?.marque ?? '—'}</td>
                  <td><span className="badge bg-secondary">{r.vehicule?.immatriculation ?? '—'}</span></td>
                  <td>{r.objet_reparation}</td>
                  <td>{r.date}</td>
                  <td>{r.duree_main_oeuvre}</td>
                  <td>
                    {r.techniciens?.length > 0
                      ? r.techniciens.map((t) => (
                          <span key={t.id} className="badge bg-info text-dark me-1">
                            {t.prenom} {t.nom}
                          </span>
                        ))
                      : <span className="text-muted">—</span>}
                  </td>
                </tr>
              ))}
              {reparations.length === 0 && (
                <tr><td colSpan={7} className="text-center text-muted py-3">Aucune réparation enregistrée</td></tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </>
  );
}
