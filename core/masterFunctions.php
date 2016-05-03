<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function executeLocalFunctions($method, $parameters = NULL) {

        if (isset($parameters) && !is_null($parameters)) {
            $parameters = $_POST['parameters'];
            foreach ($parameters as $key => $value) {
                $p[] = $value;
            }

            echo call_user_func_array($method, $p);
        } else {
            echo ($method());
        }

}
