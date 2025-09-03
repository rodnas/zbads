<?php
$config["sharedTPL"]["iniCFG"] = tplUp("shared",$config,"admin/tpl/");
// set lang and site filter
if ($modulSelect != "site" && $modulSelect != "groups" && $modulSelect != "users" && $modulSelect != "modul")
	{
	$config["configShare"]["filterLangSite"]="";
/*
	if (!empty($config["configShare"]["langID"]) && $config["configShare"]["langID"] != -1)
		{
		$config["configShare"]["filterLangSite"] .= "langID=".$config["configShare"]["langID"];
		}
	if (!empty($config["configShare"]["siteFilterID"]) && $config["configShare"]["siteFilterID"] != -1)
		{
		if (!empty($config["configShare"]["filterLangSite"]))
			{
			$config["configShare"]["filterLangSite"].=" AND";
			}
		$config["configShare"]["filterLangSite"] .= " siteID=".$config["configShare"]["siteFilterID"];
		}
*/
	}
$allRecs = modulPermission($config,$modulSelect);
$modulInclude = $config["configShare"]["shareModulsPath"].$config[$modulSelect]["modulBase"].".inc.php";
$config["marginLeft"]="style='margin-left:0;'";
require ($modulInclude);

$config["modulSelect"] = $o_config["modulSelect"];
if (!isset($_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_User"]) ||
	$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_User"]=="Guest")
	{
	$config[$config["modulSelect"]]["template"]="login";
	}
if (ISSET($_GET["whichModul"]))
	{
	$config[$config["modulSelect"]]["template"]="layout2";
	$config["whichModul"]=$_GET["whichModul"];
	$_SESSION["whichModul"] = $_GET["whichModul"]; 
	}
else
	{
//	session_unregister("whichModul");
	}
if ($_POST["x_whichModul"])
	{
	$config[$config["modulSelect"]]["template"]="layout2";
	$config["whichModul"]=$_POST["x_whichModul"];
	}
else
	{
	}
/*
if ($modulSelect == "advert")
	{
//	session_unregister("whichModul");
	if ($modulAction == "list")
		{
		session_unregister("advert_x_advertiserID");
		session_unregister("advert_x_campaignID");
		session_unregister("advert_x_sourceID");
		session_unregister("advert_x_sizeID");
		session_unregister("advert_x_sizeWidth");
		session_unregister("advert_x_sizeHeight");
		session_unregister("whichModul");
		}
	else
		{
//		$_POST["x_advertiserID"]=$_SESSION["advert_x_advertiserID"];
		}
	}
*/
$config["configShare"]["nickName"]=$_SESSION[$config["configShare"]["whichSystemAndMode"] . "status_User"];
$config["configShare"]["modulName"]=$config[$modulSelect]["title"];
$config["configShare"]["actionName"]=$config["configShare"][$modulAction."Title"];
display($config);

// close connection
if (isset($config["configShare"]["conn"]))
	{
//	db_close($config["configShare"]["conn"]);
	}
?>