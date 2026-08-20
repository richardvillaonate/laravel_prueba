# Prueba Técnica — Sistema de Gestión de Casos Jurídicos

Aplicación para la gestión de casos de un bufete de abogados desarrollada con:

* Laravel
* MySQL
* Blade
* Bootstrap
* Docker / Docker Compose
* Laravel Sanctum
* Laravel Excel

## Funcionalidades

* Visualizar cantidad de clientes.
* Visualizar cantidad de casos.
* Visualizar cantidad de abogados.
* Relación muchos a muchos entre casos y abogados.
* Autenticación mediante Laravel Sanctum.
* Consulta de casos mediante API.
* Exportación de casos a Excel.
* Dashboard web con Blade y Bootstrap.
* Datos de prueba mediante Seeder.


---

# 1. Requisitos

Solo necesitas tener instalado:

* [Docker](https://www.docker.com/)
* Git
* Node.js y npm

> No es necesario instalar PHP, Composer ni MySQL directamente en el equipo. PHP y MySQL se ejecutan mediante Docker.

---

# 2. Clonar el proyecto

```bash
git clone https://github.com/richardvillaonate/laravel_prueba.git
cd laravel_prueba
```

---

# 3. Levantar Docker

Desde la raíz del proyecto:

```bash
docker compose up -d --build
```

Verifica que los contenedores estén funcionando:

```bash
docker compose ps
```

> Espera unos segundos para que MySQL termine de iniciar antes de continuar.

---

# 4. Instalar dependencias de Laravel

El código de Laravel se encuentra dentro de `src`.

```bash
cd src
```

Instala las dependencias PHP:

```bash
docker compose exec php composer install
```

> Composer se ejecuta dentro del contenedor PHP.

---


# 5. Configurar la base de datos

La aplicación utiliza MySQL dentro de Docker.

> Importante: `DB_HOST` debe ser el nombre del servicio MySQL definido en `docker-compose.yml`, normalmente `mysql`.

el proyecto ya incluye el archivo `.env`, no es necesario realizar una configuración adicional.

---

# 6. Crear las tablas

Ejecuta las migraciones:

```bash
docker compose exec php php artisan migrate
```

---

# 7. Cargar datos de prueba

El proyecto incluye un Seeder con datos de ejemplo para facilitar la evaluación.

Incluye:

* Clientes.
* Casos.
* Estados.
* Abogados.
* Relaciones entre casos y abogados.
* Usuario de prueba.
* Datos relacionados con las sentencias requeridas.

Ejecuta:

```bash
docker compose exec php php artisan db:seed --class=DatosEjemploSeeder
```

---

# 8. Crear Storage

Ejecuta:

```bash
docker compose exec php php artisan storage:link
```

Esto permite acceder desde el navegador a los archivos generados por la aplicación.

---

# 9. Acceder al sistema

Una vez completados los pasos anteriores:

**Aplicación:**

```text
http://localhost:8080
```

La aplicación mostrará la pantalla de Login.

### Credenciales

```text
Email: admin@bufete.com
Password: password
```

---

# 10. API

La API utiliza Laravel Sanctum mediante Bearer Token.

## Login

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

La respuesta devuelve el token para consumir los endpoints protegidos.

---

## Consultar un caso

```http
GET http://localhost:8080/api/casos/1
```

Headers:

```http
Authorization: Bearer TOKEN
Accept: application/json
```

La respuesta contiene la información relacionada con:

* Caso.
* Cliente.
* Estado.
* Abogados asociados.

---

## Generar Excel mediante API

```http
POST http://localhost:8080/api/exportaciones/casos
```

Header:

```http
Authorization: Bearer TOKEN
```

---

# 11. Exportación a Excel

También es posible generar el Excel directamente mediante Artisan:

```bash
docker compose exec php php artisan casos:exportar-excel
```

El archivo se genera en:

```text
storage/app/public/exportaciones/
```

El Excel contiene información de los casos organizada por abogado.

---

# 12. Esquema y Consultas SQL solicitadas

### Script SQL del esquema

El esquema completo de la base de datos se encuentra en:

`database/sql/esquema.sql`

### Migraciones y restricciones

Los triggers necesarios para garantizar que ningún registro pueda eliminarse se crean mediante una migración adicional utilizando 

Esto permite que la misma protección definida en el esquema SQL pueda reproducirse al ejecutar las migraciones.

## Casos de un cliente por cédula

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

## Casos ordenados ascendentemente

```sql
SELECT *
FROM casos
ORDER BY id ASC;
```

## Primeros 5 casos

```sql
SELECT *
FROM casos
ORDER BY id ASC
LIMIT 5;
```

---

# 13. Estructura de la base de datos

```text
clientes
   │
   │ 1:N
   ▼
casos
   │
   │ N:M
   ▼
abogados

casos
   │
   │ N:1
   ▼
estados
```

La relación muchos a muchos entre casos y abogados utiliza:

```text
caso_abogado
```

Principales tablas:

```text
clientes
casos
estados
abogados
caso_abogado
users
personal_access_tokens
```

---

# 14. Comandos útiles

### Ver contenedores

```bash
docker compose ps
```

### Ver logs

```bash
docker compose logs -f
```

### Detener el proyecto

```bash
docker compose down
```

### Levantar nuevamente

```bash
docker compose up -d
```

### Reconstruir contenedores

```bash
docker compose up -d --build
```

### Reiniciar completamente la base de datos

> Este comando elimina las tablas y vuelve a ejecutar las migraciones.

```bash
docker compose exec php php artisan migrate:fresh
```

Después de utilizar `migrate:fresh`, cargar nuevamente los datos:

```bash
docker compose exec php php artisan db:seed --class=DatosEjemploSeeder
```

---

# 15. Instalación rápida — 5 minutos

Si es una instalación desde cero, ejecutar:

```bash
git clone https://github.com/richardvillaonate/laravel_prueba.git

cd laravel_prueba

docker compose up -d --build

cd src

docker compose exec php composer install

docker compose exec php php artisan migrate

docker compose exec php php artisan db:seed --class=DatosEjemploSeeder

docker compose exec php php artisan storage:link
```

Finalmente abrir:

```text
http://localhost:8080
```

### Credenciales de prueba

```text
Email: admin@bufete.com
Password: password
```

---

## Proyecto listo

Con los pasos anteriores se puede levantar el proyecto completo y probar:

* Login.
* Dashboard.
* Clientes.
* Casos.
* Abogados.
* Estados.
* Relaciones entre casos y abogados.
* API autenticada.
* Consulta de casos.
* Exportación a Excel.
* Datos de prueba.
