<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Departamentos extends Model
{
    /**
    * The attributes that are mass assignable.
    *
    * @var array
    */
    protected $fillable = [
        'nombre'
    ];

    /**
    * Relacion de pais a departamento uno a muchos
    */
    public function pais()
    {
        return $this->hasMany('App\Pais');
    }
    /**
    * Relacion de ciudades a departamentos muchos a uno
    */
    public function ciudades()
    {
        return $this->belongsTo('App\Ciudades');
    }
}
