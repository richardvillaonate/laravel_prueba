<?php

namespace App\Exports;

use App\Models\Abogado;
use Maatwebsite\Excel\Concerns\Export;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;
use Illuminate\Support\Collection;

class CasosAbogadoSheet implements Export, FromCollection, WithHeadings, WithTitle
{
    public function __construct(
        private Abogado $abogado
    ) {
    }

    public function collection(): Collection
    {
        return $this->abogado
            ->casos()
            ->with([
                'cliente',
                'estado',
            ])
            ->get()
            ->map(function ($caso) {
                return [
                    'expediente' => $caso->numero_expediente,

                    'cliente_cedula' => $caso->cliente->cedula,

                    'cliente_nombre' =>
                        $caso->cliente->nombre . ' ' .
                        $caso->cliente->apellido,

                    'cliente_telefono' =>
                        $caso->cliente->telefono,

                    'cliente_correo' =>
                        $caso->cliente->correo,

                    'estado' =>
                        $caso->estado->nombre,

                    'fecha_inicio' =>
                        $caso->fecha_inicio?->format('Y-m-d'),

                    'fecha_finalizacion' =>
                        $caso->fecha_finalizacion?->format('Y-m-d'),
                ];
            });
    }

    public function headings(): array
    {
        return [
            'Número expediente',
            'Cédula cliente',
            'Cliente',
            'Teléfono',
            'Correo',
            'Estado',
            'Fecha inicio',
            'Fecha finalización',
        ];
    }

    public function title(): string
    {
        return substr(
            $this->abogado->nombre . ' ' .
            $this->abogado->apellido,
            0,
            31
        );
    }
}