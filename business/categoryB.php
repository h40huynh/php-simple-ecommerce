<?php
include "./include/helper/database.php";

class CategoryBusiness
{
  public function GetAllCategories()
  {
    $sql = "SELECT * FROM Categories";
    $db = new Database();
    $result = $db->select($sql);

    return $result;
  }
}
