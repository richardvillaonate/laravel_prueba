<?php

namespace App\Console\Commands;

use Illuminate\Console\Attributes\Description;
use Illuminate\Console\Attributes\Signature;
use Illuminate\Console\Command;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\CasosPorAbogadoExport;
use App\Services\GenerarCasosExcelService;
#[Signature('casos:exportar-excel')]
#[Description('Genera un Excel con los casos separados por abogado')]
class GenerarCasosExcel extends Command
{
    /**
     * Execute the console command.
     */
    public function handle(GenerarCasosExcelService $service):int
    {
        $archivo = $service->generar();

        $this->info('Excel generado correctamente.');

        $this->line(
            'Nombre: ' . $archivo['nombre']
        );

        $this->line(
            'Ruta: ' . $archivo['ruta']
        );

        $this->line(
            'URL: ' . $archivo['url']
        );

        return self::SUCCESS;
    }
    }

