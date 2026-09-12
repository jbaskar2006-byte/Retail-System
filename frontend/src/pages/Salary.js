import React, { useEffect, useState, useCallback, useMemo } from 'react';
import { motion } from 'framer-motion';
import { 
  ResponsiveContainer, 
  BarChart, 
  Bar, 
  XAxis, 
  YAxis, 
  Tooltip, 
  Legend, 
  CartesianGrid 
} from 'recharts';
import { getSalary } from '../api';
import { useStore } from '../context/StoreContext';
import TopBar from '../components/TopBar';

export default function Salary() {
  const { selectedStore, autoRefresh, speak } = useStore();
  const [rawData, setRawData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [selectedMonth, setSelectedMonth] = useState('All');
  const [searchTerm, setSearchTerm] = useState('');

  const loadData = useCallback(async () => {
    try {
      setLoading(true);
      const res = await getSalary(selectedStore);
      const items = res.data?.data || [];
      setRawData(items);
      if (items.length > 0) {
        speak(`Payroll dashboard synchronized. ${items.length} employee records loaded.`);
      }
    } catch (err) {
      console.error("Error loading payroll data:", err);
    } finally {
      setLoading(false);
    }
  }, [selectedStore, speak]);

  useEffect(() => {
    loadData();
    if (autoRefresh) { 
      const t = setInterval(loadData, 30000); 
      return () => clearInterval(t); 
    }
  }, [loadData, autoRefresh]);

  // Extract unique months for filtering
  const months = useMemo(() => {
    const set = new Set(rawData.map(item => item.month).filter(Boolean));
    return ['All', ...Array.from(set)];
  }, [rawData]);

  // Filtered data based on month & search term
  const filteredData = useMemo(() => {
    return rawData.filter(item => {
      const matchMonth = selectedMonth === 'All' || item.month === selectedMonth;
      const matchSearch = !searchTerm || 
        item.worker_name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.role?.toLowerCase().includes(searchTerm.toLowerCase());
      return matchMonth && matchSearch;
    });
  }, [rawData, selectedMonth, searchTerm]);

  // Deduplicated / Top data for the chart (aggregate by worker)
  const chartData = useMemo(() => {
    const map = new Map();
    filteredData.forEach(s => {
      const name = s.worker_name || 'Worker';
      if (!map.has(name)) {
        map.set(name, {
          name,
          role: s.role,
          basic: s.basic_salary || 0,
          bonus: s.bonus || 0,
          total: s.total_salary || 0,
        });
      }
    });
    return Array.from(map.values()).slice(0, 12);
  }, [filteredData]);

  // Metrics calculations
  const stats = useMemo(() => {
    const totalPayroll = filteredData.reduce((sum, item) => sum + (item.total_salary || 0), 0);
    const totalBonus = filteredData.reduce((sum, item) => sum + (item.bonus || 0), 0);
    const totalBasic = filteredData.reduce((sum, item) => sum + (item.basic_salary || 0), 0);
    const count = filteredData.length;
    const avgSalary = count > 0 ? Math.round(totalPayroll / count) : 0;

    return { totalPayroll, totalBonus, totalBasic, count, avgSalary };
  }, [filteredData]);

  return (
    <div>
      <TopBar title="Workforce Payroll & Compensation" />
      <div className="page-wrapper fade-in">
        
        {/* HEADER & FILTERS */}
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: 15, marginBottom: 25 }}>
          <div>
            <h1 className="page-title" style={{ margin: 0 }}>💵 Compensation & Bonus Analytics</h1>
            <p style={{ margin: '5px 0 0 0', color: 'var(--text-muted)', fontSize: 14 }}>
              Real-time breakdown of basic salary, performance bonuses, and monthly payroll history.
            </p>
          </div>

          <div style={{ display: 'flex', gap: 12, alignItems: 'center' }}>
            {/* MONTH FILTER */}
            <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
              <span style={{ fontSize: 13, color: 'var(--text-muted)', fontWeight: 600 }}>Month:</span>
              <select 
                value={selectedMonth} 
                onChange={(e) => setSelectedMonth(e.target.value)}
                style={{
                  padding: '8px 14px',
                  borderRadius: 8,
                  border: '1px solid rgba(255,255,255,0.15)',
                  background: 'rgba(15, 23, 42, 0.8)',
                  color: '#f8fafc',
                  fontSize: 14,
                  outline: 'none',
                  cursor: 'pointer'
                }}
              >
                {months.map(m => (
                  <option key={m} value={m}>{m}</option>
                ))}
              </select>
            </div>

            {/* REFRESH BUTTON */}
            <button 
              onClick={loadData}
              className="btn btn-primary"
              style={{ padding: '8px 16px', fontSize: 13 }}
            >
              🔄 Refresh
            </button>
          </div>
        </div>

        {/* METRICS CARDS GRID */}
        <div className="grid-4" style={{ marginBottom: 30 }}>
          <motion.div className="glass-card" whileHover={{ y: -3 }}>
            <div style={{ fontSize: 12, textTransform: 'uppercase', color: 'var(--text-muted)', fontWeight: 700, letterSpacing: 0.5 }}>
              TOTAL PAYROLL DISBURSED
            </div>
            <div style={{ fontSize: 32, fontWeight: 900, color: '#10b981', margin: '8px 0 4px 0' }}>
              ₹{stats.totalPayroll.toLocaleString()}
            </div>
            <div style={{ fontSize: 12, color: 'var(--text-secondary)' }}>
              Across {stats.count} payroll records
            </div>
          </motion.div>

          <motion.div className="glass-card" whileHover={{ y: -3 }}>
            <div style={{ fontSize: 12, textTransform: 'uppercase', color: 'var(--text-muted)', fontWeight: 700, letterSpacing: 0.5 }}>
              TOTAL BONUSES GRANTED
            </div>
            <div style={{ fontSize: 32, fontWeight: 900, color: '#3b82f6', margin: '8px 0 4px 0' }}>
              +₹{stats.totalBonus.toLocaleString()}
            </div>
            <div style={{ fontSize: 12, color: 'var(--text-secondary)' }}>
              Performance incentivization
            </div>
          </motion.div>

          <motion.div className="glass-card" whileHover={{ y: -3 }}>
            <div style={{ fontSize: 12, textTransform: 'uppercase', color: 'var(--text-muted)', fontWeight: 700, letterSpacing: 0.5 }}>
              AVERAGE COMPENSATION
            </div>
            <div style={{ fontSize: 32, fontWeight: 900, color: '#f59e0b', margin: '8px 0 4px 0' }}>
              ₹{stats.avgSalary.toLocaleString()}
            </div>
            <div style={{ fontSize: 12, color: 'var(--text-secondary)' }}>
              Per employee per month
            </div>
          </motion.div>

          <motion.div className="glass-card" whileHover={{ y: -3 }}>
            <div style={{ fontSize: 12, textTransform: 'uppercase', color: 'var(--text-muted)', fontWeight: 700, letterSpacing: 0.5 }}>
              ACTIVE WORKFORCE
            </div>
            <div style={{ fontSize: 32, fontWeight: 900, color: '#8b5cf6', margin: '8px 0 4px 0' }}>
              {stats.count}
            </div>
            <div style={{ fontSize: 12, color: 'var(--text-secondary)' }}>
              Registered employee profiles
            </div>
          </motion.div>
        </div>

        {/* GRAPH & CHART SECTION */}
        <div className="glass-card" style={{ marginBottom: 30, padding: 24 }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 20 }}>
            <div>
              <div className="section-title" style={{ margin: 0 }}>📊 Employee Compensation Visual Breakdown</div>
              <div style={{ fontSize: 13, color: 'var(--text-muted)', marginTop: 4 }}>
                Comparing Basic Salary vs Incentive Bonus per employee
              </div>
            </div>
          </div>

          {loading ? (
            <div style={{ height: 320, display: 'flex', alignItems: 'center', justifyContent: 'center', color: 'var(--text-muted)' }}>
              Loading Payroll Graph...
            </div>
          ) : chartData.length === 0 ? (
            <div style={{ height: 320, display: 'flex', alignItems: 'center', justifyContent: 'center', color: 'var(--text-muted)' }}>
              No payroll data available for the selected filters.
            </div>
          ) : (
            <div style={{ width: '100%', height: 360 }}>
              <ResponsiveContainer width="100%" height="100%">
                <BarChart data={chartData} margin={{ top: 10, right: 30, left: 20, bottom: 60 }}>
                  <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.08)" />
                  <XAxis 
                    dataKey="name" 
                    tick={{ fill: '#94a3b8', fontSize: 11 }}
                    angle={-25}
                    textAnchor="end"
                    interval={0}
                  />
                  <YAxis 
                    tick={{ fill: '#94a3b8', fontSize: 11 }}
                    tickFormatter={(val) => `₹${(val / 1000).toFixed(0)}k`}
                  />
                  <Tooltip 
                    contentStyle={{ 
                      backgroundColor: 'rgba(15, 23, 42, 0.95)', 
                      borderColor: '#3b82f6', 
                      borderRadius: 8, 
                      color: '#f8fafc',
                      boxShadow: '0 10px 25px rgba(0,0,0,0.5)'
                    }}
                    formatter={(value, name) => [`₹${Number(value).toLocaleString()}`, name === 'basic' ? 'Basic Salary' : name === 'bonus' ? 'Performance Bonus' : 'Total Compensation']}
                  />
                  <Legend verticalAlign="top" height={36} wrapperStyle={{ color: '#94a3b8' }} />
                  <Bar dataKey="basic" name="Basic Salary" fill="#3b82f6" radius={[4, 4, 0, 0]} stackId="a" />
                  <Bar dataKey="bonus" name="Performance Bonus" fill="#10b981" radius={[4, 4, 0, 0]} stackId="a" />
                </BarChart>
              </ResponsiveContainer>
            </div>
          )}
        </div>

        {/* AUDITABLE DATA TABLE */}
        <div className="glass-card">
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 20, flexWrap: 'wrap', gap: 15 }}>
            <div className="section-title" style={{ margin: 0 }}>💵 Auditable Payroll Records</div>
            
            {/* SEARCH INPUT */}
            <input 
              type="text" 
              placeholder="🔍 Search employee name or role..." 
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              style={{
                padding: '8px 16px',
                borderRadius: 8,
                border: '1px solid rgba(255,255,255,0.15)',
                background: 'rgba(15, 23, 42, 0.8)',
                color: '#f8fafc',
                fontSize: 13,
                minWidth: 260,
                outline: 'none'
              }}
            />
          </div>

          <div className="data-table-wrapper">
            <table className="data-table">
              <thead>
                <tr>
                  <th>Employee</th>
                  <th>Role</th>
                  <th>Month</th>
                  <th>Basic Salary</th>
                  <th>Bonus</th>
                  <th>Total Compensation</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                {filteredData.length === 0 ? (
                  <tr>
                    <td colSpan="7" style={{ textAlign: 'center', padding: 30, color: 'var(--text-muted)' }}>
                      No payroll records found.
                    </td>
                  </tr>
                ) : (
                  filteredData.map((s, i) => (
                    <tr key={i}>
                      <td style={{ fontWeight: 800, color: '#f8fafc' }}>{s.worker_name || 'Employee'}</td>
                      <td style={{ color: 'var(--text-secondary)' }}>{s.role || 'Staff'}</td>
                      <td>
                        <span className="badge" style={{ background: 'rgba(59, 130, 246, 0.15)', color: '#60a5fa', border: '1px solid rgba(59, 130, 246, 0.3)' }}>
                          📅 {s.month || 'Current'}
                        </span>
                      </td>
                      <td>₹{(s.basic_salary || 0).toLocaleString()}</td>
                      <td className="text-green" style={{ fontWeight: 700 }}>+₹{(s.bonus || 0).toLocaleString()}</td>
                      <td style={{ fontWeight: 900, fontSize: 15, color: '#10b981' }}>
                        ₹{(s.total_salary || 0).toLocaleString()}
                      </td>
                      <td>
                        <span className="badge badge-success">DISBURSED</span>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </div>

      </div>
    </div>
  );
}
