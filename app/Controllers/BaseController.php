<?php 
namespace Controllers;

class BaseController  {
     public function render($path, $data)
     {
         $full_path = \App::$BASE_DIR.'/templates/'.$path.'.php';

         ob_start();
             extract($data);
             require_once $full_path;
         return ob_get_clean();
     }
}