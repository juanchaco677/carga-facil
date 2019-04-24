<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNotificacionPublicacionesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notificacion_publicaciones', function (Blueprint $table) {
            $table->string('id',15);
            $table->string('titulo',50);
            $table->longText('descripcion');
            $table->string('id_publicacion',15);
            $table->foreign('id_publicacion')->references('id')->on('publicacion_cargas');
            $table->string('id_remitente',15);
            $table->foreign('id_remitente')->references('nit')->on('empresas');
            $table->string('id_transportadora',15);
            $table->foreign('id_transportadora')->references('nit')->on('empresas');
            $table->string('id_carga',15);
            $table->foreign('id_carga')->references('id')->on('cargas');
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
        Schema::dropIfExists('notificacion_publicaciones');
    }
}
