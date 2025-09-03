<?php
function modulSimpleList($p_config)
	{
	$x_changeYesNo = @$_GET["changeYesNo"];
	$rightsDIM = array("allowview","allowadd","allowedit","allowdelete","allowadmin");
	if (!empty($x_changeYesNo) && in_array($x_changeYesNo,$rightsDIM))
		{
		$w_actual_datetime = db_actual_datetime();
		$x_key_record = $_GET["key_record"];
		$selectRightsSQL = "SELECT * FROM " . $p_config["modulSelect"] . " WHERE id=" . $x_key_record;
		$rs = db_query($selectRightsSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
		if (!($row = db_fetch_array($rs)))
			{
			jumpToPage("index.php?modulAction=" . $whichBack);
			}
		// get the field contents
		$p_rights_id = @$row["rights_id"]; 
		$p_allrecs = @$row["allrecs"];
		switch ($x_changeYesNo)
			{
			case "allowview":
				if ((@$row["allrecs"] & ewAllowView) == ewAllowView && $_GET["actPermission"] == '1') 
					{$p_allrecs -= 8;} 
				else if (!(@$row["allrecs"] & ewAllowView) == ewAllowView && $_GET["actPermission"] == '0') 
					{$p_allrecs += 8;};
				break;
			case "allowadd": 
				if ((@$row["allrecs"] & ewAllowAdd) == ewAllowAdd && $_GET["actPermission"] == '1') 
					{$p_allrecs -= 1;} 
				else if (!(@$row["allrecs"] & ewAllowAdd) == ewAllowAdd && $_GET["actPermission"] == '0') 
					{$p_allrecs += 1;};
				break;
			case "allowedit": 
				if ((@$row["allrecs"] & ewAllowEdit) == ewAllowEdit && $_GET["actPermission"] == '1') 
					{$p_allrecs -= 4;} 
				else if (!(@$row["allrecs"] & ewAllowEdit) == ewAllowEdit && $_GET["actPermission"] == '0') 
					{$p_allrecs += 4;};
				break;
			case "allowdelete": 
				if ((@$row["allrecs"] & ewAllowDelete) == ewAllowDelete && $_GET["actPermission"] == '1') 
					{$p_allrecs -= 2;} 
				else if (!(@$row["allrecs"] & ewAllowDelete) == ewAllowDelete && $_GET["actPermission"] == '0') 
					{$p_allrecs += 2;};
				break;
			case "allowadmin": 
				if ((@$row["allrecs"] & ewAllowAdmin) == ewAllowAdmin && $_GET["actPermission"] == '1') 
					{$p_allrecs -= 16;} 
				else if (!(@$row["allrecs"] & ewAllowAdmin) == ewAllowAdmin && $_GET["actPermission"] == '0') 
					{$p_allrecs += 16;};
				break;
			}
		$updateRightsSQL = "UPDATE " . $p_config["modulSelect"] . " SET ";
		$updateRightsSQL .= "allrecs = ".$p_allrecs;			
		$updateRightsSQL .= " WHERE id= '".$x_key_record."'";
		$updateRightsSQLrs = db_query($updateRightsSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
		}

	if (isset($_GET["prev_key"]))
		{
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."_prev_key"] = $_GET["prev_key"];
		}
	// get search criteria for advanced search
	$p_config = basicSearch($p_config);
	$p_config = buildSearch($p_config);
	$p_config = saveSearch($p_config);
	$p_config = clearSearch($p_config);	
	$p_config = buildWhere($p_config);

	// default order
	$p_config[$p_config["modulSelect"]]["defaultOrder"] = setConfigValue($p_config,$p_config["modulSelect"],"defaultOrder");
	if ($p_config["modulSelect"] != "userslog")
		{
		if (empty($p_config[$p_config["modulSelect"]]["defaultOrder"])) $p_config[$p_config["modulSelect"]]["defaultOrder"] = "insertWhen";
		}
	else
		{
		if (empty($p_config[$p_config["modulSelect"]]["defaultOrder"])) $p_config[$p_config["modulSelect"]]["defaultOrder"] = "actionWhen";
		}
	$p_config[$p_config["modulSelect"]]["defaultOrderType"] = setConfigValue($p_config,$p_config["modulSelect"],"defaultOrderType");
	if (empty($p_config[$p_config["modulSelect"]]["defaultOrderType"])) $p_config[$p_config["modulSelect"]]["defaultOrderType"] = "DESC";

	// default filter
	$p_config[$p_config["modulSelect"]]["defaultFilter"]="";
	if (isset($_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."_prev_key"]))
		{
		$p_config[$p_config["modulSelect"]]["defaultFilter"] = " (".setConfigValue($p_config,$p_config["modulSelect"],"prevTable")."ID=".$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."_prev_key"].")";
		}
	$modulFilterParamDIM = explode('<#>',setConfigValue($p_config,$p_config["modulSelect"],"modulFilterParam"));
	for ($filterFieldCount=0;$filterFieldCount<count($modulFilterParamDIM);$filterFieldCount++)
		{
		$modulFilterFieldDIM = explode('#',$modulFilterParamDIM[$filterFieldCount]);
		switch ($modulFilterFieldDIM[0])
			{
			case "modulSelect":
				$p_config[$p_config["modulSelect"]]["defaultFilter"].=" ".$modulFilterFieldDIM[1]."='".$p_config["modulSelect"]."'";
				break;
			case "menu_id":
				if (isset($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."whichTopSubMenu"]))
					{
					$p_config[$p_config["modulSelect"]]["defaultFilter"].=" ".$modulFilterFieldDIM[1]."='".$_SESSION[$p_config["configShare"]["whichSystemAndMode"]."whichTopSubMenu"]."'";
					}
				$p_config[$p_config["modulSelect"]]["defaultFilter"].=" ".$modulFilterFieldDIM[1]."='".$_SESSION[$p_config["configShare"]["whichSystemAndMode"]."whichTopSubMenu"]."'";
				break;
			default:
				break;
			}
		}
	if ($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2 ||
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 3)
		{
		$p_config[$p_config["modulSelect"]]["defaultFilter"] .= "";
		}
	else
		{	
		if (!empty($p_config[$p_config["modulSelect"]]["defaultFilter"]))
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"].=" AND ".setConfigValue($p_config,$p_config["modulSelect"],"mainTable").".active=1";
			}
		else
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"].=setConfigValue($p_config,$p_config["modulSelect"],"mainTable").".active=1";
			}
		
		if ($p_config["modulSelect"] == "site")
			{
//			$p_config[$p_config["modulSelect"]]["defaultFilter"].= " AND id=".$p_config["configShare"]["siteID"];
			}

		if ($p_config[$p_config["modulSelect"]]["ownFilter"]==1 && empty($p_config[$p_config["modulSelect"]]["pSearch"]))
			{
			if ($p_config["modulSelect"] != "recruiter" && $p_config["modulSelect"] != "phonebook" &&
				$_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 8)
				{
				$p_config[$p_config["modulSelect"]]["defaultFilter"].=" AND ".setConfigValue($p_config,$p_config["modulSelect"],"mainTable").".insertUserID=".$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"];
				}
			}
		}
	if ($p_config["modulSelect"] == "users")
		{
		// default filter
		$p_config[$p_config["modulSelect"]]["defaultFilter"] = "";
		if ($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2)
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"] = "";
			}
		else if ($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 3)
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"] = "groupsID=1 OR groupsID > 2";
			}
		else  if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"]==1)
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"] = "active=1 AND groupsID=1";
			}
		else
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"] = "active=1 AND (groupsID=1 OR groupsID > 3)";
			}
		}
	if ($p_config["modulSelect"] == "configs")
		{
		if ($p_config["modulSelect"] == "configs" && @$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] != 2) 
			jumpToPage(setConfigValue($p_config,"configShare","baseModul"));
		if (isset($_SESSION["whichModul"]))
			{
			if (!empty($p_config[$_SESSION["whichModul"]]["listBack"]))
				{
				$p_config[$p_config["modulSelect"]]["whichBack"] = $p_config[$_SESSION["whichModul"]]["listBack"];
				}
			else
				{
				$p_config[$p_config["modulSelect"]]["whichBack"] = $_SESSION["whichModul"];
				}
			}
		// default filter
		if ($_GET["calltype"]=="all")
			{
			session_unregister("whichModul");
			}
		if ($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2)
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"] = "";
			if ( ISSET($_SESSION["whichModul"]) ) $p_config[$p_config["modulSelect"]]["defaultFilter"] = "modul='".$_SESSION["whichModul"]."'";
			}
		else
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"] = "active=1";
			if ( ISSET($_SESSION["whichModul"]) ) $p_config[$p_config["modulSelect"]]["defaultFilter"] = " AND modul='".$_SESSION["whichModul"]."'";
			}
		}
	if (!empty($p_config[$p_config["modulSelect"]]["defaultFilter"]))
		{
		if (!empty($p_config["configShare"]["filterLangSite"]))
			{
//			$p_config[$p_config["modulSelect"]]["defaultFilter"] .= " AND " . $p_config["configShare"]["filterLangSite"];
			}
		if (!empty($plusFilter))
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"] .= " AND ".$plusFilter;
			}
		}
	else
		{
		$p_config[$p_config["modulSelect"]]["defaultFilter"] .= $p_config["configShare"]["filterLangSite"];
		if (!empty($p_config[$p_config["modulSelect"]]["defaultFilter"]) && !empty($plusFilter))
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"] .= " AND ".$plusFilter;
			}
		else
			{
			$p_config[$p_config["modulSelect"]]["defaultFilter"] .= $plusFilter;
			}
		}
	$p_config = checkOrder($p_config);
	// build SQL
	$p_config[$p_config["modulSelect"]]["strSQL"] = "SELECT * FROM (SELECT ".setConfigValue($p_config,$p_config["modulSelect"],"mainTable").".*,";
	$relatedTablesCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##relatedTablesCFG##","##/relatedTablesCFG##");
	$relatedTableCFG = explode('<#>',$relatedTablesCFG);
	for ($relatedTableCFGCount=0;$relatedTableCFGCount<count($relatedTableCFG);$relatedTableCFGCount++)
		{
		$relatedTableItemCFG = explode('<=>',trim($relatedTableCFG[$relatedTableCFGCount]));
		$p_config[$p_config["modulSelect"]]["strSQL"] .= "(SELECT ".$relatedTableItemCFG[0].".".$relatedTableItemCFG[1]." FROM ".$relatedTableItemCFG[0]." WHERE ".$relatedTableItemCFG[0].".id = ".$p_config[$p_config["modulSelect"]]["mainTable"].".".$relatedTableItemCFG[2].") AS ".$relatedTableItemCFG[3].$relatedTableItemCFG[4];
		}
	$p_config[$p_config["modulSelect"]]["strSQL"] .= " FROM " . $p_config[$p_config["modulSelect"]]["mainTable"] .") AS work ";
	$p_config=buildSQL($p_config);
//echo $p_config[$p_config["modulSelect"]]["strSQL"]."<br>";
	$p_config[$p_config["modulSelect"]]["resultSQL"] = db_query($p_config[$p_config["modulSelect"]]["strSQL"], setConfigValue($p_config,"configShare","conn"));
	$p_config[$p_config["modulSelect"]]["totalRecs"] = intval(db_num_rows($p_config[$p_config["modulSelect"]]["resultSQL"]));
	$p_config=checkStart($p_config);
	$p_config = header1($p_config);
	$p_config = modulFrameList($p_config);
	db_free_result($p_config[$p_config["modulSelect"]]["resultSQL"]);
	return $p_config;
	}

function modulFrameList($p_config)
	{
	$listPrevHTML = modulListPrev($p_config);
	$contentListtHTML = $listPrevHTML;
	$listHeadHTML = modulListHead($p_config);
	$contentListtHTML .= $listHeadHTML;
	$p_config = startList($p_config);
	while (($p_config[$p_config["modulSelect"]]["resultRow"] = db_fetch_array($p_config[$p_config["modulSelect"]]["resultSQL"])) && ($p_config[$p_config["modulSelect"]]["recCount"] < $p_config[$p_config["modulSelect"]]["stopRec"]))
		{
		$p_config[$p_config["modulSelect"]]["recCount"]++;	
		if ($p_config[$p_config["modulSelect"]]["recCount"] >= $p_config[$p_config["modulSelect"]]["startRec"])
			{
			$p_config[$p_config["modulSelect"]]["recActual"]++;	
			$p_config[$p_config["modulSelect"]]["bgcolor"] = 'listLineColor1'; // row color
			$p_config[$p_config["modulSelect"]."_"."bgcolor"] = 'listLineColor1'; // row color
			if (($p_config[$p_config["modulSelect"]]["recCount"] % 2) <> 0)
				{ // display alternate color for rows
				$p_config[$p_config["modulSelect"]."_"."bgcolor"] = 'listLineColor2'; // row color
				}

			// load key for record
			$p_config[$p_config["modulSelect"]]["key"] = @$p_config[$p_config["modulSelect"]]["resultRow"]["id"];
			foreach ($p_config[$p_config["modulSelect"]]["resultRow"] as $key => $value) {
				$itemValues["x_".$key] = $value; 
			}
//			$itemValues = itemValuesFromDB($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
			$itemValues["x_insert_name"] = $p_config[$p_config["modulSelect"]]["resultRow"]["insertName"];
			$itemValues["x_modify_name"] = $p_config[$p_config["modulSelect"]]["resultRow"]["modifyName"];
			$itemValues["x_langName"] = $p_config[$p_config["modulSelect"]]["resultRow"]["langName"];
			$itemValuesCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##itemValuesPlus##","##/itemValuesPlus##");
			$itemValuesItemCFG = explode('<#>',$itemValuesCFG);
			for ($itemValuesItemCFGCount=0;$itemValuesItemCFGCount<count($itemValuesItemCFG);$itemValuesItemCFGCount++)
				{
				$itemValues["x_".$itemValuesItemCFG[$itemValuesItemCFGCount]] = $p_config[$p_config["modulSelect"]]["resultRow"][$itemValuesItemCFG[$itemValuesItemCFGCount]];
				}
			if ($p_config["modulSelect"] == "messagewall")
				{
				if ($itemValues["x_insertUserID"] != $_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"])
					{
					$p_config[$p_config["modulSelect"]]["noCopy"] = false;
					$p_config[$p_config["modulSelect"]]["noEdit"] = true;
					}
				else
					{
					$p_config[$p_config["modulSelect"]]["noCopy"] = true;
					$p_config[$p_config["modulSelect"]]["noEdit"] = false;
					}
				}
			if (!empty($itemValues["x_bgcolor"]))
				{
				$p_config[$p_config["modulSelect"]]["bgcolor"]=$itemValues["x_bgcolor"];
				$p_config[$p_config["modulSelect"]]["fgcolor"]=$itemValues["x_fgcolor"];
				$contentListHTML .= "<tr height='25' style='background-color:" . $p_config[$p_config["modulSelect"]]["bgcolor"]. ";color:" . $p_config[$p_config["modulSelect"]]["fgcolor"]. ";' align='center'>";
				}
			else
				{
				$contentListHTML .= "<tr height='25' class='" . $p_config[$p_config["modulSelect"]]["bgcolor"]. "' align='center'>";
				}
			$contentListWideHTML = "";

			$listCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##listCFG##","##/listCFG##");
			$listItemCFG = explode('<#>',$listCFG);
			for ($listItemCFGCount=0;$listItemCFGCount<count($listItemCFG);$listItemCFGCount++)
				{
				$listItemFieldCFG = explode('<=>',trim($listItemCFG[$listItemCFGCount]));
				switch ($listItemFieldCFG[0])
					{
					case "simple":
						$p_config[$p_config["modulSelect"]."_x_".$listItemFieldCFG[2]]=$itemValues[$listItemFieldCFG[3]]."&nbsp;";
						break;
					case "fullLine":
						if (!empty($itemValues[$listItemFieldCFG[3]]))
							{
							$p_config[$p_config["modulSelect"]."_x_".$listItemFieldCFG[2]]=$itemValues[$listItemFieldCFG[3]];
							}
						else
							{
							$p_config[$p_config["modulSelect"]."_x_".$listItemFieldCFG[2]]="";
							}
						break;
					case "optionView":
						$p_config[$p_config["modulSelect"]."_x_".$listItemFieldCFG[2]]=optionView($p_config,$listItemFieldCFG[2],$listItemFieldCFG[3],$listItemFieldCFG[4],$listItemFieldCFG[5],$itemValues);
						break;
					case "active":
						$p_config[$p_config["modulSelect"]."_x_".$listItemFieldCFG[2]]=changeYesNo($p_config, $itemValues,"active",$itemValues["x_active"],setConfigValue($p_config,"configShare","yesTitle"),setConfigValue($p_config,"configShare","noTitle"));
						break;
					case "insertwhowhen":
						$itemValues["x_insert_name"] = $p_config[$p_config["modulSelect"]]["resultRow"]["insertName"];
						$p_config[$p_config["modulSelect"]."_x_".$listItemFieldCFG[2]]="<b>".$itemValues["x_insert_name"]."<br><i>" . FormatDateTime($itemValues["x_insertWhen"],8) . "</i></b>";
						break;
					case "insertWhen":
						$itemValues["x_insert_name"] = $p_config[$p_config["modulSelect"]]["resultRow"]["insertName"];
						$p_config[$p_config["modulSelect"]."_x_".$listItemFieldCFG[2]]="<b><i>" . FormatDateTime($itemValues["x_insertWhen"],8) . "</i></b>";
						break;
					case "allow":
						switch ($listItemFieldCFG[3])
							{
							case "allowview":
								$allowActual = ewAllowView;
								break;
							case "allowadd":
								$allowActual = ewAllowAdd;
								break;
							case "allowedit":
								$allowActual = ewAllowEdit;
								break;
							case "allowdelete":
								$allowActual = ewAllowDelete;
								break;
							case "allowadmin":
								$allowActual = ewAllowAdmin;
								break;
							}	
						$p_config[$p_config["modulSelect"]."_x_".$listItemFieldCFG[2]]=changeYesNo($p_config, $itemValues,$listItemFieldCFG[3],(($itemValues["x_allrecs"] & $allowActual) == $allowActual),$p_config["configShare"]["yes"],$p_config["configShare"]["no"]);
						break;
					}
				}
			if (!empty($p_config[$p_config["modulSelect"]]["nextModul"]) && isModulView($p_config,$p_config[$p_config["modulSelect"]]["nextModul"]))
				{
				if (($p_config[$p_config["modulSelect"]]["key"] != NULL))
					{
					$subOther = "<a title='' href='index.php?modulSelect=".$p_config[$p_config["modulSelect"]]["nextModul"]."&amp;modulAction=list&amp;prev_key=" . urlencode($itemValues["x_id"]) . "&amp;".$p_config[$p_config["modulSelect"]]["nextModul"]."cmd=reset&amp;table=".$p_config["modulSelect"]."'>";
					}
				else
					{
					$subOther = "<a title='' href=\"" . "javascript:alert('Invalid Record! Key is null');" . "\">";
					}
				if (isset($p_config[$p_config["modulSelect"]]["nextModulIcon"]))
					{
					$subOther .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . $p_config[$p_config["modulSelect"]]["nextModulIcon"]."' border='0' name='view' title='".setConfigValue($p_config,$p_config["modulSelect"],"nextModulTitle")."' class='buttonBox'></a>";
					}
				else
					{
					$subOther .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . "dictionary.png' border='0' name='view' title='".setConfigValue($p_config,$p_config["modulSelect"],"nextModulTitle")."' class='buttonBox'></a>";
					}
				}
			$p_config[$p_config["modulSelect"]."_x_submenu"] = $subOther."&nbsp;&nbsp;".subMenu($p_config, $itemValues,$p_config["modulSelect"]);
			$listItemForm = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##listItemForm##","##/listItemForm##");
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
							$listItemForm = str_replace("<".$viewItemNOW.">","",$listItemForm);
							$listItemForm = str_replace("</".$viewItemNOW.">","",$listItemForm);
							}
						else
							{
							$listItemForm = ini2CFGParser($listItemForm,"<".$viewItemNOW.">","</".$viewItemNOW.">");
							}
						next($viewItem);
						}
					}
				}
			$contentItemHTML = ParseTpl($listItemForm,$p_config,"");
			$contentItemHTML = str_replace('<div id="itemView"></div>','',$contentItemHTML);
			}
		$contentListtHTML .= $contentItemHTML;
		}
	$p_config = navigationNew($p_config,setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
	$listHTML = iniCFGParser($p_config["sharedTPL"]["iniCFG"],"##listForm##","##/listForm##");
	$p_config["contentListHTML"] = $contentListtHTML;
	$p_config["contentHTML"]=ParseTplForm($listHTML,$p_config,"");
	return $p_config;
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
						$p_config[$p_config[$p_config["modulSelect"]]["whichBack"]."_prev_".$listPrevItemFieldCFG[1]."Title"]=$p_config[$p_config[$p_config["modulSelect"]]["whichBack"]][$listPrevItemFieldCFG[1]."Title"];
						$p_config[$p_config[$p_config["modulSelect"]]["whichBack"]."_prev_".$listPrevItemFieldCFG[1]]=$prevROW[$listPrevItemFieldCFG[1]];
						break;
					}
				}
			$key = @$prevROW["id"];
			$p_config[setConfigValue($p_config,$p_config["modulSelect"],"prevTable")]["resultRow"] = $row;
			$prevKey = $_SESSION[$p_config["modulSelect"]["whichSystemAndMode"].$p_config["modulSelect"]."sqlKey"];
			$_SESSION[$p_config["modulSelect"]["whichSystemAndMode"].$p_config["modulSelect"]."sqlKey"] = $prevKey;
			}
		}
	$listPrevForm = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##listPrevForm##","##/listPrevForm##");
	$resultPrevHTML = ParseTpl($listPrevForm,$p_config,"");
	return $resultPrevHTML;
	}

function modulListHead($p_config)
	{
	$listCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##listCFG##","##/listCFG##");
	$listHeaderCFG = explode('<#>',$listCFG);
	for ($listHeaderCFGCount=0;$listHeaderCFGCount<count($listHeaderCFG);$listHeaderCFGCount++)
		{
		$listHeaderFieldCFG = explode('<=>',trim($listHeaderCFG[$listHeaderCFGCount]));
		switch ($listHeaderFieldCFG[1])
			{
			case "simple":
				$p_config[$p_config["modulSelect"]."_".$listHeaderFieldCFG[1]]=$p_config[$p_config["modulSelect"]][$listHeaderFieldCFG[2]."Title"];
				break;
			case "order":
				if ($listHeaderFieldCFG[2] != "insertWhen")
					{
					$p_config[$p_config["modulSelect"]."_".$listHeaderFieldCFG[2]."Title"]=orderChange($p_config,$listHeaderFieldCFG[2],$p_config[$p_config["modulSelect"]][$listHeaderFieldCFG[2]."Title"]);
					}
				else
					{
//					if (empty($p_config[$p_config["modulSelect"]][$listHeaderFieldCFG[2]."Title"]))
//						{
						$p_config[$p_config["modulSelect"]."_".$listHeaderFieldCFG[2]."Title"]=orderChange($p_config,$listHeaderFieldCFG[2],$p_config["configShare"]["insertWhenTitle"]);
//						}
					}
				break;
			case "selectName":
				$p_config[$p_config["modulSelect"]."_".$listHeaderFieldCFG[2]."Title"]=orderChange($p_config,$listHeaderFieldCFG[2]."Name",$p_config[$p_config["modulSelect"]][$listHeaderFieldCFG[2]."Title"]);
				break;
			case "icon":
				if (($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2 ||
					$_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 3) && setConfigValue($p_config,"configShare","onlyView") != 1)
					{
					$p_config[$p_config["modulSelect"]."_".$listHeaderFieldCFG[2]."Title"]="<img alt='' src='".$p_config["configShare"]["imageButton"].setConfigValue($p_config,$modulSelect,$listHeaderFieldCFG[2]."Button")."' border='0' title='".setConfigValue($p_config,$p_config["modulSelect"],$listHeaderFieldCFG[2]."Title")."' class='buttonBox'>";
					}
				break;
			}
		}
	$listHeadForm = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##listHeadForm##","##/listHeadForm##");
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
					$listHeadForm = str_replace("<".$viewItemNOW.">","",$listHeadForm);
					$listHeadForm = str_replace("</".$viewItemNOW.">","",$listHeadForm);
					}
				else
					{
					$listHeadForm = ini2CFGParser($listHeadForm,"<".$viewItemNOW.">","</".$viewItemNOW.">");
					}
				next($viewItem);
				}
			}
		}
	$resultHeadHTML = ParseTpl($listHeadForm,$p_config,"");
	return $resultHeadHTML;
	}
?>