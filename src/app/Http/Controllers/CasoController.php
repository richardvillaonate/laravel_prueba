<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Caso;
use Illuminate\Http\JsonResponse;

class CasoController extends Controller
{
    public function show(int $id): JsonResponse
    {
        $caso = Caso::with([
            'cliente',
            'estado',
            'abogados',
        ])->find($id);

        if (!$caso) {
            return response()->json([
                'message' => 'Caso no encontrado.'
            ], 404);
        }

        return response()->json([
            'data' => $caso
        ]);
    }
}
