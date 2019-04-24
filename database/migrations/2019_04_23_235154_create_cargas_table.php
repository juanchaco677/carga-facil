<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCargasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cargas', function (Blueprint $table) {
            $table->string('id',15);
            $table->enum('tipo', ['N', 'I','O']);//NORMAL,INFORMAL,OTROS
            $table->longText('descripcion');
            $table->integer('cantidad_carga');//en kilogramos
            $table->unsignedBigInteger('id_polizas');
            $table->foreign('id_polizas')->references('id')->on('polizas');
            $table->string('id_remitente',8);
            $table->string('id_persona_remitente',15);
            $table->foreign(['id_remitente','id_persona_remitente'])->references(['nit','id_persona'])->on('empresas');
            $table->string('id_destinatario',8);
            $table->string('id_persona_destinario',15);
            $table->foreign(['id_destinatario','id_persona_destinario'])->references(['nit','id_persona'])->on('empresas');
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
        Schema::dropIfExists('cargas');
    }
}
