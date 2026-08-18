<?php

namespace App\Http\Controllers\Web;
use App\Models\Abogado;
use App\Models\Caso;
use App\Models\Cliente;
use App\Models\EstadoCaso;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $totalClientes = Cliente::count();
        $totalAbogados = Abogado::count();
        $totalCasos =Caso::count();

        $clientesNuevosMes = Cliente::whereMonth(
            'created_at',
            now()->month
        )
            ->whereYear(
                'created_at',
                now()->year
            )
            ->count();

         $abogadosConCasos = Abogado::withCount('casos')
            ->orderByDesc('casos_count')
            ->get();
             $abogadosConCasosCompletados = Abogado::withCount([
            'casos as casos_completados_count' => function ($query) {
                $query->whereHas('estado', function ($query) {
                    $query->whereIn('id', [
                        'Finalizado',
                    
                    ]);
                });
            }
        ])
            ->orderByDesc('casos_completados_count')
            ->get();

         $ultimosCasos = Caso::with([
            'cliente',
            'estado',
            'abogados',
        ])
            ->orderByDesc('id')
            ->limit(5)
            ->get();


        $casosPorEstado = EstadoCaso::withCount('casos')
            ->orderBy('nombre')
            ->get();


        return view('dashboard.index', [

            'user' => $request->session()->get('user'),
            'apiToken' => $request->session()->get('api_token'),
            'totalCasos'=>$totalCasos,
            'totalClientes' => $totalClientes,
            'totalAbogados' => $totalAbogados,
            'casosPorEstado' => $casosPorEstado,
            'clientesNuevosMes' => $clientesNuevosMes,
            'abogadosConCasos' => $abogadosConCasos,
            'abogadosConCasosCompletados' => $abogadosConCasosCompletados,
            'ultimosCasos' => $ultimosCasos,


        ]);
    }
}
