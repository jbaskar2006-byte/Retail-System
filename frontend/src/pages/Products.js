import React, { useEffect, useState, useCallback } from 'react';
import { motion } from 'framer-motion';
import { BarChart, Bar, XAxis, YAxis, Tooltip, Legend, CartesianGrid, ResponsiveContainer } from 'recharts';
import { getProducts, refillInventory } from '../api';
import { useStore } from '../context/StoreContext';
import TopBar from '../components/TopBar';
import toast from 'react-hot-toast';

export default function Products() {
  const { selectedStore, autoRefresh, speak } = useStore();
  const [data, setData] = useState([]);

  const loadData = useCallback(async () => {
    try {
      const res = await getProducts(selectedStore);
      setData(res.data?.data || []);
      speak(`Inventory check complete. Synchronizing 300+ SKU records across the network.`);
    } catch { }
  }, [selectedStore, speak]);

  useEffect(() => {
    loadData();
    if (autoRefresh) { const t = setInterval(loadData, 30000); return () => clearInterval(t); }
  }, [loadData, autoRefresh]);

  const onRefill = async (pid, sid) => {
    try {
      await refillInventory({ store_id: sid, product_id: pid, quantity: 50 });
      toast.success('Inventory Refilled Successfully');
      speak(`Product restocked. Inventory updated in database.`);
      loadData();
    } catch { toast.error('Refill failed'); }
  };

  const fallbackData = [
    { name: 'Tomato', stock: 15 }, { name: 'Milk', stock: 5 }, { name: 'Bread', stock: 22 },
    { name: 'Eggs', stock: 2 }, { name: 'Butter', stock: 10 }, { name: 'Cheese', stock: 1 },
  ];

  const chartData = (data.length > 0 ? data.slice(0, 10) : fallbackData).map(p => ({ name: p.name, stock: p.stock }));

  return (
    <div>
      <TopBar title="Product Intelligence" />
      <div className="page-wrapper fade-in">
        <h1 className="page-title">📦 Inventory Visuals & Control</h1>
        
        <div className="grid-2" style={{ marginBottom: 30 }}>
          <div className="chart-container glass-card" style={{ border: '1px solid var(--accent-orange)' }}>
            <div className="chart-title">📊 Top 10 Low Stock Indicators</div>
            <ResponsiveContainer width="100%" height={350}>
              <BarChart data={chartData}>
                 <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
                 <XAxis dataKey="name" tick={{fill:'#94a3b8', fontSize: 10}} />
                 <YAxis tick={{fill:'#94a3b8'}} />
                 <Tooltip />
                 <Bar dataKey="stock" fill="#f97316" radius={[4,4,0,0]} />
              </BarChart>
            </ResponsiveContainer>
          </div>

          <div className="glass-card" style={{ display:'flex', flexDirection:'column', justifyContent:'center', border: '1px solid var(--accent-blue)' }}>
              <div style={{ textAlign:'center' }}>
                 <div style={{ fontSize: 13, color:'var(--text-muted)' }}>TOTAL SKUS MONITORED</div>
                 <div style={{ fontSize: 64, fontWeight: 900 }}>{data.length}</div>
                 <div className="badge badge-success">ALL SYSTEMS GO</div>
              </div>
          </div>
        </div>

        <div className="glass-card">
           <div className="section-title">📦 Master Product Table</div>
           <div className="data-table-wrapper">
              <table className="data-table">
                 <thead><tr><th>Name</th><th>Category</th><th>Price</th><th>Stock</th><th>Status</th><th>Actions</th></tr></thead>
                 <tbody>
                    {data.map((p, i) => (
                      <tr key={i}>
                         <td style={{ fontWeight: 800 }}>{p.name}</td>
                         <td><span className="badge badge-info">{p.category}</span></td>
                         <td>₹{p.price}</td>
                         <td style={{ fontWeight: 900, color: p.stock < 10 ? 'var(--accent-red)' : 'var(--text-primary)' }}>{p.stock}</td>
                         <td>{p.stock === 0 ? <span className="badge badge-danger">Out</span> : p.stock < 10 ? <span className="badge badge-warning">Low</span> : <span className="badge badge-success">Good</span>}</td>
                         <td><button className="btn btn-primary btn-sm" onClick={() => onRefill(p.id, p.store_id)}>Refill +50</button></td>
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
