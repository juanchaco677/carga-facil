<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmpresaLicitantesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empresa_licitantes', function (Blueprint $table) {
            $table->string('id_publicacion',15)->nullable();
            $table->foreign('id_publicacion')->references('id')->on('publicacion_cargas');
            $table->string('id_empresa',8);
            $table->string('id_persona',15);
            $table->foreign(['id_empresa','id_persona'])->references(['nit','id_persona'])->on('empresas');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('empresa_licitantes');
    }
}
