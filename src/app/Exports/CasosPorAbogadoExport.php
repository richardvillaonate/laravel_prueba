<?php

namespace App\Exports;

use App\Models\Abogado;
use Maatwebsite\Excel\Concerns\Export;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class CasosPorAbogadoExport implements Export, WithMultipleSheets
{
   public function sheets(): array
    {
        $sheets = [];

         $abogados = Abogado::whereHas('casos')
            ->orderBy('apellido')
            ->orderBy('nombre')
            ->get();

        foreach ($abogados as $abogado) {
            $sheets[] = new CasosAbogadoSheet($abogado);
        }

        return $sheets;
    }
}
