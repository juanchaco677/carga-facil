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
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
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
