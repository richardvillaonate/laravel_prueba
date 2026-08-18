<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class EstadoCaso extends Model
{
    use HasFactory;

    protected $table = 'estados_caso';

    protected $fillable = [
        'nombre',
        'descripcion',
    ];

    /**
     * Un estado puede pertenecer a muchos casos.
     */
    public function casos(): HasMany
    {
        return $this->hasMany(Caso::class, 'estado_id');
    }
}