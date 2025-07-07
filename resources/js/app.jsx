import './bootstrap';
import * as React from 'react';
import { createRoot } from 'react-dom/client';
import App from './components/App.jsx';

// Initialize React app if there's a root element
const rootElement = document.getElementById('react-root');
if (rootElement) {
    const root = createRoot(rootElement);
    root.render(<App />);
}
