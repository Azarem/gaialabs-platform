import React from 'react';

export default function HomePage() {
  return (
    <div className="container mx-auto px-4 py-8">
      <header className="text-center mb-8">
        <h1 className="text-4xl font-bold text-gray-900 mb-4">
          Gaia Community
        </h1>
        <p className="text-xl text-gray-600">
          ROM hacking community and collaboration platform
        </p>
      </header>

      <main className="max-w-4xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-xl font-semibold mb-3">Projects</h2>
            <p className="text-gray-600">
              Discover and contribute to ROM hacking projects
            </p>
          </div>
          
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-xl font-semibold mb-3">Community</h2>
            <p className="text-gray-600">
              Connect with fellow ROM hackers and enthusiasts
            </p>
          </div>
          
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-xl font-semibold mb-3">Resources</h2>
            <p className="text-gray-600">
              Access tutorials, tools, and documentation
            </p>
          </div>
        </div>
      </main>
    </div>
  );
} 