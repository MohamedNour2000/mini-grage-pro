import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { getVehicules, getTechniciens, createReparation } from '../services/api';

export default function ReparationFormPage() {
  const navigate = useNavigate();
  const [vehicules, setVehicules] = useState([]);
  const [techniciens, setTechniciens] = useState([]);
  const [errors, setErrors] = useState({});
  const [submitting, setSubmitting] = useState(false);
  const [form, setForm] = useState({
    vehicule_id: '',
    date: '',
    duree_main_oeuvre: '',
    objet_reparation: '',
    techniciens: [],
  });

  useEffect(() => {
    Promise.all([getVehicules(), getTechniciens()]).then(([vRes, tRes]) => {
      setVehicules(vRes.data);
      setTechniciens(tRes.data);
    });
  }, []);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
    setErrors((prev) => ({ ...prev, [name]: null }));
  };

  const handleTechniciens = (e) => {
    const selected = Array.from(e.target.selectedOptions).map((o) => o.value);
    setForm((prev) => ({ ...prev, techniciens: selected }));
    setErrors((prev) => ({ ...prev, techniciens: null }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setSubmitting(true);
    try {
      await createReparation(form);
      navigate('/reparations');
    } catch (err) {
      if (err.response?.status === 422) {
        setErrors(err.response.data.errors ?? {});
      }
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <>
      <div className="d-flex justify-content-between align-items-center mb-4">
        <h2 className="fw-bold mb-0">Nouvelle Réparation</h2>
        <button className="btn btn-outline-secondary" onClick={() => navigate(-1)}>← Retour</button>
      </div>

      <div className="card border-0 shadow-sm">
        <div className="card-body p-4">
          <form onSubmit={handleSubmit} noValidate>

            <div className="mb-3">
              <label className="form-label fw-semibold">Véhicule</label>
              <select
                name="vehicule_id"
                className={`form-select ${errors.vehicule_id ? 'is-invalid' : ''}`}
                value={form.vehicule_id}
                onChange={handleChange}
              >
                <option value="">-- Sélectionner un véhicule --</option>
                {vehicules.map((v) => (
                  <option key={v.id} value={v.id}>
                    {v.marque} {v.modele} ({v.immatriculation})
                  </option>
                ))}
              </select>
              {errors.vehicule_id && <div className="invalid-feedback">{errors.vehicule_id[0]}</div>}
            </div>

            <div className="mb-3">
              <label className="form-label fw-semibold">Date</label>
              <input
                type="date"
                name="date"
                className={`form-control ${errors.date ? 'is-invalid' : ''}`}
                value={form.date}
                onChange={handleChange}
              />
              {errors.date && <div className="invalid-feedback">{errors.date[0]}</div>}
            </div>

            <div className="mb-3">
              <label className="form-label fw-semibold">Durée main-d'œuvre (heures)</label>
              <input
                type="number"
                name="duree_main_oeuvre"
                min="0.5"
                step="0.5"
                className={`form-control ${errors.duree_main_oeuvre ? 'is-invalid' : ''}`}
                value={form.duree_main_oeuvre}
                onChange={handleChange}
              />
              {errors.duree_main_oeuvre && <div className="invalid-feedback">{errors.duree_main_oeuvre[0]}</div>}
            </div>

            <div className="mb-3">
              <label className="form-label fw-semibold">Objet de la réparation</label>
              <textarea
                name="objet_reparation"
                rows={3}
                className={`form-control ${errors.objet_reparation ? 'is-invalid' : ''}`}
                value={form.objet_reparation}
                onChange={handleChange}
              />
              {errors.objet_reparation && <div className="invalid-feedback">{errors.objet_reparation[0]}</div>}
            </div>

            <div className="mb-4">
              <label className="form-label fw-semibold">Techniciens <small className="text-muted">(Ctrl+clic pour sélection multiple)</small></label>
              <select
                multiple
                name="techniciens"
                className={`form-select ${errors.techniciens ? 'is-invalid' : ''}`}
                value={form.techniciens}
                onChange={handleTechniciens}
                size={Math.min(techniciens.length || 3, 5)}
              >
                {techniciens.map((t) => (
                  <option key={t.id} value={t.id}>
                    {t.prenom} {t.nom} — {t.specialite}
                  </option>
                ))}
              </select>
              {errors.techniciens && <div className="invalid-feedback">{errors.techniciens[0]}</div>}
            </div>

            <button type="submit" className="btn btn-dark px-4" disabled={submitting}>
              {submitting ? <span className="spinner-border spinner-border-sm me-2" /> : null}
              Enregistrer
            </button>
          </form>
        </div>
      </div>
    </>
  );
}
