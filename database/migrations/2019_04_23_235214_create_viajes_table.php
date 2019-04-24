<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateViajesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('viajes', function (Blueprint $table) {
            $table->string('id',15);
            $table->dateTime('fecha_inicio_hora');
            $table->dateTime('fecha_final_hora');
            $table->string('id_manifiesto',15);
            $table->foreign('id_manifiesto')->references('id')->on('manifiestos');
            $table->string('id_remision',15);
            $table->foreign('id_remision')->references('id')->on('remesa_cargas');
            $table->string('id_carga',15);
            $table->foreign('id_carga')->references('id')->on('cargas');
            $table->string('id_localizacion',15);
            $table->foreign('id_localizacion')->references('id')->on('localizaciones');
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
        Schema::dropIfExists('viajes');
    }
}
