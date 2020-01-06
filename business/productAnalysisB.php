<?php
// For test
//include "../include/helper/database.php";
//include "../include/lib/simple_html_dom.php";
// --For test

//$from = "2019-08-01";
//$to = "2019-10-31";
//$product_name = "iphone x 64gb";
//$product_name = "samsung galaxy a30s";
//$test_price = 16000000;
//$test = new ProductAnalysisBusiness();
//$link = "https://www.dienmayxanh.com/dien-thoai/iphone-x-64gb";
//$link = "https://www.thegioididong.com/dtdd/iphone-x-64gb";
//$ret_array = $test->GetRevantLink($product_name);
//print_r($ret_array);
//$test->BuildUpDataset($product_name, $ret_array);
//$test->CheckRuleMatchLink("https://www.thegioididong.com/dtdd/iphone-x-64gb", "class", "price");
//$test->TrainRule($product_name);
//$test->GetUnfriendlyLinks($product_name);
//$raw = $test->FindPrice($link);
//$raw = "21.980.000 ₫";
//$test->GetPrice($raw);
//echo $test->CheckPrice($test_price);
//$test->SearchCompetitivePrice($product_name);
class ProductAnalysisBusiness
{
	//private $high_view = 2;
	private $base_price = 0;
	private $google_link = "https://google.com/search?q=";

	function GetContent($url)
	{
		$opts = array(
			'http' => array(
				'header' => "Accept-language: en\r\n" .
					"User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6\r\n"
			)
		);
		$context = stream_context_create($opts);
		$content = file_get_contents($url, 0, $context);
		$html = new simple_html_dom();
		$html->load($content);
		return $html;
	}

	// -----------------------------------------------

	public function GetRevantLink($product_name)
	{
		$search = $this->BuildSearchString($product_name);
		$url = $this->google_link . $search;
		echo $url;

		$html = $this->GetContent($url);
		// $content = file_get_html($url);
		// $html = new simple_html_dom();
		// $html->load($content);

		$return_array = array();
		foreach ($html->find('a') as $element) {
			$A = $product_name;
			$B = $element->plaintext;
			$pos = stripos($B, $A);
			if ($pos !== false) {
				$link = $this->StandarizeLink($element->href);
				if ($link != -1)
					$return_array["{$B}"] = $link;
			}
		}
		return $return_array;
		//$this->FindPrice("https://fptshop.com.vn/dien-thoai/iphone-x");
	}

	public function TestLink($link)
	{
		$html = $this->GetContent($link);
		if ($html == false)
			return -1;
		return 1;
	}

	public function GetType($type)
	{
		if (stripos($type, "class") !== false)
			return 1;
		else if (stripos($type, "id") !== false)
			return 2;
		else
			return 3;
	}

	public function CompareClassRule($element, $rule, $link)
	{
		$class = 'Class: ' . $element->class . '<br>';
		if (stripos($class, $rule) !== false) {
			// Do something with the element here
			//echo "Count at {$i}" . '<br>';
			//echo count($element->find("*")).'<br>';
			//echo $element->find("*")[0]->tag.'<br>';
			//echo $element->tag . '<br>';
			//echo $element->outertext.'<br>';   
			//echo $class;
			$pt1 = $element->plaintext . '<br>';
			echo "$pt1";
			$check_price = $this->GetPrice($pt1);
			$flag = $this->CheckPrice($check_price);
			if ($flag == 1) {
				echo "Check price: $check_price <br>";
				$this->UpdatePriceInDataset($link, $check_price);
				return $check_price;
			}
			//echo '<br>';
			return 1;
		}
	}

	public function CompareIDRule($element, $rule, $link)
	{
		$id = 'ID: ' . $element->id . '<br>';
		if (stripos($id, $rule) !== false) {
			// Do something with the element here
			//echo "Count at {$i}" . '<br>';
			//echo count($element->find("*")).'<br>';
			//echo $element->find("*")[0]->tag.'<br>';
			//echo $element->tag . '<br>';
			//echo $element->outertext.'<br>';   
			//echo $id;
			$pt1 = $element->plaintext . '<br>';
			echo "$pt1";
			$check_price = $this->GetPrice($pt1);
			$flag = $this->CheckPrice($check_price);
			if ($flag == 1) {
				echo "$check_price <br>";
				$this->UpdatePriceInDataset($link, $check_price);
				return $check_price;
			}
			//echo '<br>';
			return 1;
		}
	}

	public function CheckRuleMatchLink($link, $type, $rule)
	{
		$match_num = 0;
		$html = $this->GetContent($link);
		echo $link . "<br>";
		$all = $html->find("*");
		for ($i = 0, $max = count($all); $i < $max; $i++) {
			$temp = $this->GetType($type);
			if ($temp == 1) {
				$match_num += $this->CompareClassRule($all[$i], $rule, $link);
			} elseif ($temp == 2) {
				$match_num += $this->CompareIDRule($all[$i], $rule, $link);
			} else {
				$match_num += $this->CompareClassRule($all[$i], $rule, $link);
				$match_num += $this->CompareIDRule($all[$i], $rule, $link);
			}
		}
		return $match_num;
	}

	public function BuildUpDataset($product_name, $return_array)
	{
		foreach ($return_array as $text => $link) {
			set_error_handler(function () { });
			if ($this->CheckLinkInDataset($link) == 0 && $this->TestLink($link) == 1) {
				$sql = "INSERT INTO `dataset`(`product_name`, `link_name`) VALUES ('{$product_name}', '{$link}')";
				$db = new Database();
				$db->insert($sql);
			}
			restore_error_handler();
		}
	}

	public function CheckLinkInDataset($link)
	{
		$sql = "SELECT COUNT(*) as NUM FROM `dataset` WHERE `link_name` = '{$link}'";
		$db = new Database();
		$result = $db->select($sql);
		$row = mysqli_fetch_array($result);
		return $row["NUM"];
	}

	public function FindPrice($link)
	{
		$html = $this->GetContent($link);
		//$ret = $html->find('.area_price');
		//$test = '.area_price';
		$test = '.area_price';
		//$test = '#_price_new436';
		//$test = '.price';
		//$test = '.area_price';
		echo $test . "<br>";
		$raw = "";
		foreach ($html->find($test) as $element) {
			echo $element->plaintext . '<br>';
			$raw .= $element->plaintext;
		}
		return $raw;
	}

	public function StandarizeLink($raw_link)
	{
		$start = stripos($raw_link, "http");
		if ($start !== false) {
			$end = stripos($raw_link, "&");
			$link = substr($raw_link, $start, $end - $start);
			return $link;
		}
		return -1;
	}

	public function BuildSearchString($search)
	{
		$result = str_replace(" ", "+", $search);
		$result = str_replace("(", "", $result);
		$result = str_replace(")", "", $result);
		return $result;
	}

	public function CheckView($product_id, $from, $to)
	{
		$sql = "SELECT count(*) as NUM FROM `product_analysis` WHERE product_id = {$product_id} AND visited_date BETWEEN '{$from}' AND '{$to}'";
		$db = new Database();
		$result = $db->select($sql);

		$row = mysqli_fetch_array($result);
		return $row['NUM'];
	}

	public function UpdateViewOfProduct($product_id)
	{
		$now = date("Y-m-d H:i:s");
		$sql = "INSERT INTO `product_analysis`(`product_id`, `visited_date`) VALUES ({$product_id},'{$now}')";
		$db = new Database();
		$db->insert($sql);
	}

	//-----
	public function TrainRule($product_name)
	{
		$return_list = $this->GetAllLink($product_name);

		$sql = "SELECT * FROM rules";
		$db = new Database();
		$result = $db->select($sql);
		while ($row = mysqli_fetch_array($result)) {
			$rule_name = $row['name'];
			$type = $row['class_or_id'];
			$rule_id = $row['rule_id'];
			$count = 0;
			$is_price = -1;
			foreach ($return_list as $link_id => $link) {
				$is_price = 0;
				$num = $this->CheckRuleMatchLink($link, $type, $rule_name);
				if ($num > 0) {
					$count++;
					$is_price = 1;
				}
				if ($this->IsLearned($rule_id, $link_id) == 0) {
					$this->UpdateRelationshipTable($rule_id, $link_id, 1, $is_price);
				}
			}

			$ratio = (float) $count / count($return_list);
			$this->UpdateMatchingRatio($rule_id, $ratio);
			echo "$ratio <br>";
		}
	}

	public function GetAllLink($product_name)
	{
		$sql = "SELECT * FROM dataset WHERE product_name='{$product_name}'";
		$db = new Database();
		$result = $db->select($sql);
		$return_list = array();
		while ($row = mysqli_fetch_array($result)) {
			$link_id = $row['link_id'];
			$link_name = $row['link_name'];
			$return_list["{$link_id}"] = "{$link_name}";
		}
		return $return_list;
	}

	public function UpdateMatchingRatio($rule_id, $ratio)
	{
		$sql = "UPDATE `rules` SET `matching_ratio`={$ratio} WHERE `rule_id`={$rule_id}";
		$db = new Database();
		$db->update($sql);
	}

	public function UpdateRelationshipTable($rule_id, $link_id, $is_visited, $is_price)
	{
		$sql = "INSERT INTO `rules_and_dataset`(`rule_id`, `link_id`, `is_visited`, `is_identified_price`) VALUES ({$rule_id}, {$link_id}, {$is_visited}, {$is_price})";
		$db = new Database();
		$db->insert($sql);
	}

	public function GetUnfriendlyLinks($product_name)
	{
		$link_list = $this->GetAllLink($product_name);
		$rule_list = $this->GetAllRule();
		$return_list = array();
		foreach ($link_list as $link_id => $link_name) {
			$flag = 1;
			foreach ($rule_list as $rule_id => $rule_name) {
				$num = $this->CheckLinkMatchRule($link_id, $rule_id);
				if ($num == 1) {
					$flag = 0;
				}
			}
			if ($flag == 1)
				$return_list["{$link_id}"] = "{$link_name}";
		}

		foreach ($return_list as $link_id => $link_name) {
			echo "$link_id => $link_name <br>";
		}
		return $return_list;
	}

	public function GetAllRule()
	{
		$sql = "SELECT * FROM rules";
		$db = new Database();
		$result = $db->select($sql);
		$return_list = array();
		while ($row = mysqli_fetch_array($result)) {
			$rule_id = $row['rule_id'];
			$rule_name = $row['name'];
			$return_list["{$rule_id}"] = "{$rule_name}";
		}
		return $return_list;
	}

	public function CheckLinkMatchRule($link_id, $rule_id)
	{
		$sql = "SELECT `is_identified_price` FROM `rules_and_dataset` WHERE link_id={$link_id} AND rule_id={$rule_id}";
		$db = new Database();
		$result = $db->select($sql);
		$row = mysqli_fetch_array($result);
		return $row['is_identified_price'];
	}

	public function IsLearned($rule_id, $link_id)
	{
		$sql = "SELECT count(*) as NUM FROM `rules_and_dataset` WHERE link_id={$link_id} AND rule_id={$rule_id}";
		$db = new Database();
		$result = $db->select($sql);
		$row = mysqli_fetch_array($result);
		return $row['NUM'];
	}

	public function GetPrice($raw_string)
	{
		$string = htmlentities($raw_string, null, 'utf-8');
		$raw_string = str_replace("&nbsp;", "", $string);
		$raw_string = html_entity_decode($raw_string);

		$pt1 = implode("", explode(" ", $raw_string));
		$end = stripos($pt1, "₫");
		if ($end == false)
			$end = stripos($pt1, "đ");
		$start = $end - 1;
		$price = 0;
		$base = 1;
		while ($start >= 0) {
			$link = substr($pt1, $start, $end - $start);
			if (is_numeric($link) || $link == "." || $link == ",") {
				if (is_numeric($link)) {
					$price += $base * intval($link);
					$base *= 10;
				}
			} else {
				$start = -1;
			}
			$end = $start;
			$start = $end - 1;
		}
		echo "Get Price: {$price} <br><br>";
		return $price;
	}

	public function IsIdentified($match_num)
	{ }

	public function CheckPrice($check_price)
	{
		$base_price = $this->base_price;
		echo $base_price;
		$num = $base_price - $check_price;
		if ($num < 0)
			$num = -$num;
		$p = (float) $num / $base_price;
		if ($p > 0.2)
			return -1;
		return 1;
	}

	public function UpdatePriceInDataset($link, $price)
	{
		$sql = "UPDATE `dataset` SET `price`={$price} WHERE link_name='{$link}'";
		$db = new Database();
		$result = $db->update($sql);
	}

	public function GetMinPrice($product_name)
	{
		$sql = "SELECT min(price) as PRICE from dataset where price > 0 and product_name='{$product_name}'";
		$db = new Database();
		$result = $db->select($sql);
		$row = mysqli_fetch_array($result);
		return $row['PRICE'];
	}

	public function SearchCompetitivePrice($product_name, $base_price)
	{
		$this->base_price = $base_price;
		$price = 0;
		$price = $this->GetMinPrice($product_name);
		if ($price > 0)
			return $price;

		$return_list = $link_list = $this->GetRevantLink($product_name);
		$this->BuildUpDataset($product_name, $return_list);
		$return_list = $this->GetAllLink($product_name);
		$min_price = -1;
		foreach ($return_list as $x => $x_value) {
			$sql = "SELECT * FROM Rules order by matching_ratio DESC";
			$db = new Database();
			$result = $db->select($sql);
			$flag = 1;
			while ($flag == 1 && $row = mysqli_fetch_array($result)) {
				$rule_name = $row['name'];
				$type = $row['class_or_id'];
				$count = 0;
				$is_price = -1;
				$num = $this->CheckRuleMatchLink($x_value, $type, $rule_name);
				if ($num > 0) {
					if ($min_price == -1 || $min_price > $num) {
						$min_price = $num;
						$flag = -1;
					}
					$count++;
					$is_price = 1;
				} 
			}
			echo "MIN PRICE: $min_price";
		}
	}
}
