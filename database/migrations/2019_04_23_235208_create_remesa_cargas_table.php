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
            $table->dateTime('fecha_cargue');
            $table->dateTime('fecha_descargue');
            $table->time('hora_cargue');
            $table->time('hora_descargue');
            $table->time('tiempo_pactado_cargue');
            $table->time('tiempo_pactado_descargue');
            $table->string('id_carga',15);
            $table->foreign('id_carga')->references('id')->on('cargas');
            $table->string('id_empresa_remitente',8);
            $table->string('id_persona_remitente',15);
            $table->foreign(['id_empresa_remitente','id_persona_remitente'])->references(['nit','id_persona'])->on('empresas');
            $table->string('id_empresa_destino',8);
            $table->string('id_persona_destino',15);
            $table->foreign(['id_empresa_destino','id_persona_destino'])->references(['nit','id_persona'])->on('empresas');
            $table->string('id_empresa_trans',8);
            $table->string('id_persona_trans',15);
            $table->foreign(['id_empresa_trans','id_persona_trans'])->references(['nit','id_persona'])->on('empresas');
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
