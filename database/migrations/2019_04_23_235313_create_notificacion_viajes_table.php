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
            $table->string('id_remite',8);
            $table->string('id_per_remite',15);
            $table->foreign(['id_remite','id_per_remite'])->references(['nit','id_persona'])->on('empresas');
            $table->string('id_destino',8);
            $table->string('id_per_destino',15);
            $table->foreign(['id_destino','id_per_destino'])->references(['nit','id_persona'])->on('empresas');
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
