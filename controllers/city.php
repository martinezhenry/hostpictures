
<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


require_once '../core/Configurator.php';
require_once '../core/DBManagement.php';

Configurator::getInstance();

function getCity($id = NULL){
    if (is_null($id)){
        $sql = "select * from cities";
    } else {
        $sql = "select * from cities where idcities = '$id'";
    }
    
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


function putCity($city){
   
    $sql = "insert into cities (nombre, name, nom, countries_idcountries) values ('".$city['nombre']."', '".$city['name']."', '".$city['nom']."', '".$city['idcountries']."')";

    DBManagement::getInstance()->insertar($sql);
    
    $result = DBManagement::getInstance()->getResultSet();
            
    if(DBManagement::getInstance()->getCountRows() == 1){
       return json_encode(TRUE);
    } else {
       //echo DBManagement::getInstance()->getUltError();
       return json_encode(FALSE);
    }
    
   // var_dump($result);
    //return json_encode($result);
    
}



function deleteCity($id){
   
        $sql = "delete from cities where idcities = '$id'";
   
    
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



function updateCity($id, $city){
    
    $sql = "update cities set nombre = '". $city['nombre'] ."', name = '". $city['name'] ."', nom = '". $city['nom'] ."', countries_idcountries = '". $city['idcountries'] ."' where idcountries = '$id'";
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