<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePublicacionCargasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('publicacion_cargas', function (Blueprint $table) {
            $table->string('id',15);
            $table->enum('prioridad', ['A','M','B']);//ALTA,MEDIA Y BAJA
            $table->string('titulo',50);
            $table->longText('descripcion');
            $table->dateTime('fecha');
            $table->boolean('estado');//abierto=>1, cerrado=>0
            $table->string('id_remitente',8);
            $table->string('id_persona_remitente',15);
            $table->foreign(['id_remitente','id_persona_remitente'])->references(['nit','id_persona'])->on('empresas');
            $table->string('id_carga',15);
            $table->foreign('id_carga')->references('id')->on('cargas');
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
        Schema::dropIfExists('publicacion_cargas');
    }
}
