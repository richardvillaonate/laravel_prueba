@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')

<div class="container-fluid">

    <div class="row">

        {{-- Sidebar --}}
        <aside class="col-md-3 col-lg-2 bg-dark sidebar p-3">
            <div class="text-center bg-white p-2">
                 <img
                                src="{{ asset('images/logo.png') }}"
                                alt="Logo Bufete Abogados"
                                style="max-width: 100px;"
                            >
                        
            </div>

            <h5 class="text-white my-4">
                ⚖️ Bufete Jurídico
            </h5>

            <ul class="nav nav-pills flex-column gap-2">

                <li class="nav-item">

                    <a
                        href="{{ route('dashboard') }}"
                        class="nav-link active"
                    >
                        Dashboard
                    </a>

                </li>

                <!-- <li class="nav-item">

                    <a
                        href="#"
                        class="nav-link"
                    >
                        Casos
                    </a>

                </li>

                <li class="nav-item">

                    <a
                        href="#"
                        class="nav-link"
                    >
                        Clientes
                    </a>

                </li>

                <li class="nav-item">

                    <a
                        href="#"
                        class="nav-link"
                    >
                        Abogados
                    </a>

                </li> -->

            </ul>

            <hr class="text-secondary">

            <form
                method="POST"
                action="{{ route('logout') }}"
            >

                @csrf

                <button
                    type="submit"
                    class="btn btn-outline-light w-100"
                >
                    Cerrar sesión
                </button>

            </form>

        </aside>


            


        {{-- Contenido --}}
        <main class="col-md-9 col-lg-10 p-4">

             {{-- Cards --}}

<div class="row g-4 mb-4">

    {{-- Casos --}}
    <div class="col-md-6 col-xl-3">

        <div class="card border-0 shadow-sm h-100">

            <div class="card-body">

                <p class="text-muted mb-1">
                    Casos
                </p>

                <h3 class="fw-bold">
                    {{ $totalCasos }}
                </h3>

                <small class="text-muted">
                    Total de casos registrados
                </small>

            </div>

        </div>

    </div>


    {{-- Clientes --}}
    <div class="col-md-6 col-xl-3">

        <div class="card border-0 shadow-sm h-100">

            <div class="card-body">

                <p class="text-muted mb-1">
                    Clientes
                </p>

                <h3 class="fw-bold">
                    {{ $totalClientes }}
                </h3>

                <small class="text-muted">
                    Clientes registrados
                </small>

            </div>

        </div>

    </div>


    {{-- Abogados --}}
    <div class="col-md-6 col-xl-3">

        <div class="card border-0 shadow-sm h-100">

            <div class="card-body">

                <p class="text-muted mb-1">
                    Abogados
                </p>

                <h3 class="fw-bold">
                    {{ $totalAbogados }}
                </h3>

                <small class="text-muted">
                    Abogados registrados
                </small>

            </div>

        </div>

    </div>


    {{-- Estados --}}
     <div class="col-md-6 col-xl-3">

                <div class="card border-0 shadow-sm h-100">

                    <div class="card-body">

                        <p class="text-muted mb-1">
                            Clientes nuevos
                        </p>

                        <h3 class="fw-bold">
                            {{ $clientesNuevosMes }}
                        </h3>

                        <small class="text-muted">
                            Registrados este mes
                        </small>

                    </div>

                </div>

    

    </div>

   

</div>
   

        <div class="row">
             <div class="col-md-12 col-xl-12">

        <div class="card border-0 shadow-sm h-100">

            <div class="card-body">

                <h5 class="fw-bold mb-3">
                        Acciones rápidas
                    </h5>

                    <div class="d-flex gap-2 flex-wrap">

                        <button
                            type="button"
                            class="btn btn-dark"
                            id="btnExportar"
                        >
                            Generar Excel
                        </button>

                    </div>

                    <div
                        id="exportResult"
                        class="mt-3"
                    ></div>

            </div>

        </div>

    </div>
   
           
        <div class="row g-4 mb-1 pb-1">

        

        
    </div>
        <div class="col-lg-12">
             <div class="card border-0 shadow-sm mb-4">

            <div class="card-body">

                <div class="d-flex justify-content-between align-items-center mb-4">

                    <div>
                        <h5 class="fw-bold mb-1">
                            Últimos 5 casos
                        </h5>

                        <p class="text-muted mb-0">
                            Casos registrados recientemente
                        </p>
                    </div>

                </div>


                <div class="table-responsive">

                    <table class="table align-middle">

                        <thead>

                            <tr>

                                <th>
                                    Expediente
                                </th>

                                <th>
                                    Cliente
                                </th>

                                <th>
                                    Estado
                                </th>

                                <th>
                                    Abogados
                                </th>

                                <th>
                                    Fecha
                                </th>

                            </tr>

                        </thead>

                        <tbody>

                            @forelse($ultimosCasos as $caso)

                                <tr>

                                    <td>

                                        <strong>
                                            {{ $caso->numero_expediente }}
                                        </strong>

                                    </td>

                                    <td>

                                        {{ $caso->cliente->nombre ?? 'N/A' }}

                                    </td>

                                    <td>

                                        <span class="badge bg-secondary">

                                            {{ $caso->estado->nombre ?? 'Sin estado' }}

                                        </span>

                                    </td>

                                    <td>

                                        @forelse($caso->abogados as $abogado)

                                            <span class="badge bg-light text-dark">

                                                {{ $abogado->nombre }}

                                            </span>

                                        @empty

                                            <span class="text-muted">
                                                Sin abogados
                                            </span>

                                        @endforelse

                                    </td>

                                    <td>

                                        {{ $caso->created_at?->format('d/m/Y') }}

                                    </td>

                                </tr>

                            @empty

                                <tr>

                                    <td
                                        colspan="5"
                                        class="text-center text-muted py-4"
                                    >
                                        No existen casos registrados.
                                    </td>

                                </tr>

                            @endforelse

                        </tbody>

                    </table>

                </div>

            </div>

        </div>
        </div>



</div>

        </div>


       
        
        </main>

    </div>

</div>

@endsection

<script>
document.addEventListener('DOMContentLoaded', function () {

    const button = document.getElementById('btnExportar');

    if (!button) {
        return;
    }

    const result = document.getElementById('exportResult');

    button.addEventListener('click', async function () {

        button.disabled = true;
        button.innerText = 'Generando...';

        if (result) {
            result.innerHTML = '';
        }

        try {

            const response = await fetch(
                '{{ route('exportaciones.casos') }}',
                {
                    method: 'POST',

                    headers: {
                        'Accept': 'application/json',
                         'Authorization':
                         'Bearer {{ $apiToken }}'
                    }
                }
            );

            const data = await response.json();

            if (!response.ok) {
                throw new Error(
                    data.message ?? 'No se pudo generar el Excel.'
                );
            }

            if (result) {

                result.innerHTML = `
                    <div class="alert alert-success">
                        <strong>
                            Excel generado correctamente.
                        </strong>

                        <a
                            href="${data.data.url}"
                            class="btn btn-sm btn-success ms-3"
                            target="_blank"
                            download
                        >
                            Descargar Excel
                        </a>
                    </div>
                `;

            }

        } catch (error) {

            if (result) {

                result.innerHTML = `
                    <div class="alert alert-danger">
                        ${error.message}
                    </div>
                `;

            }

            console.error(error);

        } finally {

            button.disabled = false;
            button.innerText = 'Generar Excel';

        }

    });

});
</script>