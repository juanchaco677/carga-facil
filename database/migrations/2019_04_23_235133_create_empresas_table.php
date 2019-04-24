<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmpresasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empresas', function (Blueprint $table) {
            $table->string('nit',8)->default('99999999');
            $table->integer('ano');
            $table->enum('tipo', ['N', 'J']);//NATURAL O JURIDICO
            $table->string('id_persona',15);
            $table->foreign('id_persona')->references('id')->on('usuarios');
            $table->primary(['nit','id_persona']);
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
        Schema::dropIfExists('empresas');
    }
}
