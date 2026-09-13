import React from 'react';
import { HashRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import { Toaster } from 'react-hot-toast';

import Sidebar from './components/Sidebar';
import { StoreProvider } from './context/StoreContext';

import Dashboard from './pages/Dashboard';
import Revenue from './pages/Revenue';
import Sales from './pages/Sales';
import Expiry from './pages/Expiry';
import Workforce from './pages/Workforce';
import Finance from './pages/Finance';
import Alerts from './pages/Alerts';
import Products from './pages/Products';
import Customers from './pages/Customers';
import Compare from './pages/Compare';
import Orders from './pages/Orders';
import Simulate from './pages/Simulate';
import Unsold from './pages/Unsold';
import Demand from './pages/Demand';
import Salary from './pages/Salary';
import Attendance from './pages/Attendance';
import LoansPage from './pages/Finance';
import AdsPage from './pages/Finance';

function App() {
  return (
    <Router>
      <StoreProvider>
        <div className="app-layout">
          <Sidebar />
          <main className="main-content">
            <Routes>
              <Route path="/" element={<Dashboard />} />
              <Route path="/revenue" element={<Revenue />} />
              <Route path="/sales" element={<Sales />} />
              <Route path="/expiry" element={<Expiry />} />
              <Route path="/workforce" element={<Workforce />} />
              <Route path="/finance" element={<Finance />} />
              <Route path="/alerts" element={<Alerts />} />
              <Route path="/products" element={<Products />} />
              <Route path="/customers" element={<Customers />} />
              <Route path="/compare" element={<Compare />} />
              <Route path="/orders" element={<Orders />} />
              <Route path="/simulate" element={<Simulate />} />
              <Route path="/unsold" element={<Unsold />} />
              <Route path="/demand" element={<Demand />} />
              <Route path="/salary" element={<Salary />} />
              <Route path="/attendance" element={<Attendance />} />
              <Route path="/loans" element={<LoansPage />} />
              <Route path="/ads" element={<AdsPage />} />
              
              {/* Fallback */}
              <Route path="*" element={<Navigate to="/" replace />} />
            </Routes>
          </main>
        </div>
        <Toaster 
          position="bottom-right"
          toastOptions={{
            style: {
              background: '#0f1628',
              color: '#f0f4ff',
              border: '1px solid rgba(255,255,255,0.08)',
              backdropFilter: 'blur(10px)',
              fontSize: '13px',
              fontFamily: 'Inter, sans-serif'
            }
          }}
        />
      </StoreProvider>
    </Router>
  );
}

export default App;
