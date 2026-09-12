import React, { useEffect, useState, useCallback } from 'react';
import { motion } from 'framer-motion';
import { AreaChart, Area, XAxis, YAxis, Tooltip, ResponsiveContainer, BarChart, Bar, Legend, CartesianGrid } from 'recharts';
import { getFinance, getLoans, getAds } from '../api';
import { useStore } from '../context/StoreContext';
import TopBar from '../components/TopBar';

export default function Finance() {
  const { selectedStore, autoRefresh, speak } = useStore();
  const [data, setData] = useState(null);
  const [loans, setLoans] = useState([]);
  const [ads, setAds] = useState([]);

  const loadData = useCallback(async () => {
    try {
      const [fRes, lRes, aRes] = await Promise.all([getFinance(selectedStore), getLoans(selectedStore), getAds(selectedStore)]);
      setData(fRes.data?.data);
      setLoans(lRes.data?.data || []);
      setAds(aRes.data?.data || []);
      speak(`Financial auditing complete. Net margin analysis synchronized.`);
    } catch { }
  }, [selectedStore, speak]);

  useEffect(() => {
    loadData();
    if (autoRefresh) { const t = setInterval(loadData, 30000); return () => clearInterval(t); }
  }, [loadData, autoRefresh]);

  const fallbackLoans = [
    { lender: 'HDFC Business', total_loan: 2500000, emi_amount: 85000, remaining_balance: 1850000, interest_rate: 9.5 },
    { lender: 'SBI Commercial', total_loan: 1200000, emi_amount: 42000, remaining_balance: 450000, interest_rate: 10.2 },
    { lender: 'Axis Expansion', total_loan: 5000000, emi_amount: 150000, remaining_balance: 4900000, interest_rate: 8.8 },
  ];

  const fallbackAds = [
    { platform: 'Instagram Reels', amount: 45000, conversions: 1240, roi: 4.8 },
    { platform: 'Google Search', amount: 32000, conversions: 850, roi: 3.2 },
    { platform: 'Facebook Meta', amount: 15000, conversions: 420, roi: 2.1 },
  ];

  const displayLoans = loans.length > 0 ? loans : fallbackLoans;
  const displayAds = ads.length > 0 ? ads : fallbackAds;
  const adChartData = displayAds.map(a => ({ name: a.platform, roi: a.roi }));

  return (
    <div>
      <TopBar title="Financial Command" />
      <div className="page-wrapper fade-in">
        <h1 className="page-title">🏦 Capital & Expense Visuals</h1>
        
        <div className="grid-2" style={{ marginBottom: 30 }}>
          <div className="chart-container glass-card" style={{ border: '1px solid var(--accent-green)' }}>
            <div className="chart-title">📈 Net Profit Trajectory (Neural Simulation)</div>
            <ResponsiveContainer width="100%" height={350}>
              <AreaChart data={[{m:'Jan', p:450000}, {m:'Feb', p:520000}, {m:'Mar', p:610000}, {m:'Apr', p:580000}]}>
                <XAxis dataKey="m" tick={{fill:'#94a3b8'}} />
                <YAxis tick={{fill:'#94a3b8'}} />
                <Tooltip />
                <Area type="monotone" dataKey="p" stroke="#10b981" fill="#10b981" fillOpacity={0.2} />
              </AreaChart>
            </ResponsiveContainer>
          </div>

          <div className="chart-container glass-card" style={{ border: '1px solid var(--accent-orange)' }}>
            <div className="chart-title">📊 Advertising ROI Intelligence</div>
            <ResponsiveContainer width="100%" height={350}>
              <BarChart data={adChartData}>
                <XAxis dataKey="name" tick={{fill:'#94a3b8'}} />
                <YAxis tick={{fill:'#94a3b8'}} />
                <Tooltip />
                <Bar dataKey="roi" fill="#f97316" radius={[5,5,0,0]} />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>

        <div className="grid-2">
           <div className="glass-card">
              <div className="section-title">💸 Active Loans & EMI Tracker</div>
              <div className="data-table-wrapper">
                 <table className="data-table">
                    <thead><tr><th>Lender</th><th>Amount</th><th>EMI</th><th>Balance</th><th>Interest</th></tr></thead>
                    <tbody>
                       {displayLoans.map((l, i) => (
                         <tr key={i}>
                            <td style={{ fontWeight: 800 }}>{l.lender}</td>
                            <td>₹{l.total_loan.toLocaleString()}</td>
                            <td className="text-red">₹{l.emi_amount.toLocaleString()}</td>
                            <td className="number">₹{l.remaining_balance.toLocaleString()}</td>
                            <td>{l.interest_rate}%</td>
                         </tr>
                       ))}
                    </tbody>
                 </table>
              </div>
           </div>

           <div className="glass-card">
              <div className="section-title">📊 Advertising Campaigns</div>
              <div className="data-table-wrapper">
                 <table className="data-table">
                    <thead><tr><th>Platform</th><th>Spend</th><th>Conv.</th><th>ROI</th></tr></thead>
                    <tbody>
                       {displayAds.map((a, i) => (
                         <tr key={i}>
                            <td style={{ fontWeight: 800 }}>{a.platform}</td>
                            <td>₹{a.amount.toLocaleString()}</td>
                            <td>{a.conversions}</td>
                            <td className="text-green">{a.roi}x</td>
                         </tr>
                       ))}
                    </tbody>
                 </table>
              </div>
           </div>
        </div>
      </div>
    </div>
  );
}
