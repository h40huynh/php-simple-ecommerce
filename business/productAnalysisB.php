<?php
class ProductAnalysisBusiness
{
  public function UpdateViewOfProduct($product_id)
  {
    $now = date("Y-m-d H:i:s");
    $sql = "INSERT INTO `product_analysis`(`product_id`, `visited_date`) VALUES ({$product_id},'{$now}')";
    $db = new Database();
    $db->insert($sql);
  }
}
