import React, { useEffect, useRef } from 'react';
import { useStore, STORE_OPTIONS } from '../context/StoreContext';
import { getAlerts } from '../api';
import toast from 'react-hot-toast';

export default function TopBar({ title }) {
  const { 
    selectedStore, 
    setSelectedStore, 
    autoRefresh, 
    setAutoRefresh, 
    voiceAlerts, 
    setVoiceAlerts, 
    toggleMobileMenu,
    speak 
  } = useStore();
  const alertPollRef = useRef(null);

  useEffect(() => {
    const poll = async () => {
      try {
        const res = await getAlerts(selectedStore);
        const alerts = res.data?.data || [];
        const unread = alerts.filter(a => !a.is_read && a.alert_type === 'danger');
        if (unread.length > 0) {
          toast.error(`🚨 ${unread[0].title}: ${unread[0].message}`, { duration: 5000 });
          if (voiceAlerts) speak(unread[0].message);
        }
      } catch {}
    };
    alertPollRef.current = setInterval(poll, 60000);
    return () => clearInterval(alertPollRef.current);
  }, [selectedStore, voiceAlerts, speak]);

  return (
    <header className="topbar">
      <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
        {/* HAMBURGER TOGGLE FOR MOBILE */}
        <button 
          className="mobile-menu-toggle"
          onClick={toggleMobileMenu}
          aria-label="Toggle Navigation Menu"
        >
          🍔
        </button>
        <div className="topbar-title">{title}</div>
      </div>

      <div className="topbar-right">
        {/* Auto Refresh Toggle */}
        <button
          className={`btn btn-sm ${autoRefresh ? 'btn-success' : 'btn-ghost'}`}
          onClick={() => setAutoRefresh(v => !v)}
          title="Toggle auto-refresh"
        >
          {autoRefresh ? '🔄 Auto' : '⏸ Paused'}
        </button>

        {/* Voice Toggle */}
        <button
          className={`btn btn-sm ${voiceAlerts ? 'btn-primary' : 'btn-ghost'}`}
          onClick={() => setVoiceAlerts(v => !v)}
          title="Toggle voice alerts"
        >
          {voiceAlerts ? '🔊 Voice' : '🔇 Voice'}
        </button>

        {/* Store Selector */}
        <div className="store-selector">
          <span>🏪</span>
          <select
            value={selectedStore}
            onChange={e => setSelectedStore(Number(e.target.value))}
          >
            {STORE_OPTIONS.map(s => (
              <option key={s.id} value={s.id}>{s.name}</option>
            ))}
          </select>
        </div>

        {/* Time */}
        <div className="topbar-time" style={{ fontSize: 12, color: 'var(--text-muted)' }}>
          {new Date().toLocaleTimeString()}
        </div>
      </div>
    </header>
  );
}
