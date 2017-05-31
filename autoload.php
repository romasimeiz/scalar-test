<?php

function autoload($class)
{
	require_once __DIR__.'/app/'.str_replace('\\', '/', $class).'.php';
}
spl_autoload_register('autoload');

require_once __DIR__.'/app/helpers.php';