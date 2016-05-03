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
echo "<br> <a href='?city'>get Cities</a> <br>";
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

?>

<script   src="https://code.jquery.com/jquery-2.2.3.min.js"   integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="   crossorigin="anonymous"></script>
<script>

function getCountries(id) {
    console.log('getCountry');
    $.ajax({
        url: 'controllers/country.php',
        data: {'parameters' : {'parameters':id}, 'method': 'getCountry' },
        method: 'post',
        dataType: 'json',
        success: function(r){
            
       console.log(r);
            if (r != false){
                
                var html = "";
                
                $.each(r, function( key, value ) {
                    html += "<tr id='"+value.id+"'>";
                    html += "<td>" + (key+1) + "</td>";
                    html += "<td>" + value.rif + "</td>";
                    html += "<td>" + value.razon + "</td>";
                    html += "<td>" + value.dir + "</td>";
                    html += "<td>" + value.tlf + "</td>";
                    html += "<td><a class='edit icon'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a><a class='delete'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></a></td>";
                    html += "</tr>";
                    
                  });
                $('#companies tbody').html(html);
            }
        }
    }).fail(function(r){
        console.log(r);
            $('#msg .modal-body').html('Error consultando la(s) compañia(s)');
            $('#msg').addClass('success');
            $('#msg').modal('toggle');
    });
}
</script>