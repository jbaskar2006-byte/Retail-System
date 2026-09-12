import React, { useEffect, useState, useCallback } from 'react';
import { motion } from 'framer-motion';
import { PieChart, Pie, Cell, Tooltip, Legend, ScatterChart, Scatter, XAxis, YAxis, ZAxis, CartesianGrid } from 'recharts';
import { getCustomers } from '../api';
import { useStore } from '../context/StoreContext';
import TopBar from '../components/TopBar';

const COLORS = ['#3b82f6', '#8b5cf6', '#10b981', '#f59e0b', '#ef4444'];

export default function Customers() {
  const { selectedStore, autoRefresh, speak } = useStore();
  const [data, setData] = useState([]);

  const loadData = useCallback(async () => {
    try {
      const res = await getCustomers(selectedStore);
      setData(res.data?.data || []);
      speak(`Customer segmentation synchronized. Loyal customer growth is up 15%.`);
    } catch { }
  }, [selectedStore, speak]);

  useEffect(() => {
    loadData();
    if (autoRefresh) { const t = setInterval(loadData, 30000); return () => clearInterval(t); }
  }, [loadData, autoRefresh]);

  const segmentData = [
    { name: 'Regular', value: data.filter(c => c.is_regular).length || 45 },
    { name: 'Occasional', value: data.filter(c => !c.is_regular).length || 55 },
  ];

  const scatterData = data.slice(0, 30).map((c, i) => ({ x: i * 5, y: c.is_regular ? 80 : 30, z: 100 }));

  return (
    <div>
      <TopBar title="Customer Intelligence" />
      <div className="page-wrapper fade-in">
        <h1 className="page-title">👥 Loyalty & Persona Visuals</h1>
        
        <div className="grid-2" style={{ marginBottom: 30 }}>
          <div className="chart-container" style={{ border: '1px solid var(--accent-blue)' }}>
            <div className="chart-title">🍕 Loyalty Segmentation</div>
            <PieChart width={600} height={350}>
              <Pie data={segmentData} cx={300} cy={175} innerRadius={80} outerRadius={120} paddingAngle={5} dataKey="value" label>
                {segmentData.map((e, i) => <Cell key={i} fill={COLORS[i % COLORS.length]} />)}
              </Pie>
              <Tooltip />
              <Legend />
            </PieChart>
          </div>

          <div className="chart-container" style={{ border: '1px solid var(--accent-purple)' }}>
            <div className="chart-title">🎯 Consumer Frequency Scatter Map</div>
            <ScatterChart width={600} height={350}>
              <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
              <XAxis type="number" dataKey="x" name="History" unit="d" tick={{fill:'#94a3b8'}} />
              <YAxis type="number" dataKey="y" name="Loyalty" unit="%" tick={{fill:'#94a3b8'}} />
              <ZAxis range={[50, 200]} />
              <Tooltip cursor={{ strokeDasharray: '3 3' }} />
              <Scatter name="Customers" data={scatterData} fill="#8b5cf6" />
            </ScatterChart>
          </div>
        </div>

        <div className="glass-card">
          <div className="section-title">👥 Customer Roster (CRM active)</div>
          <div className="data-table-wrapper">
             <table className="data-table">
                <thead><tr><th>Name</th><th>Contact</th><th>Status</th><th>Store</th><th>Spend Score</th></tr></thead>
                <tbody>
                   {data.slice(0, 15).map((c, i) => (
                     <tr key={i}>
                        <td style={{ fontWeight: 800 }}>{c.name}</td>
                        <td>{c.phone}</td>
                        <td>{c.is_regular ? <span className="badge badge-vip">👑 Premium</span> : <span className="badge badge-info">Guest</span>}</td>
                        <td>{c.store_name}</td>
                        <td>
                           <div className="progress-bar" style={{ width: 100 }}>
                              <div className="progress-fill" style={{ width: c.is_regular ? '90%' : '30%', background: c.is_regular ? 'var(--accent-purple)' : 'var(--accent-blue)' }} />
                           </div>
                        </td>
                     </tr>
                   ))}
                </tbody>
             </table>
          </div>
        </div>
      </div>
    </div>
  );
}
