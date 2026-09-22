import { useState } from 'react';
import { Link, NavLink, Outlet } from 'react-router-dom';

export default function Layout() {
  const [open, setOpen] = useState(false);

  return (
    <div className="d-flex flex-column min-vh-100">
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark px-4">
        <Link className="navbar-brand fw-bold fs-4" to="/">
          🔧 Mini Garage Pro
        </Link>
        <button
          className="navbar-toggler"
          type="button"
          onClick={() => setOpen(o => !o)}
          aria-expanded={open}
        >
          <span className="navbar-toggler-icon" />
        </button>
        <div className={`collapse navbar-collapse${open ? ' show' : ''}`}>
          <ul className="navbar-nav ms-auto gap-2">
            <li className="nav-item">
              <NavLink className="nav-link" to="/" onClick={() => setOpen(false)}>Dashboard</NavLink>
            </li>
            <li className="nav-item">
              <NavLink className="nav-link" to="/reparations" onClick={() => setOpen(false)}>Réparations</NavLink>
            </li>
            <li className="nav-item">
              <NavLink className="nav-link" to="/reparations/new" onClick={() => setOpen(false)}>+ Nouvelle Réparation</NavLink>
            </li>
          </ul>
        </div>
      </nav>

      <main className="flex-grow-1 container py-4">
        <Outlet />
      </main>

      <footer className="bg-dark text-white text-center py-3">
        <small>© 2026 Mini Garage Pro — Tous droits réservés</small>
      </footer>
    </div>
  );
}
