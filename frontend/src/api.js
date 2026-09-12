import axios from 'axios';

const hostname = typeof window !== 'undefined' && window.location.hostname ? window.location.hostname : 'localhost';
const BASE = process.env.REACT_APP_API_URL || `http://${hostname}:8080/api`;

const api = axios.create({ baseURL: BASE });

export const getDashboard = (store = 0) => api.get(`/dashboard?store=${store}`);
export const getProducts = (store = 0, category = '') => api.get(`/products?store=${store}&category=${category}`);
export const getOrders = (store = 0, limit = 50) => api.get(`/orders?store=${store}&limit=${limit}`);
export const placeOrder = (data) => api.post('/orders', data);
export const refillInventory = (data) => api.post('/inventory/refill', data);

export const getRevenue = (store = 0) => api.get(`/analytics/revenue?store=${store}`);
export const getCategorySales = (store = 0) => api.get(`/analytics/sales?store=${store}`);
export const getTrends = (store = 0, days = 30) => api.get(`/analytics/trends?store=${store}&days=${days}`);
export const getCustomers = (store = 0) => api.get(`/analytics/customers?store=${store}`);
export const getWorkforce = (store = 0) => api.get(`/analytics/workforce?store=${store}`);
export const getFinance = (store = 0) => api.get(`/analytics/finance?store=${store}`);
export const getExpiry = (store = 0, days = 7) => api.get(`/analytics/expiry?store=${store}&days=${days}`);
export const getUnsold = (store = 0) => api.get(`/analytics/unsold?store=${store}`);
export const getTopProducts = (store = 0, top = 10) => api.get(`/analytics/top-products?store=${store}&top=${top}`);
export const getAIDecisions = (store = 0) => api.get(`/analytics/ai-decisions?store=${store}`);
export const getStoreCompare = () => api.get('/analytics/store-compare');
export const getSalary = (store = 0) => api.get(`/analytics/salary?store=${store}`);
export const getLoans = (store = 0) => api.get(`/analytics/loans?store=${store}`);
export const getAds = (store = 0) => api.get(`/analytics/ads?store=${store}`);
export const getDemand = (store = 0) => api.get(`/analytics/demand?store=${store}`);

export const getAlerts = (store = 0) => api.get(`/alerts?store=${store}`);
export const markAlertRead = (id) => api.put(`/alerts/${id}/read`);

export const getWorkers = (store = 0) => api.get(`/workers?store=${store}`);
export const getAttendance = (store = 0) => api.get(`/attendance?store=${store}`);

export const simulate = (type, storeID = 0) => api.post('/simulate', { type, store_id: storeID });
export const getHealth = () => api.get('/health');

export default api;
