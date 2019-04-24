<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVehiculosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vehiculos', function (Blueprint $table) {
            $table->string('placa',8);
            $table->string('modelo',30);
            $table->integer('ano_compra')->nullable();
            $table->unsignedBigInteger('id_marca_vehiculo');
            $table->foreign('id_marca_vehiculo')->references('id')->on('marca_vehiculos');
            $table->string('id_conductor',15);
            $table->foreign('id_conductor')->references('id')->on('usuarios');
            $table->primary('placa');
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
        Schema::dropIfExists('vehiculos');
    }
}
