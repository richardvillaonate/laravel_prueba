<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>
        @yield('title', 'Bufete Jurídico')
    </title>

    @vite([
        'resources/css/app.css',
        'resources/js/app.js'
    ])

    <style>
        body {
            background-color: #f5f6f8;
        }

        .sidebar {
            min-height: 100vh;
        }

        .sidebar .nav-link {
            color: rgba(255, 255, 255, .75);
        }

        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            color: #fff;
            background-color: rgba(255, 255, 255, .1);
        }
    </style>
</head>

<body>

    @yield('content')

</body>
</html>