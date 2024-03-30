<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Plante extends Model
{
    use HasFactory;

    public $timestamps = false;
    
    protected $table = 'plantes'; // Nom de votre table

    protected $fillable = [ // Colonnes que vous souhaitez remplir
        'name_plante',
        'image',
        'localisation',
        'id_user',
        // Ajoutez d'autres colonnes si nécessaire
    ];
}

