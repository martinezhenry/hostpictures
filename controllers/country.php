
<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


require_once '../core/Configurator.php';
require_once '../core/DBManagement.php';

Configurator::getInstance();

function getCountry($id = NULL){
    if (is_null($id)){
        $sql = "select * from countries";
    } else {
        $sql = "select * from countries where idcountries = '$id'";
    }
    
    DBManagement::getInstance()->consultar($sql);
    
    $result = DBManagement::getInstance()->getResultSet();
            
    if (is_array($result) && count($result) > 0){
       
       $result;
       
    } else {
        $result = FALSE;
    }
    
  //  var_dump($result);
    return json_encode($result);
    
}


function putCountry($country){
    
    $sql = "insert into countries (nombre, name, nom, iso2, iso3, phone_code) values ('".$country['nombre']."', '".$country['name']."', '".$country['nom']."', '".$country['iso2']."', '".$country['iso3']."', '".$country['phone_code']."')";
    
    //echo $sql;
    DBManagement::getInstance()->insertar($sql);
    
    $result = DBManagement::getInstance()->getResultSet();
            
    if(DBManagement::getInstance()->getCountRows() == 1){
       return json_encode(TRUE);
    } else {
        return json_encode(FALSE);
    }
    
    
}



function deleteCountry($id){
   
        $sql = "delete from countries where idcountries = '$id'";
   
    
    DBManagement::getInstance()->consultar($sql);
    
    $result = DBManagement::getInstance()->getResultSet();
            
    if (is_array($result) && count($result) > 0){
       
       $result;
       
    } else {
        $result = FALSE;
    }
    
   // var_dump($result);
    return json_encode($result);
    
}



function updateCountry($id, $country){
    
    $sql = "update countries set nombre = '". $country['nombre'] ."', name = '". $country['name'] ."', nom = '". $country['nom'] ."', iso2 = '". $country['iso2'] ."', iso3 = '". $country['iso3'] ."' where idcountries = '$id'";
    DBManagement::getInstance()->consultar($sql);
    
    $result = DBManagement::getInstance()->getResultSet();
            
    if (is_array($result) && count($result) > 0){
       
       $result;
       
    } else {
        $result = FALSE;
    }
    
   // var_dump($result);
    return json_encode($result);
    
}


require_once '../core/masterFunctions.php';

if (isset($_POST['method'])){
    if (isset($_POST['parameters'])) {
        executeLocalFunctions($_POST['method'], $_POST['parameters']);
    } else {
        executeLocalFunctions($_POST['method']);
    }
}