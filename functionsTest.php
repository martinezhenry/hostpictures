<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



require_once './controllers/album.php';
require_once './controllers/city.php';
require_once './controllers/country.php';
require_once './controllers/usuario.php';
require_once './controllers/comment.php';

//header("Content-Type: application/json; charset=utf-8");
echo "<br>Albums<br>";
echo getAlbum();
echo "<br>Cities<br>";
echo getCity();
echo "<br>Comments<br>";
echo getComment();
echo "<br>Countries<br>";
echo utf8_decode( getCountry() );
echo "<br>Users<br>";
echo getUsuario();