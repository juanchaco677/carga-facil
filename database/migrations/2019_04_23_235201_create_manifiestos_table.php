<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateManifiestosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('manifiestos', function (Blueprint $table) {
            $table->string('id',15);
            $table->string('id_localizacion_origen',15);
            $table->foreign('id_localizacion_origen')->references('id')->on('localizaciones');
            $table->string('id_localizacion_destino',15);
            $table->foreign('id_localizacion_destino')->references('id')->on('localizaciones');
            $table->string('id_empresa_transporta',8);
            $table->string('id_persona_transporta',15);
            $table->foreign(['id_empresa_transporta','id_persona_transporta'])->references(['nit','id_persona'])->on('empresas');
            $table->string('id_conductor',15);
            $table->foreign('id_conductor')->references('id')->on('usuarios');
            $table->string('id_dueno',15);
            $table->foreign('id_dueno')->references('id')->on('usuarios');
            $table->string('id_vehiculo',8);
            $table->foreign('id_vehiculo')->references('placa')->on('vehiculos');
            $table->string('id_carga',15);
            $table->foreign('id_carga')->references('id')->on('cargas');
            $table->decimal('valor_total_viaje',19,3);
            $table->decimal('valor_retencion_fuente',19,3);
            $table->decimal('valor_retencion_ica',19,3);
            $table->decimal('valor_neto_apagar',19,3);
            $table->decimal('valor_anticipo',19,3);
            $table->decimal('valor_saldo_pagar',19,3);
            $table->string('id_lugar_pago',15);
            $table->foreign('id_lugar_pago')->references('id')->on('localizaciones');
            $table->dateTime('fecha_pago');
            $table->decimal('cargue_pagado_remitente',19,3);
            $table->decimal('cargue_pagado_destinatario',19,3);
            $table->longText('observaciones');
            $table->dateTime('llegada_cargue');
            $table->dateTime('llegada_descargue');
            $table->dateTime('salida_cargue');
            $table->dateTime('salida_descargue');
            $table->time('hora_cargue');
            $table->time('hora_descargue');
            $table->string('id_firma_destinatario',15)->nullable();
            $table->foreign('id_firma_destinatario')->references('id')->on('archivo_multimedia_usuarios');
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
        Schema::dropIfExists('manifiestos');
    }
}
