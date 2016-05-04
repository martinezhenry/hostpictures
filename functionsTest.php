
<script   src="https://code.jquery.com/jquery-2.2.3.min.js"   integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="   crossorigin="anonymous"></script>
<script src="admin/content/system/js/functions.js"></script>


<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//header("Content-Type: application/json; charset=utf-8");
echo "<br> <a href='?album'>get Albums</a><br>";
if (isset($_GET['album'])){
echo getAlbum();
}
echo "<br> <a href='?city'>get Cities</a> <br>";
if (isset($_GET['city'])){
echo getCity();
}
echo "<br> <a href='?comment'>get Comments</a><br>";
if (isset($_GET['comment'])){
echo getComment();
}
echo "<br> <a href='?country'>get Countries</a> <a onclick='getCountries()'>get Countries JS</a><br>";
if (isset($_GET['country'])){
echo utf8_decode( getCountry() );

}
echo "<br> <a href='?user'>get Users</a><br>";
if (isset($_GET['user'])){
echo getUsuario();
}


echo "<table id='data'><tbody></tbody></table>";
?>
