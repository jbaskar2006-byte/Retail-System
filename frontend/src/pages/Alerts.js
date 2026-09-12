import React, { useEffect, useState, useCallback } from 'react';
import { motion } from 'framer-motion';
import { getAIDecisions, getAlerts } from '../api';
import { useStore } from '../context/StoreContext';
import TopBar from '../components/TopBar';

export default function Alerts() {
  const { selectedStore, autoRefresh, speak } = useStore();
  const [decisions, setDecisions] = useState([]);
  const [alerts, setAlerts] = useState([]);

  const loadData = useCallback(async () => {
    try {
      const [aiRes, alRes] = await Promise.all([getAIDecisions(selectedStore), getAlerts(selectedStore)]);
      const d = aiRes.data?.data || [];
      setDecisions(d);
      setAlerts(alRes.data?.data || []);
      
      if (d.length > 0) {
        speak(`AI Intelligence Engine Sync Complete. Identified ${d.length} optimization opportunities.`);
      }
    } catch { }
  }, [selectedStore, speak]);

  useEffect(() => {
    loadData();
    if (autoRefresh) { const t = setInterval(loadData, 30000); return () => clearInterval(t); }
  }, [loadData, autoRefresh]);

  return (
    <div>
      <TopBar title="AI Command Center" />
      <div className="page-wrapper fade-in">
        <h1 className="page-title">🧠 AI Decision & Neural Center</h1>
        
        <div className="grid-2" style={{ marginBottom: 30 }}>
          <div className="glass-card" style={{ border: '2px solid var(--accent-purple)', background: 'rgba(139,92,246,0.05)' }}>
            <div className="section-title">🤖 Neural Network Decisions</div>
            <div className="scroll-panel">
              {decisions.map((d, i) => (
                <motion.div key={i} className={`ai-card ${d.alert_type}`} onClick={() => speak(d.message)}>
                  <div style={{ fontSize: 24 }}>{d.category === 'Expiry' ? '⏳' : d.category === 'Stock' ? '📦' : '👥'}</div>
                  <div>
                    <div style={{ fontWeight: 800, fontSize: 11, color: 'var(--text-muted)', textTransform:'uppercase' }}>{d.category} AI</div>
                    <div style={{ fontSize: 14, marginTop: 2 }}>{d.message}</div>
                    <div className="badge badge-info" style={{ marginTop: 8 }}>Click to Hear AI Briefing</div>
                  </div>
                </motion.div>
              ))}
            </div>
          </div>

          <div className="glass-card" style={{ border: '2px solid var(--accent-red)', background: 'rgba(239,68,68,0.05)' }}>
            <div className="section-title">🚨 Global System Alerts</div>
            <div className="scroll-panel">
              {alerts.map((a, i) => (
                <div key={i} className={`alert-item ${a.alert_type}`}>
                   <div style={{ fontSize: 14, fontWeight: 900 }}>{a.title}</div>
                   <div style={{ fontSize: 13, color: 'var(--text-secondary)' }}>{a.message}</div>
                   <div style={{ fontSize: 11, color: 'var(--text-muted)', marginTop: 5 }}>{a.created_at}</div>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Neural Network Status Visualization */}
        <div className="glass-card" style={{ textAlign:'center', padding: 40 }}>
           <div style={{ display:'flex', justifyContent:'center', gap: 40 }}>
              {[1,2,3,4,5].map(i => (
                <motion.div key={i} animate={{ scale: [1, 1.2, 1], opacity: [0.3, 1, 0.3] }} transition={{ repeat: Infinity, duration: 2, delay: i*0.4 }}
                  style={{ width: 12, height: 12, borderRadius: '50%', background: 'var(--accent-blue)', boxShadow: '0 0 15px var(--accent-blue)' }} />
              ))}
           </div>
           <div style={{ marginTop: 20, fontSize: 13, color:'var(--accent-blue)', fontWeight: 800, letterSpacing: 2 }}>AI CORE PROCESSING LIVE DATA STREAM</div>
        </div>
      </div>
    </div>
  );
}
