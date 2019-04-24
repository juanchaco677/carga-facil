<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArchivoMultimediasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('archivo_multimedias', function (Blueprint $table) {
            $table->string('id',15);
            $table->string('nombre',75);
            $table->enum('tipo', ['PDF', 'XLSX','DOCX','XLS','DOC','JPG','JPEG','JPGE','PNG']);
            $table->integer('tamano');
            $table->string('id_publicacion',15)->nullable();
            $table->foreign('id_publicacion')->references('id')->on('publicacion_cargas');
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
        Schema::dropIfExists('archivo_multimedias');
    }
}
