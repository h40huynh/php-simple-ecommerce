<?php
include "./business/productB.php";
include "./business/inventoryB.php";
include "./business/productAnalysisB.php";
class ProductionPresentation
{
	public function ShowItem()
	{
		$product_id = $this->GetProductId();

		$pb = new ProductBusiness();
		$result = $pb->GetProductByID($product_id);
		$row = mysqli_fetch_array($result);
		$name = $row['name'];
		$price = $row['price'];
		$this->ShowSingleProduct($product_id, $name, $price, $row['url'], $row['old_price']);

		$pab = new ProductAnalysisBusiness();
		$pab->UpdateViewOfProduct($product_id);
	}

	public function GetProductId()
	{
		return isset($_GET['product_id']) ? $_GET['product_id'] : 0;
	}

	public function ShowSingleProduct($id, $name, $price, $url, $old_price)
	{
		$str = "<br/>";
		if($old_price != NULL){
			$str="$old_price ₫";
		}
		$price = number_format($price);
		$product = <<<DELIMITER
	<div class="row mt-5">
		<div class="col-6">
			<div class="card mt-2">
				<img src="./include/images/{$url}" class="card-img-top" alt="...">
			</div>
		</div>
		<div class="col-6">
			<h5 class="card-title">{$name}</h5>
			<h5 style= "color:red">{$price}₫</h5>
		  	<h6 style="text-decoration: line-through;text-decoration-line: line-through;color:gray">{$str}</h6>
			<a href="./cart.php?product={$id}&redirect={$_SERVER['REQUEST_URI']}" class="btn btn-primary">Add to cart</a>
		</div>
	</div>
	DELIMITER;
		echo $product;
	}

	public function ShowProduct($name, $price, $id, $url, $old_price)
	{
		$str = "<br/>";
		if($old_price != NULL){
			$str="$old_price ₫";
		}
		$price = number_format($price);
		$product = <<<DELIMITER
	<div class="col-sm-4">
	  <div class="card mt-2">
		<img src="./include/images/{$url}" height=280 class="card-img-top">
		<div class="card-body">
		  <h6 class="card-title"><a href="./item.php?product_id={$id}">{$name}</a></h6>
		  <h5 style= "color:red">{$price}₫</h5>
		  <h6 style="text-decoration: line-through;text-decoration-line: line-through;color:gray">{$str}</h6>
		  <a href="./cart.php?product={$id}&redirect={$_SERVER['REQUEST_URI']}&action=add" class="btn btn-primary">Add to cart</a>
		</div>
	  </div>
	</div>
	DELIMITER;
		echo $product;
	}

	public function ShowProductsByUser()
	{
		$pb = new ProductBusiness();
		$cat_id = $pb->GetCurrentCategory();
		if ($cat_id == 0) {
			$this->ShowFeaturedProduct();
		} else {
			//$this->ShowProductInCategory();
			$this->ShowProductByPage();
		}
	}

	public function ShowFeaturedProduct()
	{
		$i = 0;
		$ib = new InventoryBusiness();
		$featuredList = $ib->GetPoorPerformanceList("2019-01-01", "2020-01-01");
		foreach ($featuredList as $product_id => $performance) {
			$pb = new ProductBusiness();
			$result = $pb->GetProductByID($product_id);
			$row = mysqli_fetch_array($result);
			$this->ShowProduct($row['name'], $row['price'], $row['id'],$row['url'],$row['old_price']);
		}
	}

	public function ShowProductInCategory()
	{
		$pb = new ProductBusiness();
		$result = $pb->GetProductInCategory();
		while ($row = mysqli_fetch_array($result)) {
			$this->ShowProduct($row['name'], $row['price'], $row['id'],$row['url'],$row['old_price']);
		}
	}

	// --
	public function ShowProductByPage()
	{
		$result = NULL;

		$page = isset($_GET['page']) ? $_GET['page'] : 1;
		$cat = isset($_GET['category']) ? $_GET['category'] : 0;
		$session_name = "products{$page}_{$cat}";

		if (!isset($_SESSION["{$session_name}"])) {
			$cb = new CategoryBusiness();
			$result = $cb->GetProductInGroup($cat, $page);
			while ($row = mysqli_fetch_array($result)) {
				$_SESSION["{$session_name}"][] = $row;
			}
		}

		$result = $_SESSION["{$session_name}"];
		foreach ($result as $row) {
			$this->ShowProduct($row['name'], $row['price'], $row['id'],$row['url'],$row['old_price']);
		}
	}

	public function showProductInCart($product_id)
	{
		$pb = new ProductBusiness();
		$pr = $pb->GetProductByID($product_id);
		$session_name = "c_product";
		$row = mysqli_fetch_array($pr);
		$price = number_format($row['price']);
		$product = <<<DELIMITER
			<div class="row">
				<div class="col-3">
					<div class="mt-2">
						<img src="./include/images/{$row['url']}"  alt="..." height=150 width=150>
					</div>
				</div>
				<div class="col-6 mt-5" style="text-align:right">
					<h6 class="card-title">{$row['name']}</h6>
					<h5 style= "color:red">{$price}₫</h5>
					<h6> Quantity: {$_SESSION["{$session_name}_{$product_id}"]} </h6> 
					<a href="./cart.php?product={$product_id}&redirect={$_SERVER['REQUEST_URI']}&action=add" class="btn btn-primary">+</a>
					<a href="./cart.php?product={$product_id}&redirect={$_SERVER['REQUEST_URI']}&action=rm" class="btn btn-primary">-</a>
				</div>
			</div>
			<hr>
	DELIMITER;
		echo $product;
		
		return $row['price']*$_SESSION["{$session_name}_{$product_id}"];
	}

	public function showCart()
	{
		// $p = isset($_GET['product']) ? $_GET['product'] : 0;
		 $session_name = "c_product";

		// if (!isset($_SESSION["$session_name"]) || !in_array($p, $_SESSION["$session_name"]))
		// {
		// 	$_SESSION["$session_name"][] = $p;		
		// }
		$total = 0;
		foreach ($_SESSION["$session_name"] as $id)
		{
			$total += $this->showProductInCart($id);
		}
		$total = number_format($total);
		$totalprice = <<<DELIMITER
			<div class="row">
				<div class="col-3">
					<h4> TOTAL PRICE: </h4>
				</div>
				<div class="col-6" style="text-align:right">
					<h3 style= "color:red">{$total}₫</h3>
				</div>
			</div>
			<hr>
		DELIMITER;
		echo $totalprice;
	}
}
