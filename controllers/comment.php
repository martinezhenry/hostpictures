
<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


require_once 'core/Configurator.php';
require_once 'core/DBManagement.php';

Configurator::getInstance();

function getComment($id = NULL){
    if (is_null($id)){
        $sql = "select * from comments";
    } else {
        $sql = "select * from comments where idcomments = '$id'";
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


function putComment($comment){
   
    $sql = "insert into comments (comment, likes, chv_images_image_id) values ('".$comment['comment']."', '".$comment['likes']."')";
    
    DBManagement::getInstance()->insertar($sql);
    
    $result = DBManagement::getInstance()->getResultSet();
            
    if (is_array($result) && count($result) > 0){
       
       $result;
       
    } else {
        $result = FALSE;
    }
    
  //  var_dump($result);
    return json_encode($result);
    
}



function deleteComment($id){
   
        $sql = "delete from comments where idcomments = '$id'";
   
    
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



function updateComment($id, $comment){
    
    $sql = "update comments set nombre = '". $comment['comment'] ."', name = '". $comment['likes'] ."', nom = '". $comment['chv_images_image_id'] ."' where idcomments = '$id'";
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