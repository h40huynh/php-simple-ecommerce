<?php

class ProductBusiness
{
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
    return isset($_GET['category']) ? $_GET['category'] : 1;
  }
}
