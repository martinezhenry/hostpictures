
<script   src="https://code.jquery.com/jquery-2.2.3.min.js"   integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="   crossorigin="anonymous"></script>
<script src="admin/content/system/js/functions.js"></script>
<script>
    
    $(document).ready(function (){

    $('#add').click(function(){
        
        var campo = ($('input').size()+1);
        html = "<label>Campo " + campo + ": </label><input type='text' name='" + $('#selCtrl').val() + "_" + campo  + "'/><br>";
        $('#createForm').append(html);
        
    });
    
    
    $('#selCtrl').change(function(){
        
        $('#createForm').html("");
        
    });
    $('#create').click(function(){
        if ($('input').size()>0){
            var object = $('#selCtrl').val();

            switch (object) {

                case 'country': 
                    var country = new Object();
                        if ($('input[name="country_1"]').length > 0)  country.nombre =  $('input[name="country_1"]').val(); else country.nombre =  "";
                        if ($('input[name="country_2"]').length > 0) { country.name = $('input[name="country_2"]').val(); } else { country.name = ""; }
                        if ($('input[name="country_3"]').length > 0)  country.nom =  $('input[name="country_3"]').val(); else country.nom = "";
                        if ($('input[name="country_4"]').length > 0)  country.iso2 = $('input[name="country_4"]').val(); else country.iso2 = "";
                        if ($('input[name="country_5"]').length > 0)  country.iso3 = $('input[name="country_5"]').val(); else country.iso3 = "";
                        if ($('input[name="country_6"]').length > 0)  country.phone_code = $('input[name="country_6"]').val(); else country.phone_code = "";
                    putCountries(country);
                    break;
                case 'city': 
                    var city = new Object();
                        if ($('input[name="city_1"]').length > 0)  city.nombre =  $('input[name="city_1"]').val(); else city.nombre =  "";
                        if ($('input[name="city_2"]').length > 0) { city.name = $('input[name="city_2"]').val(); } else { city.name = ""; }
                        if ($('input[name="city_3"]').length > 0)  city.nom =  $('input[name="city_3"]').val(); else city.nom = "";
                        if ($('input[name="city_4"]').length > 0)  city.idcountries = $('input[name="city_4"]').val(); else city.idcountries = "";
                    putCity(city);
                    break;
                case 'comment': 
                    var comment = new Object();
                        if ($('input[name="comment_1"]').length > 0)  comment.comment =  $('input[name="comment_1"]').val(); else comment.comment =  "";
                        if ($('input[name="comment_2"]').length > 0) { comment.likes = $('input[name="comment_2"]').val(); } else { comment.likes = ""; }
                        if ($('input[name="comment_4"]').length > 0)  comment.image_id = $('input[name="comment_4"]').val(); else comment.image_id = "";
                    putComment(comment);
                    break;
                case 'user': 
                    createUser();
                    break;
                case 'album': 
                    createAlbum();
                    break;
                default:
                    break;
            }
        
        }
    });
    
    });

</script>

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


echo "";
?>
<div>
    <br> <label>Create Object:</label><br>

<button type="button" id="add">Add</button>
<select id="selCtrl">
    <option value="country">Country</option>
    <option value="city">City</option>
    <option value="user">User</option>
    <option value="album">Album</option>
    <option value="comment">Comment</option>
</select>
<button type="button" id="create">Create</button>
<div id="createForm">
    
    
</div>

</div>
<br>
<table id='data'><tbody></tbody></table>