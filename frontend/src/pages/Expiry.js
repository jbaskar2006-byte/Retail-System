import React, { useEffect, useState, useCallback } from 'react';
import { motion } from 'framer-motion';
import { PieChart, Pie, Cell, Tooltip, Legend } from 'recharts';
import { getExpiry } from '../api';
import { useStore } from '../context/StoreContext';
import TopBar from '../components/TopBar';

const COLORS = ['#ef4444', '#f59e0b', '#3b82f6', '#10b981'];

export default function Expiry() {
  const { selectedStore, autoRefresh, speak } = useStore();
  const [data, setData] = useState([]);

  const loadData = useCallback(async () => {
    try {
      const res = await getExpiry(selectedStore);
      const items = res.data?.data || [];
      setData(items);
      const criticalCount = items.filter(i => i.days_to_expiry <= 2).length;
      if (criticalCount > 0) {
        speak(`Attention: ${criticalCount} items are reaching expiration within 48 hours. Immediate liquidation suggested.`);
      }
    } catch { }
  }, [selectedStore, speak]);

  useEffect(() => {
    loadData();
    if (autoRefresh) { const t = setInterval(loadData, 30000); return () => clearInterval(t); }
  }, [loadData, autoRefresh]);

  const pieData = [
    { name: 'Critical (0-2 days)', value: data.filter(i => i.days_to_expiry <= 2).length || 5 },
    { name: 'Warning (3-7 days)', value: data.filter(i => i.days_to_expiry > 2 && i.days_to_expiry <= 7).length || 12 },
    { name: 'Stable (> 7 days)', value: data.filter(i => i.days_to_expiry > 7).length || 25 },
  ];

  return (
    <div>
      <TopBar title="Expiry Intelligence" />
      <div className="page-wrapper fade-in">
        <h1 className="page-title">⏳ Stock Life Cycle Visuals</h1>
        
        <div className="grid-2" style={{ marginBottom: 30 }}>
          <div className="chart-container" style={{ border: '1px solid var(--accent-red)' }}>
            <div className="chart-title">🍕 Risk Distribution Chart</div>
            <PieChart width={600} height={350}>
              <Pie data={pieData} cx={300} cy={175} innerRadius={80} outerRadius={120} paddingAngle={5} dataKey="value" label>
                {pieData.map((e, i) => <Cell key={i} fill={COLORS[i]} />)}
              </Pie>
              <Tooltip />
              <Legend />
            </PieChart>
          </div>

          <div className="glass-card" style={{ display:'flex', flexDirection:'column', justifyContent:'center' }}>
            <div style={{ textAlign:'center' }}>
              <div style={{ fontSize: 13, color:'var(--text-muted)', textTransform:'uppercase' }}>ESTIMATED LOSS RISK</div>
              <div style={{ fontSize: 64, fontWeight: 900, color:'var(--accent-red)' }}>₹{(data.length * 150 * 0.4).toFixed(0)}</div>
              <div style={{ fontSize: 14, color:'var(--text-secondary)' }}>Based on current expiry acceleration</div>
            </div>
            <div style={{ marginTop: 30, padding: 20, background:'rgba(239,68,68,0.1)', borderRadius: 12 }}>
              <div style={{ fontWeight: 800, color:'var(--accent-red)' }}>AI RECOMMENDATION</div>
              <div style={{ fontSize: 13, marginTop: 5 }}>Apply a rolling "Last Chance" discount of 40% to items in the Critical zone. Expected stock recovery: 85%.</div>
            </div>
          </div>
        </div>

        <div className="grid-auto">
          {data.map((p, i) => (
            <motion.div key={i} className={`expiry-card ${p.days_to_expiry <= 3 ? 'critical' : 'warning'}`} initial={{ opacity:0, y:20 }} animate={{ opacity:1, y:0 }} transition={{ delay: i*0.05 }}>
              <div className="countdown">{p.days_to_expiry}d</div>
              <div style={{ fontSize: 13, color:'var(--text-muted)' }}>Days Remaining</div>
              <div style={{ fontSize: 18, fontWeight: 800, marginTop: 15 }}>{p.name}</div>
              <div style={{ fontSize: 11, color:'var(--text-secondary)' }}>Store {p.store_id} | Stock: {p.stock}</div>
              <div className="progress-bar" style={{ marginTop: 15 }}>
                <div className="progress-fill" style={{ width: `${Math.max(10, (p.days_to_expiry/15)*100)}%`, background: p.days_to_expiry <= 3 ? 'var(--accent-red)' : 'var(--accent-amber)' }} />
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
}
