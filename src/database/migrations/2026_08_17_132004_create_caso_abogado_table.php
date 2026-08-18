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
        Schema::create('caso_abogado', function (Blueprint $table) {
            $table->foreignId('caso_id')
                ->constrained('casos')
                ->restrictOnDelete()
                ->cascadeOnUpdate();

            $table->foreignId('abogado_id')
                ->constrained('abogados')
                ->restrictOnDelete()
                ->cascadeOnUpdate();

            $table->timestamps();

            $table->primary([
                'caso_id',
                'abogado_id'
            ]);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('caso_abogado');
    }
};
