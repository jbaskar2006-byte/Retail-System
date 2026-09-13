import React from 'react';
import { NavLink } from 'react-router-dom';
import { motion } from 'framer-motion';
import { useStore } from '../context/StoreContext';

const NAV_LINKS = [
  { section: 'Intelligence', links: [
    { to: '/', label: 'Visual Dashboard', icon: '📊' },
    { to: '/alerts', label: 'AI Command Center', icon: '🧠' },
    { to: '/compare', label: 'Store Comparison', icon: '⚖️' },
    { to: '/demand', label: 'Demand Forecast', icon: '🔮' },
  ]},
  { section: 'Financials', links: [
    { to: '/revenue', label: 'Revenue Analytics', icon: '💰' },
    { to: '/sales', label: 'Sales & Trends', icon: '📈' },
    { to: '/finance', label: 'Master Finance', icon: '🏦' },
    { to: '/salary', label: 'Payroll & Salary', icon: '💵' },
    { to: '/loans', label: 'Loans & EMI', icon: '🏦' },
    { to: '/ads', label: 'Ad Intelligence', icon: '📺' },
  ]},
  { section: 'Operations', links: [
    { to: '/products', label: 'Stock & Inventory', icon: '📦' },
    { to: '/orders', label: 'Order Records', icon: '🛒' },
    { to: '/expiry', label: 'Expiry Tracker', icon: '⌛' },
    { to: '/unsold', label: 'Dead Stock List', icon: '🔍' },
  ]},
  { section: 'Workforce', links: [
    { to: '/workforce', label: 'Employee Roster', icon: '👥' },
    { to: '/attendance', label: 'Live Attendance', icon: '📅' },
  ]},
  { section: 'System', links: [
    { to: '/customers', label: 'Customer CRM', icon: '👤' },
    { to: '/simulate', label: 'Stress Simulate', icon: '⚙️' },
  ]}
];

export default function Sidebar() {
  const { mobileMenuOpen, closeMobileMenu } = useStore();

  return (
    <>
      {/* MOBILE BACKDROP OVERLAY */}
      {mobileMenuOpen && (
        <div 
          className="mobile-sidebar-backdrop"
          onClick={closeMobileMenu}
        />
      )}

      <nav className={`sidebar ${mobileMenuOpen ? 'mobile-open' : ''}`}>
        <div className="sidebar-logo" style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <div>
            <motion.h2 whileHover={{ scale: 1.05 }}>RETAIL SMART AI</motion.h2>
            <p>Advanced Multi-Store Intel</p>
          </div>
          
          {/* MOBILE CLOSE BUTTON */}
          <button 
            className="mobile-close-btn"
            onClick={closeMobileMenu}
            aria-label="Close menu"
          >
            ✖
          </button>
        </div>

        <div className="sidebar-nav">
          {NAV_LINKS.map((sec, i) => (
            <div key={i}>
              <div className="nav-section-title">{sec.section}</div>
              {sec.links.map((link, j) => (
                <NavLink 
                  key={j} 
                  to={link.to} 
                  onClick={closeMobileMenu}
                  className={({ isActive }) => `nav-item ${isActive ? 'active' : ''}`}
                >
                  <span className="nav-icon">{link.icon}</span>
                  <span>{link.label}</span>
                </NavLink>
              ))}
            </div>
          ))}
        </div>

        <div style={{ padding: 20, borderTop: '1px solid var(--border)', fontSize: 11, color: 'var(--text-muted)', textAlign: 'center' }}>
          v2.0.4 PRODUCTION READY
        </div>
      </nav>
    </>
  );
}
