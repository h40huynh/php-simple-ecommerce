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

	// -----

	public function ShowPagingLink()
	{
		$cb = new CategoryBusiness();
		$currentCategory = isset($_GET['category']) ? $_GET['category'] : 0;
		$page = isset($_GET['page']) ? $_GET['page'] : 1;
		$result = $cb->CaculateNumberOfLinks($currentCategory);
		for ($i = 1; $i <= $result; $i++) {
			$active = $page == $i ? "active" : "";
			$paging = <<<DELIMITER
			<li class="page-item {$active}"><a class="page-link" href="index.php?category={$currentCategory}&page={$i}">{$i}</a></li>
			DELIMITER;
			echo $paging;
		}
	}
}
