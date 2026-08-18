# Prueba Técnica — Sistema de Gestión de Casos Jurídicos

## Descripción

Aplicación desarrollada para la gestión de casos de un bufete de abogados, construida con Laravel, MySQL, Blade, Bootstrap y Docker.

La solución implementa los requerimientos solicitados en la prueba técnica:

- Diseño de base de datos relacional.
- Gestión de clientes.
- Gestión de casos.
- Gestión de estados.
- Gestión de abogados.
- Relación entre casos y abogados.
- Autenticación mediante Bearer Token.
- Consulta de casos mediante API.
- Exportación de información a Excel.
- Aplicación ejecutándose mediante Docker.

---

# 1. MYSQL — Base de datos

## 1.1 Diseño de la base de datos

La base de datos fue diseñada para representar las siguientes relaciones:

```text
CLIENTE
   │
   │ 1:N
   ▼
CASO
   │
   │ N:M
   ▼
ABOGADO

CASO
   │
   │ N:1
   ▼
ESTADO


app/
├── Console/
│   └── Commands/
│       └── GenerarCasosExcel.php
│
├── Exports/
│   ├── CasosPorAbogadoExport.php
│   └── CasosAbogadoSheet.php
│
├── Http/
│   ├── Controllers/
│   └── Middleware/
│
├── Models/
│   ├── Cliente.php
│   ├── Caso.php
│   ├── Abogado.php
│   └── Estado.php
│
└── Services/
    └── GenerarCasosExcelService.php

database/
├── migrations/
└── seeders/
    └── DatosEjemploSeeder.php

resources/
└── views/
    ├── auth/
    ├── dashboard/
    └── layouts/

routes/
├── api.php
└── web.php


1.3 Consulta de casos por cédula

La prueba solicita:

Consulta SQL que obtendría como resultado los casos asociados a un cliente al escribir la cédula de este último.

Consulta:

SELECT
    c.*,
    cl.cedula,
    cl.nombre,
    cl.apellido
FROM casos c
INNER JOIN clientes cl
    ON cl.id = c.cliente_id
WHERE cl.cedula = '1234567890';

La cédula puede reemplazarse por el valor correspondiente al cliente que se desea consultar.

1.4 Consulta de todos los casos en orden ascendente

La prueba solicita:

Consulta SQL que obtendría como resultado todos los casos en orden ascendente.

Consulta:

SELECT *
FROM casos
ORDER BY id ASC;

También puede ordenarse por número de expediente:

SELECT *
FROM casos
ORDER BY numero_expediente ASC;
1.5 Consulta de los primeros 5 registros

La prueba solicita:

Consulta SQL que obtendría como resultado todos los 5 primeros registros.

Consulta:

SELECT *
FROM casos
ORDER BY id ASC
LIMIT 5;
1.6 Datos de ejemplo

Se incluyen datos de ejemplo para realizar las pruebas de la aplicación:

Clientes.
Casos.
Estados.
Abogados.
Relaciones entre casos y abogados.
Usuarios de autenticación.

Los datos se cargan mediante Seeder de Laravel.
