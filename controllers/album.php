<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


require_once '../core/Configurator.php';
require_once '../core/DBManagement.php';

Configurator::getInstance();

function getAlbum($id = NULL){
    if (is_null($id)){
        $sql = "select * from chv_storages";
    } else {
        $sql = "select * from chv_storages where storge_id = '$id'";
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


function putAlbum($album){
   
    $sql = "insert into chv_storages (storage_type, users_idusers) values ('".$album['type']."', '".$album['idusers']."')";
    
    DBManagement::getInstance()->insertar($sql);
    
            
    if(DBManagement::getInstance()->getCountRows() == 1){
       return json_encode(TRUE);
    } else {
      // echo DBManagement::getInstance()->getUltError();
       return json_encode(FALSE);
    }
    

    
}



function deleteAlbum($id){
   
        $sql = "delete from chv_storages where storage_id = '$id'";
   
    
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



function updateAlbum($id, $type){
    
    $sql = "update chv_storages set storage_type = '". $type ."' where storge_id = '$id'";
    
    
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