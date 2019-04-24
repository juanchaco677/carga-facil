<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNotificacionViajesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notificacion_viajes', function (Blueprint $table) {
            $table->string('id',15);
            $table->string('titulo',50);
            $table->longText('descripcion');
            $table->string('id_publicacion',15);
            $table->foreign('id_publicacion')->references('id')->on('publicacion_cargas');
            $table->string('id_remitente',15);
            $table->foreign('id_remitente')->references('nit')->on('empresas');
            $table->string('id_destinatario',15);
            $table->foreign('id_destinatario')->references('nit')->on('empresas');
            $table->string('id_viaje',15);
            $table->foreign('id_viaje')->references('id')->on('viajes');
            $table->boolean('estado')->default(1);//activo=>1, desactivado=>0
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
        Schema::dropIfExists('notificacion_viajes');
    }
}
