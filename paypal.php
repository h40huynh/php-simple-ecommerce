<?php

require './business/productB.php';
require './include/helper/database.php';
require "./business/cartB.php";
session_start();
$cp = new CartBusiness();
$cp->CreatePaymentPaypal();
