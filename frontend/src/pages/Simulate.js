import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { simulate } from '../api';
import TopBar from '../components/TopBar';
import { useStore } from '../context/StoreContext';
import toast from 'react-hot-toast';
import { BarChart, Bar, XAxis, YAxis, Tooltip, Legend, PieChart, Pie, Cell, ResponsiveContainer } from 'recharts';

export default function Simulate() {
  const { speak } = useStore();

  const onSimulate = async (type) => {
    try {
      await simulate(type);
      toast.success(`Simulation Started: ${type}`);
      speak(`System Stress Test Initialized. Injecting ${type} variables into the neural data stream.`);
    } catch { toast.error('Simulation Failed'); }
  };

  const simData = [
    { name: 'Stock Drain', value: 80, color: '#ef4444' },
    { name: 'Revenue Surge', value: 65, color: '#10b981' },
    { name: 'Worker Shortage', value: 40, color: '#f59e0b' },
  ];

  return (
    <div>
      <TopBar title="Simulation Command Panel" />
      <div className="page-wrapper fade-in">
        <h1 className="page-title">⚙️ System Stress & Scenario Testing</h1>
        
        <div className="grid-2" style={{ marginBottom: 30 }}>
           <div className="chart-container glass-card" style={{ border: '2px dotted var(--accent-purple)' }}>
              <div className="chart-title">⚖️ Predicted Impact Analysis</div>
              <ResponsiveContainer width="100%" height={350}>
                <PieChart>
                   <Pie data={simData} cx="50%" cy="50%" innerRadius={80} outerRadius={120} dataKey="value">
                     {simData.map((e, i) => <Cell key={i} fill={e.color} />)}
                   </Pie>
                   <Tooltip />
                </PieChart>
              </ResponsiveContainer>
           </div>
           
           <div className="glass-card" style={{ display:'flex', flexDirection:'column', gap: 20 }}>
              <h3 style={{ color: 'var(--accent-purple)' }}>🚀 Active Scenarios</h3>
              <button className="btn btn-danger" onClick={() => onSimulate('heavy_sales')}>🚩 Trigger Heavy Holiday Sales (Stock Drain)</button>
              <button className="btn btn-warning" onClick={() => onSimulate('worker_shortage')}>⚠️ Trigger Workforce Crisis (Absenteeism)</button>
              <button className="btn btn-primary" onClick={() => onSimulate('expiry_bulk')}>🕒 Trigger Expiry Wave (Risk Simulation)</button>
              <div style={{ marginTop: 10, fontSize: 13, color: 'var(--text-muted)' }}>
                 *Scenarios inject massive synthetic records into the MySQL databases to test AI Alert responses.
              </div>
           </div>
        </div>

        <div className="glass-card" style={{ background: 'rgba(59,130,246,0.05)', textAlign: 'center', padding: 50 }}>
           <motion.div animate={{ rotate: 360 }} transition={{ repeat: Infinity, duration: 10, ease: 'linear' }}
             style={{ fontSize: 60, marginBottom: 20 }}>⚙️</motion.div>
           <h2 style={{ letterSpacing: 5 }}>CORE ENGINE READY</h2>
           <p style={{ color:'var(--text-muted)', marginTop: 10 }}>Select a scenario above to stress-test your visual analytics and AI alerts.</p>
        </div>
      </div>
    </div>
  );
}
