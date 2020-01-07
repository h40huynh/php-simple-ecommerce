<?php
require './vendor/autoload.php';

use PayPal\Api\Amount;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\PaymentExecution;

class CartBusiness
{
	public function increaseProductToCart($product_id)
	{
		$session_name = "c_product";
		if (!isset($_SESSION["$session_name"]) || !in_array($product_id, $_SESSION["$session_name"])) {
			$_SESSION["$session_name"][] = $product_id;
			$_SESSION["{$session_name}_{$product_id}"] = 1;
		} else {
			$_SESSION["{$session_name}_{$product_id}"] += 1;
		}
		$_SESSION["total"] += 1;
	}

	public function decreaseProductToCart($product_id)
	{
		$session_name = "c_product";
		if ($_SESSION["{$session_name}_{$product_id}"] == 0) {
			header("Location: {$_GET['redirect']}");
			return;
		}
		if ($_SESSION["{$session_name}_{$product_id}"] == 1) {
			$this->deleteProductFromCart($product_id);
		} else {
			$_SESSION["{$session_name}_{$product_id}"] -= 1;
			$_SESSION["total"] -= 1;
		}
	}

	public function deleteProductFromCart($product_id)
	{
		$session_name = "c_product";
		$index = array_search($product_id, $_SESSION["$session_name"], true);
		unset($_SESSION["$session_name"][$index]);
		$_SESSION['total'] -= $_SESSION["{$session_name}_{$product_id}"];
		unset($_SESSION["{$session_name}_{$product_id}"]);
	}

	public function handleCartFromUrl()
	{
		$product_id = isset($_GET['product']) ? $_GET['product'] : 0;
		if ($_GET['action'] == 'add') {
			$this->increaseProductToCart($product_id);
		} else if ($_GET['action'] == 'rm') {
			$this->decreaseProductToCart($product_id);
		} else if ($_GET['action'] == 'del') {
			$this->deleteProductFromCart($product_id);
		}
		header("Location: {$_GET['redirect']}");
	}

	public function CreatePaymentPaypal()
	{
		//Cái này SDK người ta thiết kế, dùng theo thôi chứ có hiểu gì đâu
		$clientId = "AWLT6HZIBFmKiCHuZBicz3basprnKUEymgMnncIfRrHV39iB_SOM7-1CJMsq4Q5KYEUWF7OuBWHu-uYG";
		$secretId = "EJ9VYgTBf72JyhjDxahLDXMMQITSlWDjxgkNCgUY26h1jflhkn4wQFDYxGEVQoyarDwKYeeE8llluiQ0";
		$returnUrl = "http://localhost/web1/approva.php?success=true";
		$cancelurl = "http://localhost/web1/approva.php?success=false";

		$auth = new OAuthTokenCredential($clientId, $secretId);
		$apiContext = new ApiContext($auth);

		$payer = new Payer();
		$payer->setPaymentMethod('paypal');

		$session_name = "c_product";
		$item = array();
		$total = 0;
		foreach ($_SESSION["$session_name"] as $product_id) {
			$pb = new ProductBusiness();
			$pr = $pb->GetProductByID($product_id);
			$row = mysqli_fetch_array($pr);
			$price = ceil($row["price"] / 20000);
			$quatity = $_SESSION["{$session_name}_{$product_id}"];
			$tmp = new Item();
			$tmp->setName($row['name'])
				->setCurrency('USD')
				->setQuantity($quatity)
				->setPrice($price);
			$item[] = $tmp;
			$total += $price * $quatity;
		}
		$_SESSION["paypal_total"] = $total;

		$itemList = new ItemList();
		$itemList->setItems($item);

		$amount = new Amount();
		$amount->setCurrency("USD")
			->setTotal($total);

		$transaction = new Transaction();
		$transaction->setAmount($amount)
			->setItemList($itemList)
			->setDescription("Payment for your cart")
			->setInvoiceNumber(uniqid());

		$payment = new Payment();
		$redirectUrls = new RedirectUrls();
		$redirectUrls->setReturnUrl($returnUrl)
			->setCancelUrl($cancelurl);
		$payment->setIntent('sale')
			->setPayer($payer)
			->setTransactions(array($transaction))
			->setRedirectUrls($redirectUrls);

		$request = clone $payment;
		try {
			$payment->create($apiContext);
			header("Location: {$payment->getApprovalLink()}");
			//echo "\n\nRedirect user to approval_url: " . $payment->getApprovalLink() . "\n";
		} catch (\PayPal\Exception\PayPalConnectionException $ex) {
			// This will print the detailed information on the exception.
			//REALLY HELPFUL FOR DEBUGGING
			echo $ex->getData();
		}

		return $payment;
	}

	public function ExcutePayment()
	{
		$clientId = "AWLT6HZIBFmKiCHuZBicz3basprnKUEymgMnncIfRrHV39iB_SOM7-1CJMsq4Q5KYEUWF7OuBWHu-uYG";
		$secretId = "EJ9VYgTBf72JyhjDxahLDXMMQITSlWDjxgkNCgUY26h1jflhkn4wQFDYxGEVQoyarDwKYeeE8llluiQ0";

		$auth = new OAuthTokenCredential($clientId, $secretId);
		$apiContext = new ApiContext($auth);

		if (isset($_GET['success']) && $_GET['success'] == 'true') {
			$paymentId = $_GET['paymentId'];
			$payment = Payment::get($paymentId, $apiContext);
			$execution = new PaymentExecution();
			$execution->setPayerId($_GET['PayerID']);

			$transaction = new Transaction();
			$amount = new Amount();

			$amount->setCurrency('USD');
			$amount->setTotal($_SESSION["paypal_total"]);
			$transaction->setAmount($amount);
			$execution->addTransaction($transaction);

			try {
				$result = $payment->execute($execution, $apiContext);
				echo "Excuted payment. Thank you...";
			} catch (Exception $ex) {
				echo $ex;
			}
		}
	}
}
