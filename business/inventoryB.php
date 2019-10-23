<?php

class InventoryBusiness
{
  public function GetPoorPerformanceList($from, $to)
  {
    $product_list = $this->GetRelavantProductID($from, $to);
    $plist = array();
    while ($row = mysqli_fetch_array($product_list)) {
      $product_id = $row['product_id'];
      $perfromance = $this->GetLatestPerformance($product_id);
      $plist["{$product_id}"] = $perfromance;
    }
    asort($plist);
    return $plist;
  }

  public function GetLatestPerformance($product_id)
  {
    $sql = "SELECT performance FROM inventory_performance WHERE ip_id in (SELECT MAX(ip_id) FROM inventory_performance WHERE product_id = {$product_id} GROUP BY product_id)";
    $db = new Database();
    $result = $db->select($sql);
    $row = mysqli_fetch_array($result);
    return $row['performance'];
  }

  public function GetRelavantProductID($from, $to)
  {
    $sql = "SELECT DISTINCT product_id FROM inventory_performance WHERE date(from_date) > '{$from}' AND date(to_date) < '{$to}'";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function UpdatePerformanceTable($product_id, $from, $to)
  {
    $perfromance = $this->CaculateInventoryPerformance($product_id, $from, $to);
    $sql = "INSERT INTO `inventory_performance`(`product_id`, `from_date`, `to_date`, `performance`) VALUES ({$product_id},'{$from}','{$to}','{$perfromance}')";
    $db = new Database();
    $db->insert($sql);
  }

  public function CaculateInventoryPerformance($product_id, $from, $to)
  {
    $list = $this->GetRelavantInventoryID($product_id, $to);

    $sum_M_S = 0;
    $sum_M_I = 0;
    while ($row = mysqli_fetch_array($list)) {
      $inventory_id = $row['inventory_id'];
      $import_date = $row['import_date'];

      $sum_M_S += $this->MarkOfSoldItem($inventory_id, $from, $to, $import_date);
      $sum_M_I += $this->MarkOfInStockItems($inventory_id, $import_date);
    }

    return $sum_M_S / ($sum_M_I + $sum_M_S);
  }

  public function MarkOfInStockItems($inventory_id, $import_date)
  {
    $record = $this->GetLatestInventoryStatus($inventory_id);
    $row = mysqli_fetch_array($record);
    $in_stock_amount = $row['in_stock'];
    $M = strtotime($import_date);
    $M_I = $M * $in_stock_amount;
    return $M_I;
  }

  public function GetLatestInventoryStatus($inventory_id)
  {
    $sql = "SELECT * FROM inventory_management WHERE inventory_id = {$inventory_id} ORDER BY im_id DESC LIMIT 1";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function MarkOfSoldItem($inventory_id, $from, $to, $import_date)
  {
    $list = $this->GetCorrectSoldItems($inventory_id, $from, $to);
    $total = 0;
    $M = strtotime($import_date);
    while ($row = mysqli_fetch_array($list)) {
      $export_date = $row['export_date'];
      $E = strtotime($export_date);
      $N = strtotime($to);
      $M_S = $N - ($E - $M);
      $total += $M_S;
    }
    return $total;
  }

  public function GetCorrectSoldItems($inventory_id, $from, $to)
  {
    $sql = "SELECT * FROM inventory_out WHERE inventory_id = {$inventory_id} AND export_date BETWEEN '{$from}' AND '{$to}'";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function GetRelavantInventoryID($product_id, $to)
  {
    $sql = "SELECT * FROM inventory_in WHERE product_id = {$product_id} AND import_date < '{$to}'";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }
}

$t = new InventoryBusiness();
//$t->UpdatePerformanceTable(1, "2019-09-01", "2019-09-05");
$t->GetPoorPerformanceList("2019-08-01", "2019-10-05");
