<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use RuntimeException;

class DatosEjemploSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void {
        
        $path = database_path('sql/datos_ejemplo.sql');

        if (! file_exists($path)) {
            throw new RuntimeException(
                "No existe el archivo SQL: {$path}"
            );
        }

        $sql = file_get_contents($path);

        DB::unprepared($sql);

        $this->command->info(
            'Datos de ejemplo insertados correctamente.'
        );

    }
}
