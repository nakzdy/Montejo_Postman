<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserJob extends Model
{
    protected $table = 'tbluserjob';
    protected $primaryKey = 'jobid';
    public $timestamps = true; 
    protected $fillable = ['job_title', 'job_description']; 
    // Define the relationship with the User model (one-to-many)
    public function users()
    {
        return $this->hasMany(User::class, 'jobid');
    }
}