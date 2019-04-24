<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ciudades extends Model
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
    * Relacion de ciudades a departamentos muchos a uno
    */
    public function departamentos()
    {
        return $this->belongsTo('App\Departamentos');
    }
    /**
    * Relacion de ciudades a localizaciones uno a muchos
    */
    public function localizaciones()
    {
        return $this->hasMany('App\Localizaciones');
    }
}
