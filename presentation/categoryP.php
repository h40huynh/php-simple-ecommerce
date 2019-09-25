<?php

include "./business/categoryB.php";
class CategoryPresentation
{
  public function ShowAllCategories()
  {
    $cb = new CategoryBusiness();
    $result = $cb->GetAllCategories();

    while ($row = mysqli_fetch_array($result)) {
      $category = <<<DELIMITER
      <a href="./index.php?category={$row['cat_id']}" class="list-group-item list-group-item-action">{$row['cat_name']}</a>
      DELIMITER;

      echo $category;
    }
  }
}
