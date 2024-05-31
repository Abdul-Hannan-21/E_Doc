<?php

$con = mysqli_connect("localhost","user","userpassword","doctors");

if(!$con){
    die('Connection Failed'. mysqli_connect_error());
}

?>