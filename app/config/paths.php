<?php
define('ROOT_PATH',  '/tynkle');
define('ABSOLUTE_ASSET_PATH', ROOT_PATH.'/app/assets');
$server_name = array_key_exists( 'server_name',$_SERVER) ? $_SERVER['SERVER_NAME'] : "localhost";
define('ABSOLUTE_REDIRECT_PATH',  'http://'.$server_name.ROOT_PATH);
define('UPLOAD_PATH', $_SERVER['DOCUMENT_ROOT'].ROOT_PATH.'/app/public/uploads');
define('ABSOLUTE_UPLOAD_PATH', ROOT_PATH.'/app/public/uploads');
