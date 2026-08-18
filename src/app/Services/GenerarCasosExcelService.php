<?php

namespace App\Services;

use App\Exports\CasosPorAbogadoExport;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
class GenerarCasosExcelService
{
    /**
     * Create a new class instance.
     */
    public function __construct()
    {
        //
    }

     public function generar(): array
    {
        $nombreArchivo = sprintf(
            'casos-por-abogado-%s.xlsx',
            now()->format('Ymd-His')
        );

        $ruta = 'exportaciones/' . $nombreArchivo;

        Excel::store(
            new CasosPorAbogadoExport(),
            $ruta,
            'public'
        );

        return [
            'nombre' => $nombreArchivo,
            'ruta' => $ruta,
            'url' => Storage::disk('public')->url($ruta),
        ];
    }
}
