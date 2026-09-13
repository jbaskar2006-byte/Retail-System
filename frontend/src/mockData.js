// Mock Data Engine for Published / Standalone Deployments (GitHub Pages)

export const mockWorkers = [
  { id: 1, name: 'Rajan Kumar', role: 'Store Manager', phone: '9111111101', store_id: 1, store_name: 'Store 1 - North', salary: 35000 },
  { id: 2, name: 'Premi Singh', role: 'Cashier', phone: '9111111102', store_id: 1, store_name: 'Store 1 - North', salary: 18000 },
  { id: 3, name: 'Dinesh Rao', role: 'Stock Manager', phone: '9111111103', store_id: 1, store_name: 'Store 1 - North', salary: 22000 },
  { id: 4, name: 'Leela Krishnan', role: 'Sales Executive', phone: '9111111104', store_id: 1, store_name: 'Store 1 - North', salary: 16000 },
  { id: 5, name: 'Muthukumar P', role: 'Security Guard', phone: '9111111105', store_id: 1, store_name: 'Store 1 - North', salary: 14000 },
  { id: 6, name: 'Kumaresan V', role: 'Store Manager', phone: '9222222201', store_id: 2, store_name: 'Store 2 - South', salary: 38000 },
  { id: 7, name: 'Subramani R', role: 'Cashier', phone: '9222222202', store_id: 2, store_name: 'Store 2 - South', salary: 19000 },
  { id: 8, name: 'Nithya K', role: 'Stock Manager', phone: '9222222203', store_id: 2, store_name: 'Store 2 - South', salary: 23000 },
  { id: 9, name: 'Venkateswara P', role: 'Store Manager', phone: '9333333301', store_id: 3, store_name: 'Store 3 - East', salary: 40000 },
  { id: 10, name: 'Lalitha S', role: 'Cashier', phone: '9333333302', store_id: 3, store_name: 'Store 3 - East', salary: 20000 }
];

export const mockSalaries = [
  { worker_name: 'Rajan Kumar', role: 'Store Manager', basic_salary: 35000, bonus: 3500, total_salary: 38500, month: 'March-2025', store_id: 1 },
  { worker_name: 'Kumaresan V', role: 'Store Manager', basic_salary: 38000, bonus: 4560, total_salary: 42560, month: 'March-2025', store_id: 2 },
  { worker_name: 'Venkateswara P', role: 'Store Manager', basic_salary: 40000, bonus: 6000, total_salary: 46000, month: 'March-2025', store_id: 3 },
  { worker_name: 'Dinesh Rao', role: 'Stock Manager', basic_salary: 22000, bonus: 2200, total_salary: 24200, month: 'March-2025', store_id: 1 },
  { worker_name: 'Nithya K', role: 'Stock Manager', basic_salary: 23000, bonus: 2760, total_salary: 25760, month: 'March-2025', store_id: 2 },
  { worker_name: 'Premi Singh', role: 'Cashier', basic_salary: 18000, bonus: 1800, total_salary: 19800, month: 'March-2025', store_id: 1 },
  { worker_name: 'Subramani R', role: 'Cashier', basic_salary: 19000, bonus: 2280, total_salary: 21280, month: 'March-2025', store_id: 2 },
  { worker_name: 'Lalitha S', role: 'Cashier', basic_salary: 20000, bonus: 3000, total_salary: 23000, month: 'March-2025', store_id: 3 },
  { worker_name: 'Leela Krishnan', role: 'Sales Executive', basic_salary: 16000, bonus: 1600, total_salary: 17600, month: 'April-2025', store_id: 1 },
  { worker_name: 'Muthukumar P', role: 'Security Guard', basic_salary: 14000, bonus: 1400, total_salary: 15400, month: 'April-2025', store_id: 1 }
];

export const mockProducts = [
  { id: 1, name: 'Tomato', category: 'Vegetables', price: 30, cost_price: 18, stock: 150, expiry_date: '2026-09-20', store_id: 1, store_name: 'Store 1 - North', days_to_expiry: 5, profit_margin: 12 },
  { id: 2, name: 'Potato', category: 'Vegetables', price: 25, cost_price: 15, stock: 200, expiry_date: '2026-09-25', store_id: 1, store_name: 'Store 1 - North', days_to_expiry: 10, profit_margin: 10 },
  { id: 3, name: 'Milk 1L', category: 'Dairy', price: 55, cost_price: 33, stock: 4, expiry_date: '2026-09-15', store_id: 1, store_name: 'Store 1 - North', days_to_expiry: 2, profit_margin: 22 },
  { id: 4, name: 'Basmati Rice 5kg', category: 'Grocery', price: 450, cost_price: 270, stock: 80, expiry_date: '2027-09-12', store_id: 1, store_name: 'Store 1 - North', days_to_expiry: 365, profit_margin: 180 },
  { id: 5, name: 'Paneer 200g', category: 'Dairy', price: 90, cost_price: 54, stock: 0, expiry_date: '2026-09-16', store_id: 2, store_name: 'Store 2 - South', days_to_expiry: 3, profit_margin: 36 },
  { id: 6, name: 'Coca-Cola 750ml', category: 'Beverages', price: 45, cost_price: 27, stock: 180, expiry_date: '2027-03-12', store_id: 1, store_name: 'Store 1 - North', days_to_expiry: 180, profit_margin: 18 },
  { id: 7, name: 'Lays Chips 75g', category: 'Snacks', price: 20, cost_price: 12, stock: 250, expiry_date: '2026-12-12', store_id: 1, store_name: 'Store 1 - North', days_to_expiry: 90, profit_margin: 8 }
];

export const mockDashboard = {
  total_revenue: 145890,
  total_orders: 1050,
  total_products: 270,
  total_customers: 315,
  total_workers: 75,
  low_stock_items: 8,
  out_of_stock: 3,
  expiring_items: 5,
  total_profit: 48500,
  avg_order_value: 138.94,
  online_orders: 480,
  store_orders: 570,
  present_workers_today: 68,
  absent_workers_today: 7,
  total_emi: 29500,
  store_revenues: [
    { store_id: 1, store_name: 'Store 1 - North', revenue: 48500, orders: 300, profit: 16200 },
    { store_id: 2, store_name: 'Store 2 - South', revenue: 52400, orders: 350, profit: 17800 },
    { store_id: 3, store_name: 'Store 3 - East', revenue: 44990, orders: 400, profit: 14500 }
  ],
  system_health: 96.5,
  alert_count: 5
};

export const mockCategorySales = [
  { category: 'Grocery', revenue: 45200, quantity: 420 },
  { category: 'Vegetables', revenue: 28400, quantity: 850 },
  { category: 'Dairy', revenue: 22100, quantity: 610 },
  { category: 'Beverages', revenue: 19500, quantity: 490 },
  { category: 'Snacks', revenue: 16800, quantity: 580 },
  { category: 'Personal Care', revenue: 13890, quantity: 210 }
];

export const mockTrends = Array.from({ length: 30 }, (_, i) => {
  const date = new Date();
  date.setDate(date.getDate() - (29 - i));
  return {
    date: date.toISOString().split('T')[0],
    revenue: Math.floor(3500 + Math.random() * 2500),
    orders: Math.floor(25 + Math.random() * 20),
    store_id: 0
  };
});

export const mockAlerts = [
  { id: 1, store_id: 2, alert_type: 'danger', title: 'Out of Stock', message: 'Paneer is OUT OF STOCK at Store 2 - South', is_read: false, created_at: '2026-09-12 18:30:00' },
  { id: 2, store_id: 1, alert_type: 'warning', title: 'Low Stock Alert', message: 'Milk 1L has only 4 units remaining at Store 1 - North', is_read: false, created_at: '2026-09-12 19:15:00' },
  { id: 3, store_id: 1, alert_type: 'warning', title: 'Expiry Alert', message: 'Spinach expires in 2 days at Store 1 - North', is_read: false, created_at: '2026-09-12 19:40:00' },
  { id: 4, store_id: 3, alert_type: 'info', title: 'Attendance Audit', message: 'Store 3 workforce attendance registered at 88%', is_read: true, created_at: '2026-09-12 20:00:00' }
];

export const mockCompare = [
  { store_id: 1, store_name: 'Store 1 - North', revenue: 48500, orders: 300, products: 90, low_stock: 3, out_of_stock: 1, expiring: 2, workers: 25, attendance_rate: 88, total_salary: 435000, profit: 16200, health_score: 95 },
  { store_id: 2, store_name: 'Store 2 - South', revenue: 52400, orders: 350, products: 90, low_stock: 4, out_of_stock: 2, expiring: 2, workers: 25, attendance_rate: 84, total_salary: 462000, profit: 17800, health_score: 92 },
  { store_id: 3, store_name: 'Store 3 - East', revenue: 44990, orders: 400, products: 90, low_stock: 1, out_of_stock: 0, expiring: 1, workers: 25, attendance_rate: 92, total_salary: 488000, profit: 14500, health_score: 98 }
];

export const mockAds = [
  { id: 1, store_id: 1, store_name: 'Store 1 - North', type: 'Google Ads', amount: 35000, month: 'March-2025', platform: 'Google', impressions: 72000, conversions: 2100, roi: 6.0 },
  { id: 2, store_id: 1, store_name: 'Store 1 - North', type: 'Social Media', amount: 25000, month: 'March-2025', platform: 'Instagram', impressions: 52000, conversions: 1500, roi: 6.0 },
  { id: 3, store_id: 2, store_name: 'Store 2 - South', type: 'YouTube Ads', amount: 25000, month: 'March-2025', platform: 'YouTube', impressions: 140000, conversions: 3600, roi: 14.4 }
];

export const mockLoans = [
  { id: 1, store_id: 1, store_name: 'Store 1 - North', total_loan: 500000, interest_rate: 12.5, emi_amount: 9500, remaining_balance: 420000, start_date: '2023-01-01', end_date: '2027-01-01', lender: 'SBI Bank', status: 'active' },
  { id: 2, store_id: 2, store_name: 'Store 2 - South', total_loan: 800000, interest_rate: 11.5, emi_amount: 16000, remaining_balance: 680000, start_date: '2022-06-01', end_date: '2027-06-01', lender: 'ICICI Bank', status: 'active' }
];

export const mockDemand = [
  { product_id: 1, name: 'Maggi Noodles 70g', category: 'Packaged Food', avg_daily_sales: 42, stock: 500, days_of_stock: 11.9, store_id: 1, store_name: 'Store 1 - North', status: 'OK', reorder_quantity: 420 },
  { product_id: 2, name: 'Milk 1L', category: 'Dairy', avg_daily_sales: 65, stock: 4, days_of_stock: 0.1, store_id: 1, store_name: 'Store 1 - North', status: 'Critical', reorder_quantity: 1950 },
  { product_id: 3, name: 'Tomato', category: 'Vegetables', avg_daily_sales: 25, stock: 150, days_of_stock: 6.0, store_id: 1, store_name: 'Store 1 - North', status: 'Low', reorder_quantity: 500 }
];
