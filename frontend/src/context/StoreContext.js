import React, { createContext, useContext, useState, useCallback } from 'react';

const StoreContext = createContext();

export const STORE_OPTIONS = [
  { id: 0, name: 'All Stores', icon: '🏪', color: '#3b82f6' },
  { id: 1, name: 'Store 1 - North', icon: '🧲', color: '#10b981' },
  { id: 2, name: 'Store 2 - South', icon: '🌴', color: '#8b5cf6' },
  { id: 3, name: 'Store 3 - East', icon: '⚡', color: '#f59e0b' },
];

export function StoreProvider({ children }) {
  const [selectedStore, setSelectedStore] = useState(0);
  const [autoRefresh, setAutoRefresh] = useState(true);
  const [refreshInterval, setRefreshInterval] = useState(30000);
  const [notifications, setNotifications] = useState(true);
  const [voiceAlerts, setVoiceAlerts] = useState(true);
  
  const speak = useCallback((text) => {
    if (!voiceAlerts) return;
    speechSynthesis.cancel();
    const utter = new SpeechSynthesisUtterance(text);
    utter.lang = 'en-US';
    utter.rate = 0.9;
    utter.pitch = 1;
    speechSynthesis.speak(utter);
  }, [voiceAlerts]);

  return (
    <StoreContext.Provider value={{
      selectedStore,
      setSelectedStore,
      autoRefresh,
      setAutoRefresh,
      refreshInterval,
      setRefreshInterval,
      notifications,
      setNotifications,
      voiceAlerts,
      setVoiceAlerts,
      speak,
      currentStore: STORE_OPTIONS.find(s => s.id === selectedStore),
    }}>
      {children}
    </StoreContext.Provider>
  );
}

export const useStore = () => useContext(StoreContext);
