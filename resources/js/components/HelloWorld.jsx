import * as React from 'react';

const HelloWorld = ({ name = 'World' }) => {
    return (
        <div className="bg-gradient-to-r from-purple-500 to-pink-500 text-white p-6 rounded-lg">
            <h2 className="text-2xl font-bold mb-2">Hello, {name}!</h2>
            <p className="text-purple-100">
                This is a reusable React component.
            </p>
        </div>
    );
};

export default HelloWorld;
