<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRequisitoCargasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requisito_cargas', function (Blueprint $table) {
            $table->string('id',15);
            $table->longText('descripcion');
            $table->string('id_archivo_requisito',15);
            $table->foreign('id_archivo_requisito')->references('id')->on('archivo_multimedia_requisitos');
            $table->string('id_empresa',8);
            $table->string('id_persona',15);
            $table->foreign(['id_empresa','id_persona'])->references(['nit','id_persona'])->on('empresas');
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
        Schema::dropIfExists('requisito_cargas');
    }
}
