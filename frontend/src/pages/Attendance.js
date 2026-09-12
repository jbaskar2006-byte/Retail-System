import React, { useEffect, useState, useCallback } from 'react';
import { motion } from 'framer-motion';
import { BarChart, Bar, XAxis, YAxis, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { getAttendance } from '../api';
import { useStore } from '../context/StoreContext';
import TopBar from '../components/TopBar';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';

export default function Attendance() {
  const { selectedStore, autoRefresh, speak } = useStore();
  const [data, setData] = useState([]);

  const loadData = useCallback(async () => {
    try {
      const res = await getAttendance(selectedStore);
      setData(res.data?.data || []);
      speak(`Attendance monitoring active. Live headcounts verified.`);
    } catch { }
  }, [selectedStore, speak]);

  const downloadPDF = () => {
    speak("Generating high-fidelity attendance report.");
    const doc = new jsPDF();
    doc.setFontSize(20);
    doc.text("NEURAL RETAIL: ATTENDANCE AUDIT", 10, 20);
    doc.setFontSize(12);
    doc.text(`Generated on: ${new Date().toLocaleString()}`, 10, 30);
    doc.text(`Store Territory: ${selectedStore === 0 ? 'Global / All Stores' : `Store ${selectedStore}`}`, 10, 40);

    const tableData = data.map(item => [
      item.worker_name,
      item.role,
      item.phone,
      `${item.attendance_rate}%`,
      item.present > 0 ? 'PRESENT' : 'ABSENT'
    ]);

    autoTable(doc, {
      startY: 50,
      head: [['Worker', 'Role', 'Contact', 'Reliability', 'Status']],
      body: tableData,
      theme: 'grid',
      headStyles: { fillStyle: '#3b82f6' }
    });

    doc.save(`Attendance_Report_Store_${selectedStore}.pdf`);
  };

  useEffect(() => {
    loadData();
    if (autoRefresh) { const t = setInterval(loadData, 30000); return () => clearInterval(t); }
  }, [loadData, autoRefresh]);

  const chartData = data.slice(0, 8).map(a => ({ name: a.worker_name, present: a.present, absent: a.absent }));

  return (
    <div>
      <TopBar title="Live Attendance" />
      <div className="page-wrapper fade-in">
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 20 }}>
          <h1 className="page-title">📅 Real-Time Attendance Statistics</h1>
          <button className="btn btn-primary" onClick={downloadPDF} style={{ background: '#3b82f6', border: 'none', padding: '10px 20px', borderRadius: 8, color: 'white', fontWeight: 800, cursor: 'pointer' }}>
            📥 Download Neural Report
          </button>
        </div>
        
        <div className="grid-2" style={{ marginBottom: 30 }}>
           <div className="chart-container glass-card" style={{ border: '1px solid var(--accent-cyan)' }}>
              <div className="chart-title">📊 Worker Presence Consistency (30 Days)</div>
              <ResponsiveContainer width="100%" height={350}>
                <BarChart data={chartData}>
                   <XAxis dataKey="name" tick={{fill:'#94a3b8', fontSize: 10}} />
                   <YAxis tick={{fill:'#94a3b8'}} />
                   <Tooltip />
                   <Legend />
                   <Bar dataKey="present" fill="#10b981" radius={[5,5,0,0]} stackId="a" />
                   <Bar dataKey="absent" fill="#ef4444" radius={[5,5,0,0]} stackId="a" />
                </BarChart>
              </ResponsiveContainer>
           </div>
           
           <div className="glass-card" style={{ display:'flex', flexDirection:'column', justifyContent:'center', textAlign:'center' }}>
              <div style={{ fontSize: 13, color:'var(--text-muted)' }}>SYSTEM ATTENDANCE RATE</div>
              <div style={{ fontSize: 64, fontWeight: 900, color: 'var(--accent-cyan)' }}>
                 {(data.reduce((a, b) => a + b.attendance_rate, 0) / (data.length || 1)).toFixed(1)}%
              </div>
              <div className="badge badge-info">OPERATIONAL THRESHOLD: 85%</div>
           </div>
        </div>

        <div className="glass-card">
           <div className="section-title">📅 Live Roster (Store {selectedStore || 'Global'})</div>
           <div className="data-table-wrapper">
              <table className="data-table">
                 <thead><tr><th>Worker</th><th>Role</th><th>Contact</th><th>Score</th><th>Status Today</th></tr></thead>
                 <tbody>
                    {data.map((a, i) => (
                      <tr key={i}>
                         <td style={{ fontWeight: 800 }}>{a.worker_name}</td>
                         <td>{a.role}</td>
                         <td>{a.phone}</td>
                         <td>
                            <div className="progress-bar" style={{ width: 100 }}>
                               <div className="progress-fill" style={{ width: `${a.attendance_rate}%`, background: a.attendance_rate > 90 ? '#10b981' : '#f59e0b' }} />
                            </div>
                         </td>
                         <td>{a.present > 0 ? <span className="badge badge-success">Present</span> : <span className="badge badge-danger">Absent</span>}</td>
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
