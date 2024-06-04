<?php

$con = mysqli_connect("db","user","userpassword","doctors");

if(!$con){
    die('Connection Failed'. mysqli_connect_error());
}

?>