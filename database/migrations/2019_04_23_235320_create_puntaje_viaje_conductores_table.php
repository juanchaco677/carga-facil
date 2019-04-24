<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePuntajeViajeConductoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('puntaje_viaje_conductores', function (Blueprint $table) {
            $table->string('id',15);
            $table->double('cantidad',5,0);
            $table->string('id_viajes',15);
            $table->foreign('id_viajes')->references('id')->on('viajes');
            $table->string('id_transportadora',15);
            $table->foreign('id_transportadora')->references('nit')->on('empresas');
            $table->string('id_conductor',15);
            $table->foreign('id_conductor')->references('id')->on('usuarios');
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
        Schema::dropIfExists('puntaje_viaje_conductores');
    }
}
