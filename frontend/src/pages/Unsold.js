import React, { useEffect, useState, useCallback } from 'react';
import { motion } from 'framer-motion';
import { BarChart, Bar, XAxis, YAxis, Tooltip, Legend } from 'recharts';
import { getUnsold } from '../api';
import { useStore } from '../context/StoreContext';
import TopBar from '../components/TopBar';

export default function Unsold() {
  const { selectedStore, autoRefresh, speak } = useStore();
  const [data, setData] = useState([]);

  const loadData = useCallback(async () => {
    try {
      const res = await getUnsold(selectedStore);
      const items = res.data?.data || [];
      setData(items);
      if (items.length > 5) speak(`Identified ${items.length} slow-moving products. Optimization required.`);
    } catch { }
  }, [selectedStore, speak]);

  useEffect(() => {
    loadData();
    if (autoRefresh) { const t = setInterval(loadData, 30000); return () => clearInterval(t); }
  }, [loadData, autoRefresh]);

  return (
    <div>
      <TopBar title="Dead Stock Intelligence" />
      <div className="page-wrapper fade-in">
        <h1 className="page-title">🔍 Unsold Stock Visuals</h1>
        
        <div className="grid-2" style={{ marginBottom: 30 }}>
           <div className="chart-container" style={{ border: '1px solid var(--accent-red)' }}>
              <div className="chart-title">📊 Days Unsold Comparison</div>
              <BarChart width={600} height={350} data={data.slice(0, 8)}>
                 <XAxis dataKey="name" tick={{fill:'#94a3b8', fontSize: 10}} />
                 <YAxis tick={{fill:'#94a3b8'}} />
                 <Tooltip />
                 <Bar dataKey="days_unsold" fill="#ef4444" radius={[5,5,0,0]} />
              </BarChart>
           </div>
           
           <div className="glass-card" style={{ display:'flex', flexDirection:'column', justifyContent:'center', textAlign:'center' }}>
              <div style={{ fontSize: 13, color:'var(--text-muted)' }}>POTENTIAL REVENUE LOCKUP</div>
              <div style={{ fontSize: 64, fontWeight: 900, color: 'var(--accent-red)' }}>₹{(data.length * 800).toFixed(0)}</div>
              <div style={{ fontSize: 14, color:'var(--text-secondary)' }}>Capital tied in slow-moving items</div>
           </div>
        </div>

        <div className="grid-auto">
          {data.map((p, i) => (
            <motion.div key={i} className="glass-card" style={{ borderLeft: '4px solid var(--accent-amber)' }}>
               <div style={{ fontSize: 16, fontWeight: 800 }}>{p.name}</div>
               <div style={{ fontSize: 11, color:'var(--text-muted)' }}>{p.category} | Store {p.store_id}</div>
               <div style={{ marginTop: 15, fontSize: 32, fontWeight: 900 }}>{p.days_unsold} <span style={{fontSize: 14, color:'var(--text-muted)'}}>Days</span></div>
               <div style={{ marginTop: 10, padding: 10, background:'rgba(245,158,11,0.1)', borderRadius: 8, fontSize: 12 }}>
                  <b>AI:</b> {p.suggestion}
               </div>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
}
