<?php

use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CasoController;
use App\Http\Controllers\ExportacionController;

Route::post('/login', [
    AuthController::class,
    'login'
]);

Route::middleware('auth:sanctum')->group(function () {

    Route::post('/logout', [
        AuthController::class,
        'logout'
    ]);

    Route::get('/user', [
        AuthController::class,
        'user'
    ]);

    Route::get('/casos/{id}', [
        CasoController::class,
        'show'
    ]);

   Route::post('/exportaciones/casos', [
    ExportacionController::class,
        'casos'
    ])->name('exportaciones.casos');

});

