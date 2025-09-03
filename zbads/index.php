<?php
/*
if (version_compare(phpversion(), '5.6.40', '>'))
	{
	echo 'Current PHP version: '.phpversion().'<br>';
	echo 'Does not work!<br>';
	die();
	}
*/
error_reporting(1); // -1 full error view
session_start();
ob_start();
header("Content-type: text/html; charset=utf-8");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT"); // date in the past
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // always modified
header("Cache-Control: no-store, no-cache, must-revalidate"); // HTTP/1.1 
header("Cache-Control: post-check=0, pre-check=0", false); 
header("Pragma: no-cache"); // HTTP/1.0 

// include libs
include "admin/inc/config.inc.php";

include ($config["configShare"]["shareLibPath"]."db".$config["configShare"]["databaseType"].".lib.php");
include ($config["configShare"]["shareLibPath"]."function.lib.php");
include ($config["configShare"]["shareLibPath"]."sql.lib.php");
include ($config["configShare"]["shareLibPath"]."screen.lib.php");
include ($config["configShare"]["shareLibPath"]."phpmkrfn.lib.php");

// use database
$config["configShare"]["conn"] = 
	db_connect($config["configShare"]["databaseServer"], 
	$config["configShare"]["databaseUser"], 
	$config["configShare"]["databasePassword"], 
	$config["configShare"]["databaseSelect"]);

//db_Connect("set names utf8");
mysqli_query("set names utf8");

// set whichSystem and whichSystemMode
$_SESSION[$config["configShare"]["whichSystem"]."whichSystemMode"] = "admin";

$config["configShare"]["whichSystemAndMode"]=$config["configShare"]["whichSystem"].$config["configShare"]["whichSystemMode"]."_";
$config["configShare"]["startPath"]="admin";
$config["configShare"]["startNextIndexPath"]="admin";
$config["startPath"]=$config["configShare"]["startPath"];
// set site from database
$config["configShare"]["siteID"] = $_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_siteID"];
$config["configShare"]["whichSystemMode"]="admin";
// set config from database
$configSQL = "SELECT modul, name, cfgCFG, cfgPATH, tplCFG, tplPATH FROM configs WHERE active=1 AND modul !='configShare'";
$configRS = db_query($configSQL, $config["configShare"]["conn"]);
if ($configRS)
	{
	$configRowCount = 0;
	while ($configData = db_fetch_array($configRS))
		{
		if (ISSET($configData["cfgPATH"]) && !empty($configData["cfgPATH"]))
			{
//			$config[$configData["modul"]]["iniCFG"] = cfgUp($configData["modul"],$config,$configData["cfgPATH"]);
			$config[$configData["modul"]]["iniCFG"] = cfgUp($configData["modul"],$config,$config["configShare"]["cfgPath"]);
			}
		if (ISSET($configData["tplPATH"]) && !empty($configData["tplPATH"]))
			{
//			$config[$configData["modul"]]["iniCFG"] .= tplUp($configData["modul"],$config,$configData["tplPATH"]);
			$config[$configData["modul"]]["iniCFG"] .= tplUp($configData["modul"],$config,$config["configShare"]["tplPath"]);

			}
		$modulCFG = iniCFGParser($config[$configData["modul"]]["iniCFG"],"##modulCFG##","##/modulCFG##");
		$modulFieldsCFG = explode('<#>',$modulCFG);
		for ($modulFieldCFGCount=0;$modulFieldCFGCount<count($modulFieldsCFG);$modulFieldCFGCount++)
			{
			$modulFieldCFG = explode('<=>',$modulFieldsCFG[$modulFieldCFGCount]);
			$config[$configData["modul"]][trim($modulFieldCFG[0])]=trim($modulFieldCFG[1]);
			}
		$configRowCount++;
		}
	}

// set configlng from database
if (isset($_GET["lang"]) && !empty($_GET["lang"]))
	{
	$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_UserLangID"] = $_GET["lang"];
	}
if (isset($_POST["x_langFilterID"]) && !empty($_POST["x_langFilterID"]))
	{
	$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_UserLangID"] = $_POST["x_langFilterID"];
	}
else if (@$_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_UserLangID"] == "")
	{
	$_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_UserLangID"] = 1;
	}
if ($_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_UserLangID"]==-1) $_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_UserLangID"] = 1;
$config["configShare"]["langID"]=$_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_UserLangID"];
$config["configShare"]["languageActual"] = $_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_UserLangID"];
//$config["configShare"]["languageActual"] = @$_GET["language"];

// set site from database
if (isset($_POST["x_siteFilterID"]) && !empty($_POST["x_siteFilterID"]))
	{
//	$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_siteID"] = $_POST["x_siteFilterID"];
	if ($_POST["x_siteID"] != -1)
		{
		$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_siteFilterID"] = $_POST["x_siteFilterID"];
		}
	else
		{
		unset($_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_siteFilterID"]);
		}
	$config["configShare"]["startReset"]=1;		
	}
if (isset($_POST["x_modulFilterID"]) && !empty($_POST["x_modulFilterID"]))
	{
	if ($_POST["x_modulFilterID"] != -1)
		{
		$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_modulFilterID"] = $_POST["x_modulFilterID"];
		}
	else
		{
		unset($_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_modulFilterID"]);
		}
	}
/*
else if (@$_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_siteID"] == "")
	{
	$siteStartSQL = "SELECT id, name, wwwAddress FROM site WHERE active=1 AND wwwAddress LIKE '%".$config["configShare"]["serverName"]."%'";
	$siteStartRS = db_query($siteStartSQL, $config["configShare"]["conn"]);
	if ($siteStartRS)
		{
		$siteStartData = db_fetch_array($siteStartRS);
		$_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_siteID"] = $siteStartData["id"];
		}
	else
		{
		$_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_siteID"] = 1;
		}
	db_free_result($siteStartRS);
	}
*/
$config["configShare"]["modulID"] = $_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_modulID"];
$config["configShare"]["modulFilterID"] = $_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_modulFilterID"];
$config["configShare"]["siteFilterID"] = $_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_siteFilterID"];
$siteSQL = "SELECT id, name FROM site WHERE active=1 AND id=".$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_siteFilterID"];
$siteRS = db_query($siteSQL, $config["configShare"]["conn"]);
if ($siteRS)
	{
	$siteData = db_fetch_array($siteRS);
	$config["configShare"]["siteName"]=$siteData["name"];
	}
db_free_result($siteRS);

// set modulSelect
if (isset($_SESSION[$config["configShare"]["whichSystemMode"].'SESSIONID'])) $sessionLive=$_SESSION[$config["configShare"]["whichSystemMode"].'SESSIONID'];
$modulSelect = $_SESSION[$config["configShare"]["whichSystemMode"]."modulSelect"];
if (isset($_POST["modulSelect"])) 
	{
	$modulSelect=$_POST["modulSelect"]; 
	$_SESSION[$config["configShare"]["whichSystemMode"]."modulSelect"] = $modulSelect;
	}
else if (isset($_GET["modulSelect"])) 
	{
	$modulSelect=$_GET["modulSelect"]; 
	$_SESSION[$config["configShare"]["whichSystemMode"]."modulSelect"] = $modulSelect;
//	unset($_SESSION[$config["configShare"]["whichSystemMode"]."modulAction"]);
	}
else if (isset($_SESSION[$config["configShare"]["whichSystemMode"]."modulSelect"])) 
	{
	$modulSelect=$_SESSION[$config["configShare"]["whichSystemMode"]."modulSelect"]; 
	}
//	$_SESSION[$config["configShare"]["whichSystemMode"]."modulSelect"] = $modulSelect;

// set modulAction
if (isset($_POST["addSubmit"]))
	{
	$modulAction="add"; 
	$_SESSION[$config["configShare"]["whichSystemMode"]."modulAction"] = $modulAction;
	}
else if (isset($_POST["modulAction"])) 
	{
	$modulAction=$_POST["modulAction"]; 
	$_SESSION[$config["configShare"]["whichSystemMode"]."modulAction"] = $modulAction;
	}
else if (isset($_GET["modulAction"])) 
	{
	$modulAction=$_GET["modulAction"]; 
	$_SESSION[$config["configShare"]["whichSystemMode"]."modulAction"] = $modulAction;
	}
else if (empty($modulAction))
	{
	$modulAction=$_SESSION[$config["configShare"]["whichSystemMode"]."modulAction"]; 
	}

if (isset($modulSelect))
	{
	if ($modulSelect == "login" || $modulSelect == "logout")
		{
		if ($modulSelect == "logout")
			{
			$lastLogoutSQL = "UPDATE users SET `lastLogoutWhen`='".db_actual_datetime()."'";
			$lastLogoutSQL .= " WHERE id='".$_SESSION[$config["configShare"]["whichSystemMode"] . "status_UserID"]."'";
		 	db_query($lastLogoutSQL, $config["configShare"]["conn"]) or die(db_error());
			if ($_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_UserID"] != 2)
				{
				$usersLogInsertSQL="INSERT INTO userslog (usersID, modul, actionWhen) VALUES ";
				$usersLogInsertSQL .= "('".$_SESSION[$config["configShare"]["whichSystemMode"] . "status_UserID"]."', '".$modulSelect."', '".db_actual_datetime()."')";
			 	db_query($usersLogInsertSQL, $config["configShare"]["conn"]) or die(db_error());
				}
			}
		$userSQL = "SELECT * FROM users WHERE nickname = '".$config["configShare"]["guestUser"]."'";
		$userRS = db_query($userSQL, setConfigValue($config,"configShare","conn")); //or die(db_error());
		unset($_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_siteFilterID"]);
		unset($_SESSION[$config["configShare"]["whichSystemAndMode"]. "status_modulFilterID"]);
		if ($userROW = db_fetch_array($userRS))
			{
			$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_User"] = $UserROW["nickname"];
		 	$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_UserID"] = $userROW["id"];
		 	$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] = $userROW["groupsID"];
		 	$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_UserLangID"] = $userROW["langID"];
			db_free_result($userRS);
			}	
		$modulSelect = $config["configShare"]["homeModul"];
		}
	}
else
	{
	$modulSelect = $config["configShare"]["homeModul"];
	$_SESSION[$config["configShare"]["whichSystemMode"]."modulSelect"] = $modulSelect;
	$modulAction="list"; 
	$_SESSION[$config["configShare"]["whichSystemMode"]."modulAction"] = $modulAction;
	}


// set modul from database
//$modulSQL = "SELECT id, modul FROM modul WHERE active=1 AND langID=".$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_UserLangID"];
$modulSQL = "SELECT id, modul FROM configs WHERE active=1";
$modulSQL .= " AND modul='".$modulSelect."'";
$modulRS = db_query($modulSQL, $config["configShare"]["conn"]);
if (db_num_rows($modulRS) == 0)
	{
	$modulSelect = $config["configShare"]["homeModul"];
	}
else
	{
	$modulROW = db_fetch_array($modulRS);
	$config["configShare"]["modulID"]=$modulROW["id"];
	}
db_free_result($modulRS);

if (!isset($_GET['pg']) || empty($_GET['pg'])) 
	{
	$_SESSION[$config["configShare"]["whichSystem"]."whichSystemMode"] = "normal";
	$_GET["pg"]=$config["configShare"]["homeModul"];
	}

// set modullng from database
$modullngSQL = "SELECT modul, name, lngCFG, lngPATH active FROM configs";
$modullngSQL .= " WHERE (active=1 AND langID=".$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_UserLangID"].")";
$modullngRS = db_query($modullngSQL, $config["configShare"]["conn"]);
if ($modullngRS)
	{
	while ($modullngROW = db_fetch_array($modullngRS))
		{
		$nameCFG = iniCFGParser($modullngROW["lngCFG"],"##nameCFG##","##/nameCFG##");
		$nameTitle = explode('<=>',$nameCFG);
		$config[trim($modullngROW["modul"])][trim($nameTitle[0])]=trim($nameTitle[1]);

		$titleCFG = iniCFGParser($modullngROW["lngCFG"],"##titleCFG##","##/titleCFG##");
		$modulTitlesDIM = explode('<#>',$titleCFG);
		for ($modulTitleCount=0;$modulTitleCount<count($modulTitlesDIM);$modulTitleCount++)
			{
			$modulTitleDIM = explode('<=>',$modulTitlesDIM[$modulTitleCount]);
			$config[trim($modullngROW["modul"])][trim($modulTitleDIM[0])."Title"]=trim($modulTitleDIM[1]);
			$config[trim($modullngROW["modul"])."_".trim($modulTitleDIM[0])."Title"]=trim($modulTitleDIM[1]);
			if ($modullngROW["modul"]=="configShare")
				{
				$config["configShare"][trim($modulTitleDIM[0])]=trim($modulTitleDIM[1]);
				}
			else
				{
				$config[trim($modullngROW["modul"])."_".trim($modulTitleDIM[0])."Title"]=trim($modulTitleDIM[1]);
				}
			}
		$errorCFG = iniCFGParser($modullngROW["lngCFG"],"##errorCFG##","##/errorCFG##");
		$modulErrorsDIM = explode('<#>',$errorCFG);
		for ($modulErrorCount=0;$modulErrorCount<count($modulErrorsDIM);$modulErrorCount++)
			{
			$modulErrorDIM = explode('<=>',$modulErrorsDIM[$modulErrorCount]);
			$config[trim($modullngROW["modul"])][trim($modulErrorDIM[0]."Error")]=$modulErrorDIM[1];
			}
		}
	}
db_free_result($modullngRS);

$modulImagePath = $config["configShare"]["docrootPath"] . $config[$modulSelect]["imgpath"];

// init page HTML elements
//$config = pageHTMLElementsInit($config);

include ($config["configShare"]["startNextIndexPath"]."/index.php");
?>