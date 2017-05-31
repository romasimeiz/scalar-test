<?php

require_once __DIR__.'/../autoload.php';

function grub_request()
{
	return [
		'server' => $_SERVER,
		'request' => $_REQUEST
	];
}

function send_response($response)
{
	$code = isset($response['code']) ? $response['code'] : 200;
	http_response_code($code);

    if (isset($response['headers'])) {
        foreach ($response['headers'] as $header => $value) {
            header("$header: $value");
        }
    }
    if (isset($response['body'])) {
        echo $response['body'];
    }
}

error_reporting(E_ALL);
ini_set('display_errors',1);


$request = grub_request();
App::bootstrap($request);
$response = App::run($request);
send_response($response);
