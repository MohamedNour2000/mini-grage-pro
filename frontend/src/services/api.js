import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:8000/api/v1',
  headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
});

export const getReparations = () => api.get('/reparations');
export const createReparation = (data) => api.post('/reparations', data);
export const getVehicules = () => api.get('/vehicules');
export const getTechniciens = () => api.get('/techniciens');

export default api;
