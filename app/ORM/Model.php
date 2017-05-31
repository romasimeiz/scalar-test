<?php
namespace ORM;
class Model
{
    public static $db;
    public static $table='';

    public static function all()
    {
        return static::query()->get();
    }

    public static function first()
    {
        return static::query()->limit(1)->getOne();
    }

    public static function query()
    {
        return new QueryBuilder(static::class, static::$table, static::$db);
    }

    public static function find($id)
    {
        return static::query()->where(" id = '$id'")->getOne();
    }

    public function hasMany($childClass, $childForeignKey)
    {
        return $childClass::query()->where("$childForeignKey = '{$this->id}'");
    }

    public function belongsTo($parentClass, $childForeignKey)
    {
        return $parentClass::query()->where("id = '{$this->$childForeignKey}'")
                              ->getOne();
    }
}