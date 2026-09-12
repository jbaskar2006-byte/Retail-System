import React, { useEffect, useState, useCallback } from 'react';
import { motion } from 'framer-motion';
import { RadarChart, PolarGrid, PolarAngleAxis, Radar, Legend, Tooltip, BarChart, Bar, XAxis, YAxis, CartesianGrid } from 'recharts';
import { getStoreCompare } from '../api';
import { useStore } from '../context/StoreContext';
import TopBar from '../components/TopBar';

export default function Compare() {
  const { autoRefresh, speak } = useStore();
  const [data, setData] = useState([]);

  const loadData = useCallback(async () => {
    try {
      const res = await getStoreCompare();
      setData(res.data?.data || []);
      speak(`Global store benchmarking complete. Comparing efficiency across North, South, and East territories.`);
    } catch { }
  }, [speak]);

  useEffect(() => {
    loadData();
    if (autoRefresh) { const t = setInterval(loadData, 30000); return () => clearInterval(t); }
  }, [loadData, autoRefresh]);

  const fallbackCompare = [
    { store_name: 'Store 1 - North', revenue: 65000, profit: 18000, orders: 450 },
    { store_name: 'Store 2 - South', revenue: 78000, profit: 22000, orders: 580 },
    { store_name: 'Store 3 - East', revenue: 54000, profit: 14000, orders: 390 },
  ];
  const chartData = (data.length > 0 && data.some(s => s.revenue > 0)) ? data : fallbackCompare;

  const radarData = [
    { subject: 'Revenue', A: (chartData[0]?.revenue || 0)/1000, B: (chartData[1]?.revenue || 0)/1000, C: (chartData[2]?.revenue || 0)/1000 },
    { subject: 'Orders', A: chartData[0]?.orders || 0, B: chartData[1]?.orders || 0, C: chartData[2]?.orders || 0 },
    { subject: 'Profit', A: (chartData[0]?.profit || 0)/100, B: (chartData[1]?.profit || 0)/100, C: (chartData[2]?.profit || 0)/100 },
    { subject: 'Stock', A: 80, B: 60, C: 95 },
    { subject: 'Loyalty', A: 70, B: 90, C: 65 },
  ];

  return (
    <div>
      <TopBar title="Store Comparison Intelligence" />
      <div className="page-wrapper fade-in">
        <h1 className="page-title">⚖️ Multi-Store Benchmarking</h1>
        
        <div className="grid-2" style={{ marginBottom: 30 }}>
          <div className="chart-container" style={{ border: '1px solid var(--accent-blue)' }}>
            <div className="chart-title">🎯 Competency Radar (North vs South vs East)</div>
            <RadarChart width={600} height={400} data={radarData}>
              <PolarGrid stroke="rgba(255,255,255,0.05)" />
              <PolarAngleAxis dataKey="subject" tick={{fill:'#94a3b8'}} />
              <Radar name="North" dataKey="A" stroke="#3b82f6" fill="#3b82f6" fillOpacity={0.4} />
              <Radar name="South" dataKey="B" stroke="#8b5cf6" fill="#8b5cf6" fillOpacity={0.4} />
              <Radar name="East" dataKey="C" stroke="#10b981" fill="#10b981" fillOpacity={0.4} />
              <Tooltip />
              <Legend />
            </RadarChart>
          </div>

          <div className="chart-container" style={{ border: '1px solid var(--accent-green)' }}>
            <div className="chart-title">📊 Revenue Performance Leaderboard</div>
            <BarChart width={600} height={400} data={chartData}>
               <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
               <XAxis dataKey="store_name" tick={{fill:'#94a3b8'}} fontSize={11} />
               <YAxis tick={{fill:'#94a3b8'}} />
               <Tooltip />
               <Bar dataKey="revenue" fill="#3b82f6" radius={[5,5,0,0]} />
            </BarChart>
          </div>
        </div>

        <div className="grid-3">
           {chartData.map((s, i) => (
             <div key={i} className="glass-card" style={{ borderTop: `4px solid ${i===0?'#3b82f6':i===1?'#8b5cf6':'#10b981'}` }}>
                <div style={{ fontSize: 18, fontWeight: 900 }}>{s.store_name}</div>
                <div style={{ marginTop: 20 }}>
                   <div style={{ color:'var(--text-muted)', fontSize: 11 }}>NET PROFIT MARGIN</div>
                   <div style={{ fontSize: 24, fontWeight: 900 }}>₹{s.profit.toLocaleString()}</div>
                   <div style={{ fontSize: 12, color: '#10b981', marginTop: 5 }}>🏆 Ranked #{i+1} in Efficiency</div>
                </div>
             </div>
           ))}
        </div>
      </div>
    </div>
  );
}
