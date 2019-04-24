<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pais extends Model
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
    * Relacion de departamentos a pais muchos a uno
    */
    public function departamentos()
    {
        return $this->belongsTo('App\Departamentos');
    }
}
