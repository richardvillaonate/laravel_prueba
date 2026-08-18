<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Caso extends Model
{
    use HasFactory;

    protected $table = 'casos';

    protected $fillable = [
        'numero_expediente',
        'cliente_id',
        'estado_id',
        'fecha_inicio',
        'fecha_finalizacion',
    ];

    protected $casts = [
        'fecha_inicio' => 'date',
        'fecha_finalizacion' => 'date',
    ];

    /**
     * El caso tiene un cliente.
     */
    public function cliente(): BelongsTo
    {
        return $this->belongsTo(Cliente::class);
    }

    /**
     * El caso tiene un estado.
     */
    public function estado(): BelongsTo
    {
        return $this->belongsTo(
            EstadoCaso::class,
            'estado_id'
        );
    }

    /**
     * El caso puede tener uno o varios abogados.
     */
    public function abogados(): BelongsToMany
    {
        return $this->belongsToMany(
            Abogado::class,
            'caso_abogado'
        )->withTimestamps();
    }
}