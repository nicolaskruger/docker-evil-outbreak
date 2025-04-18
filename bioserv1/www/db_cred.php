<?php
    $serv = "127.0.0.1";
    $port = 3306;
    $datb = "bioserver";
    $user = "bioserver";
    $pass = "xxxxxxxxxxxxxxxx";
    
    $conn = mysqli_connect($serv, $user, $pass, $datb, $port)
     or die ("connection error");
    return $conn;
