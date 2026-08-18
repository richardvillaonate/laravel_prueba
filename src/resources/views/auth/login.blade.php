@extends('layouts.app')

@section('title', 'Iniciar sesión')

@section('content')

<div class="container min-vh-100 d-flex align-items-center justify-content-center">

    <div class="row w-100 justify-content-center">

        <div class="col-md-5 col-lg-4">

            <div class="card border-0 shadow">

                <div class="card-body p-4 p-lg-5">

                    <div class="text-center mb-4">

                        
                            <img
                                src="{{ asset('images/logo.png') }}"
                                alt="Logo Bufete Abogados"
                                style="max-width: 200px;"
                            >
                        
                        <p class="text-muted mt-5">
                            Administración - Credenciales
                        </p>
                        <div class="m-3">
                            <h6 class="">  correo: admin@bufete.com <br>
                                            contraseña: password
                             </h6>
                        </div>

                    </div>

                    @if ($errors->any())

                        <div class="alert alert-danger">
                            {{ $errors->first() }}
                        </div>

                    @endif

                    <form
                        method="POST"
                        action="{{ route('login.store') }}"
                    >

                        @csrf

                        <div class="mb-3">

                            <label
                                for="email"
                                class="form-label"
                            >
                                Correo electrónico
                            </label>

                            <input
                                type="email"
                                class="form-control"
                                id="email"
                                name="email"
                                value="{{ old('email') }}"
                                required
                                autofocus
                            >

                        </div>

                        <div class="mb-4">

                            <label
                                for="password"
                                class="form-label"
                            >
                                Contraseña
                            </label>

                            <input
                                type="password"
                                class="form-control"
                                id="password"
                                name="password"
                                required
                            >

                        </div>

                        <button
                            type="submit"
                            class="btn btn-primary w-100"
                        >
                            Iniciar sesión
                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

@endsection