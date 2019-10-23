<?php

class ProductBusiness
{
  public function GetProductByID($product_id)
  {
    $sql = "SELECT * FROM Products WHERE id = {$product_id}";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function GetProductInCategory()
  {
    $cat_id = $this->GetCurrentCategory();
    $sql = "SELECT * FROM Products WHERE cat_id = {$cat_id}";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function GetCurrentCategory()
  {
    return isset($_GET['category']) ? $_GET['category'] : 0;
  }
}
