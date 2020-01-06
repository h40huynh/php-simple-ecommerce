<?php
include "./include/helper/database.php";
// $test = new CategoryBusiness();
// $cat_id = 1;
// echo $test->CaculateNumberOfLinks($cat_id) . "<br>";
// echo $test->GetAmountOfProductInCategory($cat_id) . "<br>";
// $test->GetProductInGroup($cat_id, 3);
class CategoryBusiness
{
	static private $cat_list = null;
	private $MAX_PRODUCT = 6;
	public function GetAllCategories()
	{
		if (CategoryBusiness::$cat_list != null)
			return CategoryBusiness::$cat_list;

		$sql = "SELECT * FROM Categories";
		$db = new Database();
		CategoryBusiness::$cat_list = $db->select($sql);

		return CategoryBusiness::$cat_list;
	}

	public function GetAmountOfProductInCategory($cat_id)
	{
		$sql = "SELECT count(*) as NUM FROM Products WHERE cat_id={$cat_id}";
		$db = new Database();
		$result = $db->select($sql);
		$row = mysqli_fetch_array($result);
		return $row['NUM'];
	}

	public function CaculateNumberOfLinks($cat_id)
	{
		$result = NULL;
		$session_name = "numPages" . $cat_id;
		if (isset($_SESSION["{$session_name}"])) {
			$result = $_SESSION["{$session_name}"];
			return $result;
		}

		$num = $this->GetAmountOfProductInCategory($cat_id);
		$max = $this->MAX_PRODUCT;
		$result = (float) $num / $max;
		$result = ceil($result);
		$_SESSION["{$session_name}"] = $result;
		return $result;
	}

	public function GetProductInGroup($cat_id, $link_num)
	{
		$offset = ($link_num - 1) * $this->MAX_PRODUCT;
		$sql = "SELECT * FROM Products WHERE cat_id={$cat_id} LIMIT {$offset}, {$this->MAX_PRODUCT}";
		$db = new Database();
		$result = $db->select($sql);
		return $result;
	}
}
