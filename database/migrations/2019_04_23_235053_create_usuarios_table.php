<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsuariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->string('id',15);
            $table->string('nombre_uno',30);
            $table->string('nombre_dos',30)->nullable();
            $table->string('apellido_uno',30);
            $table->string('apellido_dos',30)->nullable();
            $table->string('nombre_completo');
            $table->string('correo',75)->unique();
            $table->enum('tipo', ['CO', 'DU','OT','DE']);//CONDUCTOR,DUEÑO,OTROS,DELEGADO
            $table->timestamp('email_verified_at')->nullable();
            $table->string('contrasena');
            $table->string('id_firma',15)->nullable();
            $table->foreign('id_firma')->references('id')->on('archivo_multimedia_usuarios');
            $table->string('id_foto',15)->nullable();
            $table->foreign('id_foto')->references('id')->on('archivo_multimedia_usuarios');
            $table->boolean('estado')->default(1);//activo=>1, desactivado=>0
            $table->primary('id');
            $table->rememberToken();
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
        Schema::dropIfExists('usuarios');
    }
}
