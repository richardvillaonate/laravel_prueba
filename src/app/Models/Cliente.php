<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Cliente extends Model
{
    use HasFactory;

    protected $table = 'clientes';

    protected $fillable = [
        'cedula',
        'nombre',
        'apellido',
        'telefono',
        'correo',
        'direccion',
    ];

    /**
     * Un cliente puede tener muchos casos.
     */
    public function casos(): HasMany
    {
        return $this->hasMany(Caso::class);
    }
}