<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        /*
        |--------------------------------------------------------------------------
        | Protección de claves foráneas
        |--------------------------------------------------------------------------
        |
        | Los registros relacionados no pueden eliminarse automáticamente.
        |
        */

        DB::statement('
            ALTER TABLE casos
            DROP FOREIGN KEY casos_cliente_id_foreign
        ');

        DB::statement('
            ALTER TABLE casos
            DROP FOREIGN KEY casos_estado_id_foreign
        ');

        DB::statement('
            ALTER TABLE caso_abogado
            DROP FOREIGN KEY caso_abogado_caso_id_foreign
        ');

        DB::statement('
            ALTER TABLE caso_abogado
            DROP FOREIGN KEY caso_abogado_abogado_id_foreign
        ');


        /*
        |--------------------------------------------------------------------------
        | casos -> clientes
        |--------------------------------------------------------------------------
        */

        DB::statement('
            ALTER TABLE casos
            ADD CONSTRAINT casos_cliente_id_foreign
            FOREIGN KEY (cliente_id)
            REFERENCES clientes(id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT
        ');


        /*
        |--------------------------------------------------------------------------
        | casos -> estados_caso
        |--------------------------------------------------------------------------
        */

        DB::statement('
            ALTER TABLE casos
            ADD CONSTRAINT casos_estado_id_foreign
            FOREIGN KEY (estado_id)
            REFERENCES estados_caso(id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT
        ');


        /*
        |--------------------------------------------------------------------------
        | caso_abogado -> casos
        |--------------------------------------------------------------------------
        */

        DB::statement('
            ALTER TABLE caso_abogado
            ADD CONSTRAINT caso_abogado_caso_id_foreign
            FOREIGN KEY (caso_id)
            REFERENCES casos(id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT
        ');


        /*
        |--------------------------------------------------------------------------
        | caso_abogado -> abogados
        |--------------------------------------------------------------------------
        */

        DB::statement('
            ALTER TABLE caso_abogado
            ADD CONSTRAINT caso_abogado_abogado_id_foreign
            FOREIGN KEY (abogado_id)
            REFERENCES abogados(id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT
        ');


        /*
        |--------------------------------------------------------------------------
        | TRIGGERS
        |--------------------------------------------------------------------------
        |
        | Laravel no tiene un método Schema::createTrigger().
        | Por eso utilizamos SQL directamente.
        |
        */


        // Abogados

        DB::unprepared('
            CREATE TRIGGER prevent_delete_abogados
            BEFORE DELETE ON abogados
            FOR EACH ROW
            BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar registros de abogados";
            END
        ');


        // Clientes

        DB::unprepared('
            CREATE TRIGGER prevent_delete_clientes
            BEFORE DELETE ON clientes
            FOR EACH ROW
            BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar registros de clientes";
            END
        ');


        // Casos

        DB::unprepared('
            CREATE TRIGGER prevent_delete_casos
            BEFORE DELETE ON casos
            FOR EACH ROW
            BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar registros de casos";
            END
        ');


        // Estados

        DB::unprepared('
            CREATE TRIGGER prevent_delete_estados_caso
            BEFORE DELETE ON estados_caso
            FOR EACH ROW
            BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar registros de estados";
            END
        ');


        // Relación caso-abogado

        DB::unprepared('
            CREATE TRIGGER prevent_delete_caso_abogado
            BEFORE DELETE ON caso_abogado
            FOR EACH ROW
            BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar relaciones entre casos y abogados";
            END
        ');


        // Usuarios

        DB::unprepared('
            CREATE TRIGGER prevent_delete_users
            BEFORE DELETE ON users
            FOR EACH ROW
            BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar usuarios";
            END
        ');


        // Tokens Sanctum

        DB::unprepared('
            CREATE TRIGGER prevent_delete_personal_access_tokens
            BEFORE DELETE ON personal_access_tokens
            FOR EACH ROW
            BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar tokens de autenticación";
            END
        ');
    }


    public function down(): void
    {
        /*
        |--------------------------------------------------------------------------
        | Eliminar triggers
        |--------------------------------------------------------------------------
        */

        DB::unprepared(
            'DROP TRIGGER IF EXISTS prevent_delete_abogados'
        );

        DB::unprepared(
            'DROP TRIGGER IF EXISTS prevent_delete_clientes'
        );

        DB::unprepared(
            'DROP TRIGGER IF EXISTS prevent_delete_casos'
        );

        DB::unprepared(
            'DROP TRIGGER IF EXISTS prevent_delete_estados_caso'
        );

        DB::unprepared(
            'DROP TRIGGER IF EXISTS prevent_delete_caso_abogado'
        );

        DB::unprepared(
            'DROP TRIGGER IF EXISTS prevent_delete_users'
        );

        DB::unprepared(
            'DROP TRIGGER IF EXISTS prevent_delete_personal_access_tokens'
        );


        /*
        |--------------------------------------------------------------------------
        | Restaurar claves foráneas
        |--------------------------------------------------------------------------
        */

        DB::statement('
            ALTER TABLE casos
            DROP FOREIGN KEY casos_cliente_id_foreign
        ');

        DB::statement('
            ALTER TABLE casos
            DROP FOREIGN KEY casos_estado_id_foreign
        ');

        DB::statement('
            ALTER TABLE caso_abogado
            DROP FOREIGN KEY caso_abogado_caso_id_foreign
        ');

        DB::statement('
            ALTER TABLE caso_abogado
            DROP FOREIGN KEY caso_abogado_abogado_id_foreign
        ');


        DB::statement('
            ALTER TABLE casos
            ADD CONSTRAINT casos_cliente_id_foreign
            FOREIGN KEY (cliente_id)
            REFERENCES clientes(id)
            ON UPDATE CASCADE
        ');

        DB::statement('
            ALTER TABLE casos
            ADD CONSTRAINT casos_estado_id_foreign
            FOREIGN KEY (estado_id)
            REFERENCES estados_caso(id)
            ON UPDATE CASCADE
        ');

        DB::statement('
            ALTER TABLE caso_abogado
            ADD CONSTRAINT caso_abogado_caso_id_foreign
            FOREIGN KEY (caso_id)
            REFERENCES casos(id)
            ON UPDATE CASCADE
        ');

        DB::statement('
            ALTER TABLE caso_abogado
            ADD CONSTRAINT caso_abogado_abogado_id_foreign
            FOREIGN KEY (abogado_id)
            REFERENCES abogados(id)
            ON UPDATE CASCADE
        ');
    }
};