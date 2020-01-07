<?php
session_start();

use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\Transaction;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;

include "./layout/header.php";
include "./layout/navbar.php";
include "./business/cartB.php";
?>

<div class="container mt-5">
	<?php
	$cp = new CartBusiness();
	$cp->ExcutePayment();
	?>
</div>