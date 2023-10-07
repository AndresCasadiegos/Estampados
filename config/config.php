<?php

define("CLIENT_ID", "AQ1Syu-zbQAlMC1WxMrB-aXPCfMn3SDkt6pdjaqG0A4sEswVSsiwxwMXyvfIesS1Bm8aSUuWOo3DGuY-");
define("CURRENCY", "USD");
define("KEY_TOKEN", "AfCg.9-8");
define("MONEDA", "$");

session_start();

$num_cart = 0;

if(isset($_SESSION['carrito']['productos'])){
    $num_cart = count($_SESSION['carrito']['productos']);
}







