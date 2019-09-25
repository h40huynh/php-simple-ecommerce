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
          <img src="..." class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">{$row['name']}</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
      </div>
      DELIMITER;

      echo $product;
    }
  }
}
