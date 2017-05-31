<?php

class App
{
    public static $BASE_DIR;
    public static $request;

    public static function bootstrap($request)
    {
        self::$BASE_DIR = __DIR__.'/..';
        self::$request = $request;
        $connection_string = "mysql:host=localhost;dbname=employees";
        $user = 'root';
        $password = '';
        ORM\Model::$db = new \PDO($connection_string , $user, $password);
    }

    public static function run($request)
    {
        $request_url = $request['server']['REQUEST_URI'];
        $request_url = strtok($request_url, '?');
        $routes = [
            '' => 'EmployeesController@index',
            '\/' => 'EmployeesController@index',
            '\/employees' => 'EmployeesController@index',
            '\/employees\/' => 'EmployeesController@index',
            '\/employees\/(\d+)' => 'EmployeesController@index',
            '\/employees\/department\/(\d+)' => 'EmployeesController@department',
            '\/employees\/department\/(\d+)\/(\d+)' => 'EmployeesController@departmentPaginated'
        ];

        foreach ($routes as $url => $handler) {
            $matches = [];
            preg_match('/^'.$url. '$/', $request_url, $matches);
            if (!empty($matches)) {
                list($class, $method) = explode('@', $handler);
                $class = 'Controllers\\'.$class;
                $controller = new $class;
                if (!empty($matches) && $matches[0]) {
                    $args =  array_slice($matches, 1);
                    return call_user_func_array(array($controller, $method), $args);
                }
            }
        }
        return ['body' => 'page not found', 'code' => 404];
    }
}