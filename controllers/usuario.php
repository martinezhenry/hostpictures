
<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


require_once '../core/Configurator.php';
require_once '../core/DBManagement.php';

Configurator::getInstance();

function getUsuario($id = NULL){
    if (is_null($id)){
        $sql = "select * from users";
    } else {
        $sql = "select * from users where storge_id = '$id'";
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


function putUsuario($user){
   
    $sql = "insert into users (name, email, pass, status, img_profile) values ('".$user['name']."', '".$user['email']."', '".$user['pass']."', '".$user['status']."', '".$user['img_profile']."')";
    
    DBManagement::getInstance()->insertar($sql);
    
    $result = DBManagement::getInstance()->getResultSet();
            
            
    if(DBManagement::getInstance()->getCountRows() == 1){
       return json_encode(TRUE);
    } else {
      // echo DBManagement::getInstance()->getUltError();
       return json_encode(FALSE);
    }

    
}



function deleteUsuario($id){
   
        $sql = "delete from users where idusers = '$id'";
   
    
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



function updateUsuario($id, $type){
    
    $sql = "update users set name = '". $user['name'] ."', email = '". $user['email'] ."', pass = '". $user['pass'] ."', status = '". $user['status'] ."', img_profile = '". $user['img_profile'] ."'  where storge_id = '$id'";
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