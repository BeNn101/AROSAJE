<?php

namespace App\Http\Controllers;

use App\Models\Plante;
use Illuminate\Http\Request;

class PlanteController extends Controller
{
    //
    public function index()
    {
        $plantes = Plante::all();
        return response()->json($plantes);
    }

    public function store(Request $request)
    {
   
        // Valider les données entrées par l'utilisateur
        $request->validate([
            'name_plante' => 'required|string|max:255',
            'image' => 'required|string',
            'localisation' => 'required|string|max:255',
            'id_user' => 'required|integer',
        ]);
        
        // Créer une nouvelle plante avec les données fournies
        $plante = new Plante();
        $plante->name_plante = $request->name_plante;
        $plante->image = $request->image;
        $plante->localisation = $request->localisation;
        $plante->id_user = $request->id_user;

        // Enregistrer la plante dans la base de données
        $plante->save();

        // Retourner la plante créée avec un code de succès
        return response()->json($plante, 201);
    }
}
