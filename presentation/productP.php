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
    $this->ShowSingleProduct($name, $price);

    $pab = new ProductAnalysisBusiness();
    $pab->UpdateViewOfProduct($product_id);
  }

  public function GetProductId()
  {
    return isset($_GET['product_id']) ? $_GET['product_id'] : 0;
  }

  public function ShowSingleProduct($name, $price)
  {
    $product = <<<DELIMITER
    <div class="col-sm-12">
      <div class="card mt-2">
        <img src="http://placehold.it/700x400" class="card-img-top" alt="...">
        <div class="card-body">
          <h4 class="card-title">{$name}</h4>
          <h5>\${$price}</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Add to cart</a>
        </div>
      </div>
    </div>
    DELIMITER;
    echo $product;
  }

  public function ShowProduct($name, $price, $id)
  {
    $product = <<<DELIMITER
    <div class="col-sm-4">
      <div class="card mt-2">
        <img src="http://placehold.it/700x400" class="card-img-top">
        <div class="card-body">
          <h4 class="card-title"><a href="./item.php?product_id={$id}">{$name}</a></h4>
          <h5>\${$price}</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Add to cart</a>
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
      $this->ShowProductInCategory();
    }
  }

  public function ShowFeaturedProduct()
  {
    $ib = new InventoryBusiness();
    $featuredList = $ib->GetPoorPerformanceList("2019-08-01", "2019-10-05");
    foreach ($featuredList as $product_id => $performance) {
      $pb = new ProductBusiness();
      $result = $pb->GetProductByID($product_id);
      $row = mysqli_fetch_array($result);
      $this->ShowProduct($row['name'], $row['price'], $row['id']);
    }
  }

  public function ShowProductInCategory()
  {
    $pb = new ProductBusiness();
    $result = $pb->GetProductInCategory();
    while ($row = mysqli_fetch_array($result)) {
      $this->ShowProduct($row['name'], $row['price'], $row['id']);
    }
  }
}
