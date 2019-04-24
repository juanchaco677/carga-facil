<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRemesaCargasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('remesa_cargas', function (Blueprint $table) {
            $table->string('id',15);
            $table->timestamp('fecha_cargue');
            $table->timestamp('fecha_descargue');
            $table->time('hora_cargue');
            $table->time('hora_descargue');
            $table->time('tiempo_pactado_cargue');
            $table->time('tiempo_pactado_descargue');
            $table->string('id_carga',15);
            $table->foreign('id_carga')->references('id')->on('cargas');
            $table->string('id_empresa_remitente',15);
            $table->foreign('id_empresa_remitente')->references('id')->on('empresas');
            $table->string('id_empresa_destinatario',15);
            $table->foreign('id_empresa_destinatario')->references('id')->on('empresas');
            $table->string('id_empresa_transporta',15);
            $table->foreign('id_empresa_transporta')->references('id')->on('empresas');
            $table->string('id_empresa_transporta',15);
            $table->foreign('id_empresa_transporta')->references('id')->on('empresas');
            $table->primary('id');
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
        Schema::dropIfExists('remesa_cargas');
    }
}
