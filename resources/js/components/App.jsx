import * as React from 'react';
import { useState } from 'react';
import HelloWorld from './HelloWorld';
import ApiDemo from './ApiDemo';

const App = () => {
    const [count, setCount] = useState(0);

    return (
        <div className="max-w-4xl mx-auto p-8">
            <div className="bg-white rounded-lg shadow-lg p-6">
                <h1 className="text-3xl font-bold text-gray-800 mb-6">
                    Welcome to Laravel + React!
                </h1>
                
                <div className="space-y-4">
                    <p className="text-gray-600">
                        This is a React component running inside your Laravel application.
                    </p>
                    
                    <HelloWorld name="Laravel Developer" />
                    
                    <div className="bg-gray-50 p-4 rounded-md">
                        <h2 className="text-xl font-semibold mb-3">Counter Example</h2>
                        <div className="flex items-center space-x-4">
                            <button
                                onClick={() => setCount(count - 1)}
                                className="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded"
                            >
                                -
                            </button>
                            <span className="text-2xl font-bold">{count}</span>
                            <button
                                onClick={() => setCount(count + 1)}
                                className="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded"
                            >
                                +
                            </button>
                        </div>
                    </div>
                    
                    <ApiDemo />
                    
                    <div className="bg-green-50 border border-green-200 p-4 rounded-md">
                        <h3 className="text-lg font-semibold text-green-800 mb-2">
                            Next Steps:
                        </h3>
                        <ul className="text-green-700 space-y-1">
                            <li>• Add more React components in resources/js/components/</li>
                            <li>• Use Laravel API routes to fetch data</li>
                            <li>• Implement routing with React Router if needed</li>
                            <li>• Add state management with Redux or Zustand</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default App;
