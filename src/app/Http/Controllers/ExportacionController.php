<?php

namespace App\Http\Controllers;

use App\Exports\CasosPorAbogadoExport;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
use App\Services\GenerarCasosExcelService;

class ExportacionController extends Controller
{
    public function casos( GenerarCasosExcelService $service): JsonResponse
    {
        $archivo = $service->generar();

         return response()->json([
            'message' => 'Excel generado correctamente.',
            'data' => [
                'nombre' => $archivo['nombre'],
                'ruta' => $archivo['ruta'],
                'url' => $archivo['url'],
            ],
        ]);
    }
}