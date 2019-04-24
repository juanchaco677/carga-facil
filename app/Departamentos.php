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
    public function comments()
    {
        return $this->hasMany('App\Pais');
    }
}
