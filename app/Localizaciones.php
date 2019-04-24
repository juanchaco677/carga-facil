<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Localizaciones extends Model
{
    /**
    * Asignacion de atributos tabla
    *
    * @var array
    */
    protected $fillable = [
        'direccion','latitud_longitud','id_ciudad','id_empresa','id_persona'
    ];

    /**
    * Relacion de puntos a ciudad uno a uno
    */
    public function ciudades()
    {
        return $this->belongsTo('App\Ciudades');
    }
    /**
    * Relacion de puntos a empresas uno a uno
    */
    public function empresas()
    {
        return $this->belongsTo('App\Empresas');
    }
}
