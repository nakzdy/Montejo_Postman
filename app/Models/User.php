<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'tbl_user';
    protected $fillable = ['username', 'password', 'gender', 'jobid'];

    public $timestamps = false;
    protected $primaryKey = 'userid';
    public $incrementing = true;
    protected $keyType = 'int';

    public function job()
    {
        return $this->belongsTo(UserJob::class, 'jobid');
    }
}