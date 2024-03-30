<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PlanteController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

 Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

/// Récupere liste des user 
Route::get('/users/alluser', 'App\Http\Controllers\UserController@index')->withoutMiddleware('auth');
/// Créé user 
Route::post('/users/createUser', 'App\Http\Controllers\UserController@insert')->withoutMiddleware('auth');
// Autres routes pour les utilisateurs...
Route::get('/users/{id}', [UserController::class, 'getUser']);
/// Crée une plante 
Route::post('/plantes', [PlanteController::class, 'store']);
///list de toutes les plantes 
Route::get('/getAllPlantes', [PlanteController::class, 'index']);
