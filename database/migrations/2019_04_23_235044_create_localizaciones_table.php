<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLocalizacionesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('localizaciones', function (Blueprint $table) {
            $table->string('id',15);
            $table->string('direccion',75);
            $table->longText('latitud_longitud');//guardar como json {,,,}
            $table->integer('id_ciudad')->unsigned()->nullable();
            $table->foreign('id_ciudad')->references('id')->on('ciudades');
            $table->string('id_empresa',15)->nullable();
            $table->foreign('id_empresa')->references('id')->on('empresas');
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
        Schema::dropIfExists('localizaciones');
    }
}
