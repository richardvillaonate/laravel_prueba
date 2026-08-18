<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bufete Abogados</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    
</head>

<body>

    <div class="container py-5">

    <div class="row">
        <div class="col-12 text-center p-5">
            <img
                src="{{ asset('images/logo.png') }}"
                alt="Logo Bufete Abogados"
                style="max-width: 250px;"
            >

        </div>
    </div>

        <div class="card shadow">

            <div class="card-body">
                         <a
                            type="button"
                            class="btn btn-dark"
                            href="/login"
                            >
                            Login Admin
                        </a>

                <p class="text-muted text-center">
                    Bienvenidos gracias por llegar aqui.
                </p>


            </div>

        </div>

    </div>

</body>

</html>