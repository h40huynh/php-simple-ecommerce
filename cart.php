<?php
session_start();
$p = isset($_GET['product']) ? $_GET['product'] : 0;
$session_name = "c_product";

if ($_GET['action'] == 'add')
{
    if (!isset($_SESSION["$session_name"]) || !in_array($p, $_SESSION["$session_name"]))
    {
        $_SESSION["$session_name"][] = $p;
        $_SESSION["{$session_name}_{$p}"] = 1;		
    }
    else 
    {
        $_SESSION["{$session_name}_{$p}"] += 1;
        
    }
    $_SESSION["total"]+=1;
}
else if ($_GET['action'] == 'rm')
{
    if ($_SESSION["{$session_name}_{$p}"] == 0)
    {
        header("Location: {$_GET['redirect']}");
        return;
    }
    $_SESSION["{$session_name}_{$p}"] -= 1;
    $_SESSION["total"]-=1;
}
    header("Location: {$_GET['redirect']}") ;


?>