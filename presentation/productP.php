<?php
include "./business/productB.php";
class ProductionPresentation
{
  public function ShowProduct()
  {
    $pb = new ProductBusiness();
    $result = $pb->GetProductInCategory();
    while ($row = mysqli_fetch_array($result)) {
      $product = <<<DELIMITER
      <div class="col-sm-4">
        <div class="card mt-2">
          <img src="http://placehold.it/700x400" class="card-img-top" alt="...">
          <div class="card-body">
            <h4 class="card-title"><a href="#">{$row['name']}</a></h4>
            <h5>\${$row['price']}</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Add to cart</a>
          </div>
        </div>
      </div>
      DELIMITER;

      echo $product;
    }
  }
}
