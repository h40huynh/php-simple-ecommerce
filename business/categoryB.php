<?php
include "./include/helper/database.php";

class CategoryBusiness
{
  static private $cat_list = null;
  public function GetAllCategories()
  {
    if (CategoryBusiness::$cat_list != null)
      return CategoryBusiness::$cat_list;

    $sql = "SELECT * FROM Categories";
    $db = new Database();
    CategoryBusiness::$cat_list = $db->select($sql);

    return CategoryBusiness::$cat_list;
  }
}
