<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
          Schema::create('casos', function (Blueprint $table) {
            $table->id();
            $table->string('numero_expediente', 50)
                  ->unique();
            $table->foreignId('cliente_id')
                ->constrained('clientes')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->foreignId('estado_id')
                   ->constrained('estados_caso')
                   ->restrictOnDelete()
                   ->cascadeOnUpdate();
            $table->date('fecha_inicio');
            $table->date('fecha_finalizacion')
                  ->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('casos');
    }
};
