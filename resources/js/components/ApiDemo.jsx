import * as React from 'react';
import { useState, useEffect } from 'react';

const ApiDemo = () => {
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    const fetchData = async () => {
        setLoading(true);
        setError(null);
        
        try {
            const response = await fetch('/api/demo-data');
            if (!response.ok) {
                throw new Error('Failed to fetch data');
            }
            const result = await response.json();
            setData(result);
        } catch (err) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchData();
    }, []);

    return (
        <div className="bg-white rounded-lg shadow-lg p-6">
            <div className="flex justify-between items-center mb-4">
                <h2 className="text-2xl font-bold text-gray-800">API Demo</h2>
                <button
                    onClick={fetchData}
                    disabled={loading}
                    className="bg-blue-500 hover:bg-blue-600 disabled:bg-blue-300 text-white px-4 py-2 rounded"
                >
                    {loading ? 'Loading...' : 'Refresh'}
                </button>
            </div>

            {error && (
                <div className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded mb-4">
                    Error: {error}
                </div>
            )}

            {data && (
                <div className="space-y-4">
                    <div className="bg-green-50 border border-green-200 p-4 rounded">
                        <p className="text-green-800 font-semibold">{data.message}</p>
                        <p className="text-green-600 text-sm">Timestamp: {data.timestamp}</p>
                    </div>

                    <div>
                        <h3 className="text-lg font-semibold mb-3 text-gray-700">Stack Components:</h3>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            {data.data.map((item) => (
                                <div key={item.id} className="bg-gray-50 p-4 rounded border">
                                    <h4 className="font-semibold text-gray-800">{item.name}</h4>
                                    <p className="text-gray-600 text-sm">{item.type}</p>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            )}

            {loading && !data && (
                <div className="text-center py-8">
                    <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-500"></div>
                    <p className="mt-2 text-gray-600">Loading data from Laravel API...</p>
                </div>
            )}
        </div>
    );
};

export default ApiDemo;
