/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function getCountries(id) {
    console.log('getCompanies');
    $.ajax({
        url: 'controllers/country.php',
        data: {'parameters' : {'parameters':id}, 'method': 'getCompanies' },
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