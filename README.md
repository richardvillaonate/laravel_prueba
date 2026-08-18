# Prueba Técnica — Sistema de Gestión de Casos Jurídicos

Aplicación desarrollada para la gestión de casos de un bufete de abogados utilizando **Laravel, MySQL, Blade, Bootstrap y Docker**.

La solución implementa:

* Diseño de base de datos relacional.
* Gestión de clientes.
* Gestión de casos.
* Gestión de estados.
* Gestión de abogados.
* Relación muchos a muchos entre casos y abogados.
* Autenticación mediante Laravel Sanctum y Bearer Token.
* Consulta de casos mediante API.
* Exportación de información a Excel.
* Interfaz web con Blade y Bootstrap.
* Ejecución mediante Docker y Docker Compose.
* Datos de prueba mediante Seeder.

---

# 1. MYSQL — Base de datos

## 1.1 Modelo relacional

La base de datos está estructurada de la siguiente manera:

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
```

### Relaciones

* Un **cliente** puede tener varios casos.
* Un **caso** pertenece a un cliente.
* Un **caso** puede tener varios abogados.
* Un **abogado** puede participar en varios casos.
* Un **caso** pertenece a un estado.
* La relación entre `casos` y `abogados` se gestiona mediante `caso_abogado`.

---

# 2. Consultas SQL solicitadas

## 2.1 Consultar los casos de un cliente por cédula

La consulta permite obtener los casos asociados a un cliente utilizando su número de cédula.

```sql
SELECT 
    c.*,
    cl.cedula,
    cl.nombre,
    cl.apellido
FROM casos AS c
INNER JOIN clientes AS cl
    ON cl.id = c.cliente_id
WHERE cl.cedula = '1001001002';
```

La cédula puede reemplazarse por la correspondiente al cliente que se desea consultar.

---

## 2.2 Consultar todos los casos en orden ascendente

```sql
SELECT *
FROM casos
ORDER BY id ASC;
```

También es posible ordenar por número de expediente:

```sql
SELECT *
FROM casos
ORDER BY numero_expediente ASC;
```

---

## 2.3 Consultar los primeros 5 casos

```sql
SELECT *
FROM casos
ORDER BY id ASC
LIMIT 5;
```

---

# 3. Estructura principal de la base de datos

Las principales tablas utilizadas por la aplicación son:

```text
clientes
casos
estados
abogados
caso_abogado
users
personal_access_tokens
```

## 3.1 Migraciones

Las tablas son creadas mediante las migraciones de Laravel.

```text
database/
└── migrations/
    ├── xxxx_xx_xx_create_clientes_table.php
    ├── xxxx_xx_xx_create_estados_table.php
    ├── xxxx_xx_xx_create_abogados_table.php
    ├── xxxx_xx_xx_create_casos_table.php
    ├── xxxx_xx_xx_create_caso_abogado_table.php
    └── ...
```

---

# 4. Datos de ejemplo

La aplicación incluye datos de prueba para facilitar la evaluación:

* Clientes.
* Casos.
* Estados.
* Abogados.
* Relaciones entre casos y abogados.
* Usuarios para autenticación.
* Datos relacionados con las sentencias/pruebas requeridas.

Los datos se cargan mediante un Seeder de Laravel.

Seeder principal:

```text
database/seeders/DatosEjemploSeeder.php
```

Para ejecutarlo:

```bash
docker compose exec php php artisan db:seed --class=DatosEjemploSeeder
```

---

# 5. API — Autenticación

La API utiliza **Laravel Sanctum** para autenticación mediante Bearer Token.

El flujo es:

```text
POST /api/login
       │
       ▼
Credenciales
       │
       ▼
Laravel Sanctum
       │
       ▼
Bearer Token
       │
       ▼
Endpoint protegido
```

## 5.1 Login

Endpoint:

```http
POST http://localhost:8080/api/login
```

Body:

```json
{
    "email": "admin@bufete.com",
    "password": "password"
}
```

La respuesta proporciona el token necesario para consumir los endpoints protegidos.

---

# 6. Consulta de un caso

La prueba solicita implementar un recurso autenticado para consultar toda la información de un caso mediante su `id`.

Endpoint:

```http
GET http://localhost:8080/api/casos/{id}
```

Ejemplo:

```http
GET http://localhost:8080/api/casos/1
```

Headers:

```http
Authorization: Bearer TOKEN
Accept: application/json
```

La respuesta incluye:

* Información del caso.
* Información del cliente.
* Estado del caso.
* Abogados asociados.
* Información relacionada disponible para el caso.

---

# 7. Exportación a Excel

La aplicación permite generar un archivo Excel con la información de los clientes y sus casos, separados por abogado en hojas independientes.

## 7.1 Exportación mediante Artisan

Comando:

```bash
docker compose exec php php artisan casos:exportar-excel
```

El archivo generado contiene información como:

* Número de expediente.
* Cédula del cliente.
* Nombre del cliente.
* Teléfono.
* Correo.
* Estado.
* Fecha de inicio.
* Fecha de finalización.

Cada abogado puede tener su propia hoja dentro del archivo Excel.

---

# 8. Exportación mediante API

También se implementó un endpoint para generar el Excel desde la aplicación.

Endpoint:

```http
POST http://localhost:8080/api/exportaciones/casos
```

Requiere autenticación mediante Bearer Token.

Headers:

```http
Authorization: Bearer TOKEN
Accept: application/json
```

La respuesta proporciona la información necesaria para acceder al archivo generado.

---

# 9. Frontend

La interfaz web fue desarrollada utilizando:

* Laravel Blade.
* Bootstrap.
* HTML.
* CSS.
* JavaScript.

## 9.1 Login

Permite al usuario autenticarse utilizando las credenciales registradas en el sistema.

## 9.2 Dashboard

Después de autenticarse, el usuario puede acceder a las funcionalidades principales:

* Consulta de casos.
* Consulta de clientes.
* Consulta de abogados.
* Visualización de estados.
* Información relacionada con casos.
* Generación del Excel.
* Descarga del Excel.
* Visualización de información de prueba.

---

# 10. Docker

La aplicación está preparada para ejecutarse utilizando **Docker Compose**, evitando depender de la configuración PHP/MySQL instalada directamente en el equipo.

Los principales servicios son:

```text
Laravel / PHP
MySQL
Nginx
```

Para levantar los servicios:

```bash
docker compose up -d --build
```

Verificar que los contenedores estén ejecutándose:

```bash
docker compose ps
```

Ver logs:

```bash
docker compose logs -f
```

---

# 11. Instalación y ejecución del proyecto

## 11.1 Requisitos

Se recomienda tener instalado:

* Docker.
* Docker Compose.
* Git.
* Node.js.
* npm.

No es necesario instalar PHP o MySQL directamente en el equipo cuando se utilizan los contenedores correspondientes.

---

## 11.2 Clonar el repositorio

```bash
git clone URL_DEL_REPOSITORIO
```

Entrar al proyecto:

```bash
cd laravel_prueba
```

---

# 12. Configuración del archivo `.env`

Copiar el archivo de configuración:

```bash
cp .env.example .env
```

Configurar las variables de entorno.

Ejemplo:

```env
APP_NAME="Bufete Jurídico"
APP_ENV=local
APP_DEBUG=true
APP_URL=http://localhost:8080

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel_prueba
DB_USERNAME=root
DB_PASSWORD=root
```

> Importante: cuando Laravel se ejecuta dentro de Docker, `DB_HOST` debe corresponder al nombre del servicio de MySQL definido en `docker-compose.yml`, normalmente `mysql`.

---

# 13. Levantar Docker

Construir y levantar los contenedores:

```bash
docker compose up -d --build
```

Verificar:

```bash
docker compose ps
```

La aplicación PHP debe estar disponible dentro del contenedor correspondiente.

---

# 14. Instalar dependencias de PHP

Instalar las dependencias de Composer:

```bash
docker compose exec php composer install
```

---

# 15. Instalar dependencias de Node.js

La aplicación también requiere las dependencias frontend.

Desde el directorio del proyecto:

```bash
npm install
```

Si se desea ejecutar Vite durante el desarrollo:

```bash
npm run dev
```

Para generar los archivos frontend para producción:

```bash
npm run build
```

> Si Node.js y npm no están instalados localmente, deben instalarse antes de ejecutar estos comandos.

---

# 16. Generar APP_KEY

Ejecutar:

```bash
docker compose exec php php artisan key:generate
```

Esto generará la clave de aplicación en el archivo `.env`.

---

# 17. Ejecutar las migraciones

Crear las tablas:

```bash
docker compose exec php php artisan migrate
```

Si se desea reconstruir completamente la base de datos:

```bash
docker compose exec php php artisan migrate:fresh
```

---

# 18. Cargar los datos de ejemplo

Ejecutar el Seeder:

```bash
docker compose exec php php artisan db:seed
```

O ejecutar específicamente:

```bash
docker compose exec php php artisan db:seed --class=DatosEjemploSeeder
```

Para reconstruir la base de datos y cargar nuevamente todos los datos de prueba:

```bash
docker compose exec php php artisan migrate:fresh --seed
```

---

# 19. Crear enlace de Storage

Ejecutar:

```bash
docker compose exec php php artisan storage:link
```

Esto permite acceder desde el navegador a los archivos almacenados públicamente.

---

# 20. Limpiar caché

Después de realizar cambios en configuración, rutas o vistas:

```bash
docker compose exec php php artisan optimize:clear
```

También puede utilizarse:

```bash
docker compose exec php php artisan config:clear
docker compose exec php php artisan cache:clear
docker compose exec php php artisan route:clear
docker compose exec php php artisan view:clear
```

---

# 21. Secuencia completa de instalación

Para una instalación desde cero, la secuencia recomendada es:

```bash
git clone URL_DEL_REPOSITORIO

cd laravel_prueba

cp .env.example .env

docker compose up -d --build

docker compose exec php composer install

npm install

docker compose exec php php artisan key:generate

docker compose exec php php artisan migrate

docker compose exec php php artisan db:seed --class=DatosEjemploSeeder

docker compose exec php php artisan storage:link

docker compose exec php php artisan optimize:clear

npm run build
```

Para desarrollo frontend, en lugar de `npm run build`:

```bash
npm run dev
```

---

# 22. Acceso a la aplicación

Una vez iniciados los contenedores, acceder a:

```text
http://localhost:8080
```

La aplicación mostrará la pantalla de login.

---

# 23. Credenciales de prueba

Usuario:

```text
admin@example.com
```

Contraseña:

```text
password
```

> Si las credenciales fueron modificadas en `DatosEjemploSeeder.php`, deben utilizarse las definidas actualmente en dicho Seeder.

---

# 24. Pruebas principales

## 24.1 Login

```http
POST http://localhost:8080/api/login
```

Body:

```json
{
    "email": "admin@example.com",
    "password": "password"
}
```

Guardar el token recibido para las siguientes solicitudes.

---

## 24.2 Consultar un caso

```http
GET http://localhost:8080/api/casos/1
```

Header:

```http
Authorization: Bearer TOKEN
```

---

## 24.3 Generar Excel mediante API

```http
POST http://localhost:8080/api/exportaciones/casos
```

Header:

```http
Authorization: Bearer TOKEN
```

---

## 24.4 Generar Excel mediante Artisan

```bash
docker compose exec php php artisan casos:exportar-excel
```

---

## 24.5 Descargar Excel

El archivo generado se encuentra en:

```text
storage/app/public/exportaciones/
```

Y puede ser accesible mediante:

```text
/storage/exportaciones/casos-por-abogado-YYYYMMDD-HHMMSS.xlsx
```

---

# 25. Verificación final

Antes de entregar la prueba, verificar:

```bash
docker compose ps
```

Todos los servicios necesarios deben estar activos.

Verificar Laravel:

```bash
docker compose exec php php artisan --version
```

Verificar migraciones:

```bash
docker compose exec php php artisan migrate:status
```

Verificar rutas:

```bash
docker compose exec php php artisan route:list
```

Verificar que existan los datos:

```bash
docker compose exec php php artisan tinker
```

Ejemplo:

```php
App\Models\Cliente::count();
App\Models\Caso::count();
App\Models\Abogado::count();
```

Finalmente, comprobar:

```text
http://localhost:8080
```

y realizar el flujo completo:

```text
Login
  ↓
Dashboard
  ↓
Consultar casos
  ↓
Consultar información relacionada
  ↓
Generar Excel
  ↓
Descargar Excel
```

---

# 26. Resumen de tecnologías

| Tecnología      | Uso                   |
| --------------- | --------------------- |
| Laravel         | Backend y API         |
| PHP             | Lenguaje principal    |
| MySQL           | Base de datos         |
| Laravel Sanctum | Autenticación API     |
| Blade           | Vistas                |
| Bootstrap       | Interfaz              |
| Laravel Excel   | Exportación Excel     |
| Docker          | Contenedores          |
| Docker Compose  | Orquestación          |
| Node.js         | Herramientas frontend |
| npm             | Dependencias frontend |
| Vite            | Compilación de assets |
| Git             | Control de versiones  |

---

# 27. Orden recomendado para la evaluación

```text
1. Clonar repositorio
        ↓
2. Configurar .env
        ↓
3. Levantar Docker
        ↓
4. composer install
        ↓
5. npm install
        ↓
6. Generar APP_KEY
        ↓
7. Ejecutar migraciones
        ↓
8. Ejecutar Seeder
        ↓
9. Ejecutar npm run build
        ↓
10. Abrir http://localhost:8080
        ↓
11. Iniciar sesión
        ↓
12. Probar API
        ↓
13. Generar Excel
        ↓
14. Descargar Excel
```

# 28. Consideraciones

La base de datos se prepara mediante las **migraciones de Laravel**, mientras que los registros necesarios para realizar la prueba se cargan mediante `DatosEjemploSeeder`.

El proyecto está preparado para ejecutarse mediante Docker, por lo que la configuración de MySQL utilizada por Laravel corresponde al servicio `mysql` definido en Docker Compose.

Para los assets frontend es necesario instalar las dependencias mediante:

```bash
npm install
```

y generar los recursos mediante:

```bash
npm run build
```

o utilizar:

```bash
npm run dev
```

durante el desarrollo.
