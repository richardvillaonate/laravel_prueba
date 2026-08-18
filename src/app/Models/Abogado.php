<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Abogado extends Model
{
    use HasFactory;

    protected $table = 'abogados';

    protected $fillable = [
        'cedula',
        'nombre',
        'apellido',
        'telefono',
        'correo',
        'direccion',
    ];

    /**
     * Un abogado puede llevar muchos casos.
     */
    public function casos(): BelongsToMany
    {
        return $this->belongsToMany(
            Caso::class,
            'caso_abogado'
        )->withTimestamps();
    }
}