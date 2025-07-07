<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Simple API endpoint for React demo
Route::get('/demo-data', function () {
    return response()->json([
        'message' => 'Hello from Laravel API!',
        'timestamp' => now()->toISOString(),
        'data' => [
            ['id' => 1, 'name' => 'Laravel', 'type' => 'Backend Framework'],
            ['id' => 2, 'name' => 'React', 'type' => 'Frontend Library'],
            ['id' => 3, 'name' => 'Vite', 'type' => 'Build Tool'],
            ['id' => 4, 'name' => 'Tailwind CSS', 'type' => 'CSS Framework'],
        ]
    ]);
});
