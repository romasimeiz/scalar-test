<?php
namespace Entity;

use ORM\Model;

class Employee extends Model
{
    public static $table = 'employee';

    public $salary;
    public $type;

    public function getRate()
    {
        if ($this->type == "hourly") {
            return $this->salary * 8 * 22;
        }
        return $this->salary;
    }

    public function department()
    {
        return $this->belongsTo('Entity\Department', 'department_id');
    }

    public function position()
    {
        return $this->belongsTo('Entity\Position', 'position_id');
    }
}