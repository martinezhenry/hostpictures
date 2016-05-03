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
echo "<br> <a href='?album'>get Albums</a><br>";
if (isset($_GET['album'])){
echo getAlbum();
}
echo "<br> <a href='?city'>get Cities</a><br>";
if (isset($_GET['city'])){
echo getCity();
}
echo "<br> <a href='?comment'>get Comments</a><br>";
if (isset($_GET['comment'])){
echo getComment();
}
echo "<br> <a href='?country'>get Countries</a><br>";
if (isset($_GET['country'])){
echo utf8_decode( getCountry() );
}
echo "<br> <a href='?user'>get Users</a><br>";
if (isset($_GET['user'])){
echo getUsuario();
}