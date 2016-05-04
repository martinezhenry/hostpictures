/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function getCountries(id) {
    console.log('getCountry');
    $.ajax({
        url: 'controllers/country.php',
        data: {'parameters' : {'parameters':id}, 'method': 'getCountry' },
        method: 'post',
        dataType: 'json',
        success: function(r){
            
       console.error(r);
            if (r != false){
                
                var html = "";
                
                $.each(r, function( key, value ) {
                    html += "<tr id='"+value.id+"'>";
                    html += "<td>" + (key+1) + "</td>";
                    html += "<td>" + value.nombre + "</td>";
                    html += "<td>" + value.name + "</td>";
                    html += "<td>" + value.nom + "</td>";
                    html += "<td>" + value.iso2 + "</td>";
                    html += "<td>" + value.iso3 + "</td>";
                    html += "</tr>";
                    
                  });
                $('#data tbody').html(html);
            }
        }
    }).fail(function(r){
        console.error(r);
           // $('#msg .modal-body').html('Error consultando la(s) compañia(s)');
           // $('#msg').addClass('success');
           // $('#msg').modal('toggle');
    });
}