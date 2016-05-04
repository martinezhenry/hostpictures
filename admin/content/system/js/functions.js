


function putCountries(country) {
    
    
    console.log('putCountry');
    $.ajax({
        url: 'controllers/country.php',
        data: {'parameters' :{ 'country' : country }, 'method': 'putCountry' },
        method: 'post',
        dataType: 'json',
        success: function(r){
           console.error(r);
            if (r != false){
                
       
                alert('creado');
       
            } else {
                
                alert('no creado');
            }
            
            
        }
    }).fail(function(r){
        console.error(r);
           // $('#msg .modal-body').html('Error consultando la(s) compañia(s)');
           // $('#msg').addClass('success');
           // $('#msg').modal('toggle');
    });
}





/************   cities     ***********************/


function putCity(city) {
    
    
    console.log('putCity');
    $.ajax({
        url: 'controllers/city.php',
        data: {'parameters' :{ 'city' : city }, 'method': 'putCity' },
        method: 'post',
        dataType: 'json',
        success: function(r){
           console.error(r);
            if (r != false){
                
       
                alert('creado');
       
            } else {
                
                alert('no creado');
            }
            
            
        }
    }).fail(function(r){
        console.error(r);
           // $('#msg .modal-body').html('Error consultando la(s) compañia(s)');
           // $('#msg').addClass('success');
           // $('#msg').modal('toggle');
    });
}



/************   comment     ***********************/


function putComment(comment) {
    
    
    console.log('putCity');
    $.ajax({
        url: 'controllers/comment.php',
        data: {'parameters' :{ 'comment' : comment }, 'method': 'putComment' },
        method: 'post',
        dataType: 'json',
        success: function(r){
           console.error(r);
            if (r != false){
                
       
                alert('creado');
       
            } else {
                
                alert('no creado');
            }
            
            
        }
    }).fail(function(r){
        console.error(r);
           // $('#msg .modal-body').html('Error consultando la(s) compañia(s)');
           // $('#msg').addClass('success');
           // $('#msg').modal('toggle');
    });
}



/************   user     ***********************/


function putUser(user) {
    
    
    console.log('putUser');
    $.ajax({
        url: 'controllers/usuario.php',
        data: {'parameters' :{ 'user' : user }, 'method': 'putUsuario' },
        method: 'post',
        dataType: 'json',
        success: function(r){
           console.error(r);
            if (r != false){
                
       
                alert('creado');
       
            } else {
                
                alert('no creado');
            }
            
            
        }
    }).fail(function(r){
        console.error(r);
           // $('#msg .modal-body').html('Error consultando la(s) compañia(s)');
           // $('#msg').addClass('success');
           // $('#msg').modal('toggle');
    });
}


/************   album     ***********************/


function putAlbum(album) {
    
    
    console.log('putUser');
    $.ajax({
        url: 'controllers/album.php',
        data: {'parameters' :{ 'album' : album }, 'method': 'putAlbum' },
        method: 'post',
        dataType: 'json',
        success: function(r){
           console.error(r);
            if (r != false){
                
       
                alert('creado');
       
            } else {
                
                alert('no creado');
            }
            
            
        }
    }).fail(function(r){
        console.error(r);
           // $('#msg .modal-body').html('Error consultando la(s) compañia(s)');
           // $('#msg').addClass('success');
           // $('#msg').modal('toggle');
    });
}