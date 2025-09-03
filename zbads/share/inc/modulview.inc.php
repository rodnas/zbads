<?php
function modulFrameView($p_config)
	{
	if (trim($_POST["Action"])==$p_config["configShare"]["backTitle"])
		{
		jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
		}
	switch ($p_config["getAction"])
		{
		case "I": // display
			$itemValues = modulGetRecord($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
			if (($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2 ||
				$_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 3) && 
				($itemValues["x_isReadWhen"] == 0 || is_null($itemValues["x_isReadWhen"])))
				{
				if ($p_config["modulSelect"] != "messagewall")
					{
					$updateSQL = "UPDATE " . $p_config["modulSelect"] . " SET ";
					$updateSQL .= "isReadWhen = '".db_actual_datetime()."',";
					$updateSQL .= "isReadUserID = '".$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"]."'";
					$updateSQL .= " WHERE id=" .$p_config[$p_config["modulSelect"]]["key"];
					}
				else
					{
					$updateSQL = "UPDATE " . $p_config["modulSelect"] . " SET ";
					$updateSQL .= "isReadWhen = '".db_actual_datetime()."'";
					$updateSQL .= " WHERE id=" .$p_config[$p_config["modulSelect"]]["key"];
					}
			  	$rs = db_query($updateSQL, setConfigValue($p_config,"configShare","conn"), setConfigValue($p_config,"configShare","conn")); //or die(db_error());
			
				}
			break;
		}
	$p_config["getAction"]="";
	$p_config["contentViewHTML"] = modulFrameViewRecord($p_config,$itemValues,"");
	$p_config["navigationHTML"] = footerNavigation($p_config);
	$viewHTML = iniCFGParser($p_config["sharedTPL"]["iniCFG"],"##viewForm##","##/viewForm##");
	$p_config["contentHTML"]=ParseTplForm($viewHTML,$p_config,$itemValues);
	return $p_config;
	}

function modulFrameViewRecord($p_config, $p_itemValues, $p_getAction)
	{
	$viewCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##viewCFG##","##/viewCFG##");
	$viewFieldCFG = explode('<#>',$viewCFG);
	if ($p_config[$p_config["modulSelect"]]["hide"] != "1")
		{
		$actualImgPath = $p_config["configShare"]["docrootPath"].$p_config[$p_config["modulSelect"]]["imgPath"];
		}
	else
		{
		$actualImgPath = $p_config["configShare"]["docrootPathHide"].$p_config[$p_config["modulSelect"]]["imgPath"];
		}
	for ($viewFieldCFGCount=0;$viewFieldCFGCount<count($viewFieldCFG);$viewFieldCFGCount++)
		{
		$viewItemCFG = explode('<=>',trim($viewFieldCFG[$viewFieldCFGCount]));
		switch ($viewItemCFG[0])
			{
			case "simple":
				$p_config[$p_config["modulSelect"]."_".$viewItemCFG[1]]=htmlspecialchars($p_itemValues[$viewItemCFG[1]]);
				break;
			case "optionSelect":
				$p_config[$p_config["modulSelect"]."_".$viewItemCFG[1]]=optionView($p_config,$viewItemCFG[1],$viewItemCFG[2],$viewItemCFG[3],$viewItemCFG[4],$p_itemValues);
				break;
			case "prevView":
				$p_config[$p_config["modulSelect"]."_".$viewItemCFG[1]]=optionView($p_config,$viewItemCFG[1],$viewItemCFG[2],$viewItemCFG[3],$viewItemCFG[4],$p_itemValues);
				break;
			case "editorText":
				$p_config[$p_config["modulSelect"]."_".$viewItemCFG[1]]=$p_itemValues[$viewItemCFG[1]];
				if (empty($viewItemCFG[2]) || intval($viewItemCFG[2]) > 115) $viewItemCFG[2] = 115;
				if (empty($viewItemCFG[3]) || intval($viewItemCFG[3]) > 10) $viewItemCFG[3] = 10;
				break;
			case "checkbox":
				$p_config[$p_config["modulSelect"]."_".$viewItemCFG[1]]=activeItem($p_config,$p_itemValues,$viewItemCFG[1],setConfigValue($p_config,"configShare","yesTitle"),setConfigValue($p_config,"configShare","noTitle"));
				break;
			case "simpleText":
				$p_config[$p_config["modulSelect"]."_".$viewItemCFG[1]]=htmlspecialchars($p_itemValues[$viewItemCFG[1]]);
				if (empty($viewItemCFG[2])) $viewItemCFG[2] = 60;
				if (empty($viewItemCFG[2])) $viewItemCFG[3] = 10;
				break;
			case "datePanel":
				$p_config[$p_config["modulSelect"]."_".$viewItemCFG[1]]=htmlspecialchars($p_itemValues[$viewItemCFG[1]]);
				break;
			case "pictureView":
				$p_config[$p_config["modulSelect"]."_".$viewItemCFG[1]]= pictureView($p_config, $actualImgPath.$p_itemValues[$viewItemCFG[1]],"",$p_itemValues["x_sizeWidth"],$p_itemValues["x_sizeHeight"]);
				break;
			}
		}
	$viewForm = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##viewForm##","##/viewForm##");
	if (file_exists($p_config["configShare"]["incPath"].$p_config["modulSelect"].".inc.php"))
		{
		include $p_config["configShare"]["incPath"].$p_config["modulSelect"].".inc.php";
		if (ISSET($viewItem))
			{
			reset($viewItem);
			while( key($viewItem) !== NULL )
				{
				$viewItemNOW = key($viewItem);
				$viewItemVisible = current($viewItem);
				if ($viewItemVisible==1)
					{
					$viewForm = str_replace("<".$viewItemNOW.">","",$viewForm);
					$viewForm = str_replace("</".$viewItemNOW.">","",$viewForm);
					}
				else
					{
					$viewForm = ini2CFGParser($viewForm,"<".$viewItemNOW.">","</".$viewItemNOW.">");
					}
				next($viewItem);
				}
			}
		}
	$p_config = modulListPrev($p_config);
	$resultHTML .= ParseTpl($viewForm,$p_config,"");
	return $resultHTML;
	}


function modulListPrev($p_config)
	{
	if (isset($_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."_prev_key"]))
		{
		$prevSQL = "SELECT *";
		$prevSQL .= " FROM ".$p_config[$p_config["modulSelect"]]["prevTable"];
		$prevSQL .= " WHERE (".$p_config[$p_config["modulSelect"]]["prevTable"].".id = " . $_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."_prev_key"]  . ")";	
		$prevRS = db_query($prevSQL, setConfigValue($p_config,"configShare","conn"));
		if (db_num_rows($prevRS, setConfigValue($p_config,"configShare","conn") ) > 0)
			{
			$prevROW = db_fetch_array($prevRS);
			$listPrevCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##listPrevCFG##","##/listPrevCFG##");
			$listPrevItemCFG = explode('<#>',$listPrevCFG);
			for ($listPrevItemCFGCount=0;$listPrevItemCFGCount<count($listPrevItemCFG);$listPrevItemCFGCount++)
				{
				$listPrevItemFieldCFG = explode('<=>',trim($listPrevItemCFG[$listPrevItemCFGCount]));
				switch ($listPrevItemFieldCFG[0])
					{
					case "simple":
						$p_config[$p_config[$p_config["modulSelect"]]["prevTable"]."_prev_".$listPrevItemFieldCFG[1]."Title"]=$p_config[$p_config[$p_config["modulSelect"]]["whichBack"]][$listPrevItemFieldCFG[1]."Title"];
						$p_config[$p_config[$p_config["modulSelect"]]["prevTable"]."_prev_".$listPrevItemFieldCFG[1]]=$prevROW[$listPrevItemFieldCFG[1]];
						break;
					}
				}
			$key = @$prevROW["id"];
			$p_config[setConfigValue($p_config,$p_config["modulSelect"],"prevTable")]["resultRow"] = $row;
			$prevKey = $_SESSION[$p_config["modulSelect"]["whichSystemAndMode"].$p_config["modulSelect"]."sqlKey"];
			$_SESSION[$p_config["modulSelect"]["whichSystemAndMode"].$p_config["modulSelect"]."sqlKey"] = $prevKey;
			}
		}
	return $p_config;
	}
?>
