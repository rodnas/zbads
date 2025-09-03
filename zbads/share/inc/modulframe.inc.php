<?php                      	
/**
* modulFrame functions
*/
$config = modulFrame($config, $modulSelect, $modulAction);
function modulFrame($p_config, $p_modulSelect, $p_modulAction)
	{
	$p_config["getAction"] = @$_POST["a"];
	changeYesNoReally($p_config,$p_modulSelect);
//	$p_config["whichSystem"] = setConfigValue($p_config,"configShare","whichSystemAndMode");
	$p_config["modulSelect"] = $p_modulSelect;
	$p_config["modulAction"] = $p_modulAction;
	$p_config[$p_config["modulSelect"]]["allRecs"] = modulPermission($p_config,$p_modulSelect);
	$p_config["visitCounter"] = setConfigValue($p_config,$modulSelect,"visitCounter");
	if (empty($p_config["visitCounter"]) && $p_config["visitCounter"]<>0) $p_config["visitCounter"] = 1;
	$actModulPath = setConfigValue($p_config,$p_modulSelect,"whichModulPath");
	if ($p_config["modulSelect"] == $_SESSION["whichModul"] || $p_config["modulSelect"] != "config" || $p_config["modulSelect"] != "configlng")
		{
//		session_unregister("whichModul");
		}
	if ($p_config["modulAction"]<>"list")
		{
		$p_config[$p_config["modulSelect"]]["whichBack"] = "index.php?modulSelect=".$p_config["modulSelect"]."&modulAction=list".$p_config[$p_config["modulSelect"]]["plusParam"];
		if (isset($_GET["whichBack"]))
			{
//			$_SESSION["addBack"] = $_GET["whichBack"]; 
			}
		if (isset($_SESSION["addBack"]))
			{
			$p_config[$p_config["modulSelect"]]["whichBack"] .= "&modulSelect=".$_SESSION["addBack"];
			}
		$p_config[$p_config["modulSelect"]]["key"] = @$_GET["key"];
		if (empty($p_config[$p_config["modulSelect"]]["key"]))
			{
			$p_config[$p_config["modulSelect"]]["key"] = @$_POST["key"];
			}
		if (empty($p_config[$p_config["modulSelect"]]["key"]) && $p_config["modulAction"]<>"add")
			{
//			jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
			}
		if (!empty($p_config[$p_config["modulSelect"]]["key"]))
			{
			$p_config[$p_config["modulSelect"]]["sqlKey"] = "id=" . "" . $p_config[$p_config["modulSelect"]]["key"] . "";
			$_SESSION[$p_config["modulSelect"]["whichSystemAndMode"].$p_config["modulSelect"]."sqlKey"] = $p_config[$p_config["modulSelect"]]["sqlKey"];
			}
		else
			{
			$p_config[$p_config["modulSelect"]]["sqlKey"] = "";
			}
		// get action
		}
	if (ISSET($_GET["whichModul"]) && !empty($_GET["whichModul"]))
		{
		$p_config[$p_config["modulSelect"]]["whichBack"]="index.php?modulSelect=advert&modulAction=add&advertcmd=resetall";
		}
	else if (ISSET($_POST["x_whichModul"]) && !empty($_POST["x_whichModul"]) )
		{
		$p_config[$p_config["modulSelect"]]["whichBack"]="index.php?modulSelect=advert&modulAction=add&advertcmd=resetall";
		}
	if (ISSET($_SESSION["whichModul"]) && !empty($_SESSION["whichModul"]) )
		{
		$p_config[$p_config["modulSelect"]]["whichBack"]="index.php?modulSelect=advert&modulAction=list&advertcmd=resetall";
		}
	if ($p_config["modulAction"]=="list")
		{
		unset($_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."firstPage"]);
		unset($_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."lastPage"]);
		unset($_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."modulPage"]);
		unset($_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."errorPage"]);
		if (!isModulView($p_config,$p_config["modulSelect"])) 
			{
//			jumpToPage(setConfigValue($p_config,"configShare","baseModul"));
			}
		if (isset($_SESSION["listBack"]))
			{
//			$p_config[$p_config["modulSelect"]]["whichBack"] .= "&modulSelect=".$_SESSION["listBack"]."&cmd=resetall";
			}
		if (isset($_SESSION["whichModul"]))
			{
			$p_config[$p_config["modulSelect"]]["whichBack"] .= "&modulSelect=".$_SESSION["whichModul"]."&cmd=resetall";
			}
		$p_config[$p_config["modulSelect"]]["displayRecs"]=setConfigValue($p_config,$p_modulSelect,"displayRecs");
		$p_config[$p_config["modulSelect"]]["recRange"]=setConfigValue($p_config,$p_modulSelect,"recRange");
		$p_config[$p_config["modulSelect"]]["startRec"]=1;
		$p_config[$p_config["modulSelect"]]["advancedSearch"]="";
		$p_config[$p_config["modulSelect"]]["basicSearch"]="";
		$p_config[$p_config["modulSelect"]]["pSearchOriginal"]="";
		$p_config[$p_config["modulSelect"]]["searchWhere"]="";
		$p_config[$p_config["modulSelect"]]["dbwhere"]="";
		$p_config[$p_config["modulSelect"]]["whereClause"]="";
		$p_config[$p_config["modulSelect"]]["masterDetailWhere"] = "";
		$p_config[$p_config["modulSelect"]]["OrderBy"] = "";
		$p_config[$p_config["modulSelect"]]["GroupBy"] = "";
		if (isset($_GET["whichBack"]))
			{
//			$_SESSION["listBack"] = $_GET["whichBack"]; 
			}
		if (isset($_GET["whichModul"]))
			{
//			$_SESSION["whichModul"] = $_GET["whichModul"]; 
			}
		if (isset($_SESSION["listBack"]))
			{
//			$p_config[$p_config["modulSelect"]]["whichBack"] = $_SESSION["listBack"]; 
			}	
		if (!empty($p_config[$p_config["modulSelect"]]["listBack"]))
			{
//			$p_config[$p_config["modulSelect"]]["whichBack"] = $p_config[$p_config["modulSelect"]]["listBack"]; 
			}
		include "modullist.inc.php";
		$p_config = modulSimpleList($p_config);
		}
	else if ($p_config["modulAction"]=="view")
		{
		if (!isModulView($p_config,$p_config["modulSelect"])) jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
		$p_config = header1($p_config);
		if (empty($p_config["getAction"]))
			{
			$p_config["getAction"] = "I";	// display
			$p_config["key"] = @$_GET["key"];
			}
		include "modulview.inc.php";
		$p_config = modulFrameView($p_config);
		}
	else if ($p_config["modulAction"]=="add")
		{
		if (!isModulAdd($p_config,$p_config["modulSelect"])) jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
		$p_config = header1($p_config);
/*
editor
*/
		if (empty($p_config["getAction"]))
			{
			$p_config[$p_config["modulSelect"]]["key"] = @$_GET["key"];
			$p_config["key"] = @$_GET["key"];
			if ($p_config[$p_config["modulSelect"]]["key"] <> "")
				{
				$p_config["getAction"] = "C"; // copy record
				}
			else
				{
				$p_config["getAction"] = "I"; // display blank record
				}
			}

		$p_config["x_errorText"]="";
		$p_config["x_fieldFocus"]="";
		include "moduladd.inc.php";
		$p_config = modulFrameAdd($p_config);
		}
	else if ($p_config["modulAction"]=="edit")
		{
		if (!isModulEdit($p_config,$p_config["modulSelect"])) jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
		$p_config = header1($p_config);
/*
editor
*/
		if (empty($p_config["getAction"]))
			{
			$p_config["getAction"] = "I";	//display with input box
			$p_config["key"] = @$_GET["key"];
			}
		$p_config["x_errorText"]="";
		$p_config["x_fieldFocus"]="";
		include "moduledit.inc.php";
		$p_config = modulFrameEdit($p_config);
		}
	else if ($p_config["modulAction"]=="delete")
		{
		if (!isModulDelete($p_config,$p_config["modulSelect"])) jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
		$p_config = header1($p_config);
		if (empty($p_config["getAction"]))
			{
			$p_config["getAction"] = "I";	// display
			$p_config["key"] = @$_GET["key"];
			}
		include "moduldelete.inc.php";
		$p_config = modulFrameDelete($p_config);
		}
	else if ($p_config["modulAction"]=="passchange")
		{
		$p_config["formStartHTML"] = "<form onSubmit=\"return EW_checkMyForm(this);\" enctype=\"multipart/form-data\" method='post' name='".$p_config["modulAction"]."form' action='?'>";
		$p_config["formStopHTML"] = "</form>";
		if (!isModulEdit($p_config,$p_config["modulSelect"])) jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
		$p_config = header1($p_config);
		if (empty($p_config["getAction"]))
			{
			$p_config["getAction"] = "I";	//display with input box
			}
		$p_config["x_errorText"]="";
		$p_config["x_fieldFocus"]="";
		$p_config = passChange($p_config);
		$p_config["navigationHTML"] = footerNavigation($p_config);
		$p_config["contentHTML"] .= $p_config["navigationHTML"];
		}
	return $p_config;
	}
?>