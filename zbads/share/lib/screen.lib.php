<?php
function topMenu($p_config)
	{
	$topMenuCFG = iniCFGParser($p_config["configShare"]["iniCFG"],"##topMenuCFG##","##/topMenuCFG##");
	$topMenuItemCFG = explode('<#>',$topMenuCFG);
	$topMenuHTML="";
	for ($topMenuItemCFGCount=0;$topMenuItemCFGCount<count($topMenuItemCFG);$topMenuItemCFGCount++)
		{
		$menuItemActual = trim($topMenuItemCFG[$topMenuItemCFGCount]);
		if ((modulPermission($p_config,$menuItemActual) & ewAllowview) == ewAllowview)
			{
			$topMenuHTML .=  "<div id='menuItemBox'>&nbsp;&nbsp;<img src='".$p_config["configShare"]["imagePath"]."keknyil.png' id='blueArrow' border='0'>&nbsp;";
			$actualAction = setConfigValue($p_config,$menuItemActual,"action");
			if (empty($actualAction))
				{ 
				$topMenuHTML .= "<a title='' href='index.php?modulSelect=".$menuItemActual."&amp;modulAction=list&amp;".$menuItemActual."cmd=resetall' class='topMenuText'>";
				}
			else
				{
				$topMenuHTML .= "<a title='' href='index.php?modulSelect=".$menuItemActual."&amp;modulAction=".$actualAction."&amp;".$menuItemActual."cmd=resetall' class='topMenuText'>";
				}
			$topMenuHTML .= $p_config[$menuItemActual]["title"];
			$topMenuHTML .= "</a></div>";
			$topMenuHTML .= "<div style='clear:both;height: 2px;'></div>";
			}
		}
	return $topMenuHTML;
	}

function loginService($p_config)
	{
	$loginServiceHTML = "";
	if ($_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] < 2)
		{
		/**** Login Try Begin ****/
		$validpwd = False;
		$x_errorText = "";
		$x_fieldFocus = "";
		$userid = "";
		$passwd = "";
		if (@$_POST["login_submit"] <> "")
			{
			if (isset($_POST["loginerrorText"])) $x_errorText = @$_POST["loginerrorText"];
			else $x_errorText = "";
			if (isset($_POST["loginfieldFocus"])) $x_fieldFocus = @$_POST["loginfieldFocus"];
			else $x_fieldFocus = "";
			$validpwd = False;
			// setup variables
			if (isset($_POST["userid"])) $userid = @$_POST["userid"];
			else $userid = "";
			$userid = (get_magic_quotes_gpc()) ? stripslashes($userid) : $userid;	
			if (isset($_POST["passwd"])) $passwd = @$_POST["passwd"];
			else $passwd = "";
			$passwd = (get_magic_quotes_gpc()) ? stripslashes($passwd) : $passwd;
			if (!$validpwd)
				{	
				$rsUser = db_query("SELECT * FROM `users` WHERE `nickname` = '" . $userid . "'", setConfigValue($p_config,"configShare","conn")); // or die(db_error());
				if ($rowUser = db_fetch_array($rsUser))
					{
					if (strtoupper($rowUser["password"]) == strtoupper($passwd))
						{
						if ($rowUser["active"] != 1 || is_null($rowUser["active"]))
							{
							$x_errorText = "Jeleleg le van tiltva!";
							$x_fieldFocus = "userid";
							}
						else
							{
							$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_User"] = $rowUser["nickname"];
						 	$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"] = $rowUser["id"];
						 	$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] = $rowUser["groupsID"];
						 	$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLangID"] = $rowUser["langID"];
							$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status"] = "login";
							$lastLoginSQL = "UPDATE users SET `lastLoginWhen`='".db_actual_datetime()."'";
							$lastLoginSQL .= " WHERE id='".$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"]."'";
						 	db_query($lastLoginSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
							if ($_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"] != 2)
								{
								$usersLogInsertSQL="INSERT INTO userslog (usersID, modul, actionWhen) VALUES ";
								$usersLogInsertSQL .= "('".$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"]."', 'login', '".db_actual_datetime()."')";
							 	db_query($usersLogInsertSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
								}
							$validpwd = True;
							if ($_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"]==2 &&
								$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"]==2)
								{
								backup_db($p_config["configShare"]["databaseServer"],$p_config["configShare"]["databaseUser"],$p_config["configShare"]["databasePassword"],$p_config["configShare"]["databaseSelect"]);
								}
							jumpToPage(setConfigValue($p_config,"configShare","baseModul"));
							}
						}
					else
						{
						$x_errorText = $p_config["configShare"]["passwordBad"];
						$x_fieldFocus = "userid";
						}
					}
				else
					{
					$x_errorText = $p_config["configShare"]["shortnameBad"];
					$x_fieldFocus = "userid";
					}
				db_free_result($rsUser);
				}
			}
		else
			{
			if ($_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_User"] != setConfigValue($p_config,"configShare","guestUser"))
				{
				$rsUser = db_query("SELECT * FROM users WHERE nickname = '".setConfigValue($p_config,"configShare","guestUser")."'", setConfigValue($p_config,"configShare","conn")); //or die(db_error());
				if ($rowUser = db_fetch_array($rsUser))
					{
					$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_User"] = $rowUser["nickname"];
				 	$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"] = $rowUser["id"];
				 	$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] = $rowUser["groupsID"];
				 	$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLangID"] = $rowUser["langID"];
					$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status"] = "login";
					db_free_result($rsUser);
					$validpwd = True;
					jumpToPage(setConfigValue($p_config,"configShare","baseModul"));
					}	
				}	
			}
		if (!$validpwd && setConfigValue($p_config,"configShare","onlyView") != 1 )
			{
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserListType"] = 0;
			}
		} 
	$p_config["x_errorText"]=$x_errorText;
	$p_config["x_fieldFocus"]=$x_fieldFocus;
	return $p_config;
	}

function topLogo($p_config)
	{
	$topLogoHTML .= "<img src='".$p_config["configShare"]["normalImgPath"].$p_config["configShare"]["adminLogo"]."' border=0 name='config_".$p_config["modulSelect"]."' class='buttonBox' title='".setConfigValue($p_config,"config","logoTitle")."'>";
	return $topLogoHTML;	
	}

function topStatus($p_config)
	{
	$topStatusHTML = "";
	if ($p_config["modulSelect"] != "notLogged")
		{
		if (setConfigValue($p_config,"configShare","onlyView") != 1 || $_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] > 1)
			{
			$topStatusHTML .= "<div id='topStatusButton'>";
			if ($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2 
				AND $p_config["modulAction"] == "list")
				{	
				$topStatusHTML .= "<a title='' href='index.php?modulSelect=".setConfigValue($p_config,"config","name")."&amp;modulAction=list&amp;".setConfigValue($p_config,"config","name")."cmd=resetall&amp;whichModul=".$p_config["modulSelect"]."'>";
				$topStatusHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton").setConfigValue($p_config,"config","icon")."' border=0 name='config_".$p_config["modulSelect"]."' class='buttonBox' title='".setConfigValue($p_config,"config","title")."'>";
				$topStatusHTML .= "</a>";
				}
			$topStatusHTML .= "</div>";
			$topStatusHTML .= "<div id='topStatusText'>";
			$topStatusHTML .= $p_config[$p_config["modulSelect"]]["title"];
			if ($p_config["modulAction"] != "list")
				{
				$topStatusHTML .= "&nbsp;=>&nbsp;".setConfigValue($p_config,$p_config["modulSelect"],$p_config["modulAction"]."Title");
				}
			$topStatusHTML .= "</div>";
			$topStatusHTML .= "<div id='topServiceTextBox'>";
			if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] == 2 ||
				@$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] == 3)
				{
				if ($p_config["modulSelect"]=="modullng")
					{
					$topStatusHTML .= "<div id='topServiceText'>".$p_config["configShare"]["modulIDTitle"].":</div><div id='topServiceSelectText'>".filterSelect($p_config,"modul",$p_itemValues,1)."</div>";
					}
//				$topStatusHTML .= "<div id='topServiceText'>".$p_config["configShare"]["langIDTitle"].":</div><div id='topServiceSelectText'>".filterSelect($p_config,"lang",$p_itemValues,1)."</div>";
				$topStatusHTML .= "<div id='topServiceText'>".$p_config["configShare"]["siteIDTitle"].":</div><div id='topServiceSelectText'>".filterSelect($p_config,"site",$p_itemValues,1)."</div>";
				}
		        $topStatusHTML .= "</div>";
			}
		}
	return $topStatusHTML;	
	}

function topAdmin($p_config)
	{
	$serviceMenuHTML = "";
	if ($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] > 1)
		{ 
		$topServiceCFG = iniCFGParser($p_config["configShare"]["iniCFG"],"##serviceMenuCFG##","##/serviceMenuCFG##");
		$isModulHTML = "";
		$serviceMenuHTMLStart = "<div id='adminBox'><div id='adminButton'>";
		$serviceMenuParamDIM = explode('<#>',$topServiceCFG);
		for ($serviceMenuCount=0;$serviceMenuCount<count($serviceMenuParamDIM);$serviceMenuCount++)
			{
			$serviceMenuFieldDIM = explode('#',rtrim(ltrim($serviceMenuParamDIM[$serviceMenuCount])));
			if (isModulView($p_config,$serviceMenuFieldDIM[0]))
				{
				if ($serviceMenuFieldDIM[0]=="users" && !isModulAdmin($p_config,$serviceMenuFieldDIM[0]))
					{
					continue;
					}
				if ($serviceMenuFieldDIM[0]=="site" && !isModulAdmin($p_config,$serviceMenuFieldDIM[0]))
					{
					continue;
					}
//				if ($serviceMenuFieldDIM[0]=="groups" && !isModulAdmin($p_config,$serviceMenuFieldDIM[0]))
//					{
//					continue;
//					}
//				if ($serviceMenuFieldDIM[0]=="rights" && !isModulAdmin($p_config,$serviceMenuFieldDIM[0]))
//					{
//					continue;
//					}
//				if ($serviceMenuFieldDIM[0]=="modul" && !isModulAdmin($p_config,$serviceMenuFieldDIM[0]))
//					{
//					continue;
//					}
				if ($serviceMenuFieldDIM[0]!="config" && $serviceMenuFieldDIM[0]!="modullng")
					{
					$serviceMenuHTML .= "<a title='' href='index.php?modulSelect=".setConfigValue($p_config,$serviceMenuFieldDIM[0],"name")."&amp;modulAction=list&amp;".setConfigValue($p_config,$serviceMenuFieldDIM[0],"name")."cmd=resetall'>";
					}
				else
					{
					$serviceMenuHTML .= "<a title='' href='index.php?modulSelect=".setConfigValue($p_config,$serviceMenuFieldDIM[0],"name")."&amp;modulAction=list&amp;".setConfigValue($p_config,$serviceMenuFieldDIM[0],"name")."cmd=resetall&amp;calltype=all'>";
					}
				$serviceMenuHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton").setConfigValue($p_config,$serviceMenuFieldDIM[0],"icon")."' border=0 name='".$serviceMenuFieldDIM[0]."' class='buttonBox' title='".setConfigValue($p_config,$serviceMenuFieldDIM[0],"title")."'>";
				$serviceMenuHTML .= "</a>";
				}
			}
		if (!empty($serviceMenuHTML))
			{
			$serviceMenuHTML = $serviceMenuHTMLStart.$serviceMenuHTML;
			$serviceMenuHTML .= "</div></div>";
			}
		}
	return $serviceMenuHTML;	
	}

function topSearch($p_config)
	{
	$topSearchHTML .= "<div id='searchBox'><form action='index.php?modulAction=list' method='post' name='listsrch'>";
	$topSearchHTML .= "<div id='searchTitle'>";
	$topSearchHTML .= "<b>&nbsp;&nbsp;".setConfigValue($p_config,$p_config["modulSelect"],"searchOnTitle")."</b>";
	$topSearchHTML .= "&nbsp;&nbsp;<input type='text' name='".$p_config["modulSelect"]."psearch' value='".stripcslashes($p_config[$p_config["modulSelect"]]["pSearchOriginal"])."' size='22' maxlength='100'>&nbsp;&nbsp;</div>";
	$topSearchHTML .= "<div id='searchButton'><input type='submit' name='submitSearch' value='' class='srch' title='".setConfigValue($p_config,$p_config["modulSelect"],"searchTitle")."' class='buttonBox'></div>";
	if ((!empty($p_config[$p_config["modulSelect"]]["sqlfilter"]) && $p_config["sqlfilter"] <> "ALL") || !empty($p_config[$p_config["modulSelect"]]["searchWhere"]))
		{
		$topSearchHTML .= "<div id='searchButton'>";
		$topSearchHTML .= "<a title='' href='index.php?modulAction=" . $p_config["modulAction"] . "&amp;".$p_config["modulSelect"]."cmd=RESETALL'>";
		$topSearchHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . "srchoff.png' border='0' title='".setConfigValue($p_config,$p_config["modulSelect"],"searchOffTitle")."' name='all' class='buttonBox'>";
		$topSearchHTML .= "</a>";
		$topSearchHTML .= "</div>";
		}
	$topSearchHTML .= "</form>";
	$topSearchHTML .= "</div>";
	return $topSearchHTML;	
	}

function topErrorMessage($p_config)
	{
	$topErrorMessageHTML = "";
	if (isset($p_config["x_errorText"]) && $p_config["x_errorText"] != "")
		{
		$topErrorMessageHTML .= '<div id="errorMessageBox">';
		$topErrorMessageHTML .= '<div id="errorMessageText">';
		$topErrorMessageHTML .= $p_config["x_errorText"];
		$topErrorMessageHTML .= "</div>";
		$topErrorMessageHTML .= "</div>";
		}
	return $topErrorMessageHTML;	
	}

function activeItem($p_config,$p_itemValues,$whichField,$yes_tooltip,$no_tooltip)
	{
	if ($p_itemValues[$whichField]) 
		{
		$result .= "<img alt='' src='".setConfigValue($p_config,"configShare","imageButton")."pipa.png' border='0' title='".$yes_tooltip."' class='buttonBox'>";
		}
	else
		{
		$result .= "<img alt='' src='".setConfigValue($p_config,"configShare","imageButton")."x.png' border='0' title='".$no_tooltip."' class='buttonBox'>";
		}
	return $result;
	}

function activateTd($p_itemValues,$whichField,$viewField)
	{
	if ($p_itemValues[$whichField]) 
		{
		$activatetd .= " CHECKED value='true'";
		}
	else
		{
		$activatetd .= " value='false'";
		}
	if (!empty($viewField))
		{
		$activatetd .= " DISABLED";
		}
	return $activatetd;
	}

function changeYesNo($p_config, $p_itemValues,$which_permission,$x_which_field,$yes_tooltip,$no_tooltip)
	{
	$back_text = "";
	if (($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2 ||
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 3) && setConfigValue($p_config,"configShare","onlyView") != 1)
		{
		if ($x_which_field=='') $x_which_field=0;
		if (isModulAdd($p_config,$p_config["modulSelect"]) || isModulEdit($p_config,$p_config["modulSelect"])) 
			{ 
			$back_text .= "<a title='' href='index.php?modulTable=";
			$modulTable = setConfigValue($p_config,$p_config["modulSelect"],"mainTable");
			if (!empty($modulTable)) $back_text .= setConfigValue($p_config,$p_config["modulSelect"],"mainTable");
			else $back_text .= $p_config["modulSelect"];
			$back_text .= "&amp;changeYesNo=".$which_permission."&amp;actPermission=".$x_which_field."&amp;key_record=" . urlencode($p_itemValues["x_id"]) . "'>";
			}
		if (!is_null($x_which_field) && $x_which_field <> 0) 
			{
			$back_text .= "<img alt='' src='".setConfigValue($p_config,"configShare","imageButton")."pipa.png' border='0' title='".$yes_tooltip."' class='buttonBox'>";
			}
		else
			{
			$back_text .= "<img alt='' src='".setConfigValue($p_config,"configShare","imageButton")."x.png' border='0' title='".$no_tooltip."' class='buttonBox'>";
			}
		if (isModulAdd($p_config,$p_config["modulSelect"]) || isModulEdit($p_config,$p_config["modulSelect"])) 
			{ 
			$back_text .= "</a>";
			}
		}
	else if ($which_permission != "active")
		{
		if (!is_null($x_which_field) && $x_which_field <> 0) 
			{
			$back_text .= "<img alt='' src='".setConfigValue($p_config,"configShare","imageButton")."pipa.png' border='0' title='".$yes_tooltip."'>";
			}
		else
			{
			$back_text .= "<img alt='' src='".setConfigValue($p_config,"configShare","imageButton")."x.png' border='0' title='".$no_tooltip."'>";
			}
		}
	return $back_text;
	}

function changeYesNoReally($p_config,$p_modulSelect)
	{
	if (isset($_GET["changeYesNo"])) $x_changeYesNo = $_GET["changeYesNo"];
	else $x_changeYesNo = "";
	if (isset($_GET["modulTable"])) $x_modulTable = $_GET["modulTable"];
	else $x_modulTable = $p_config["modulSelect"];
	if (!empty($x_changeYesNo) && $x_changeYesNo <>"allowview" && $x_changeYesNo <>"allowadd"
		 && $x_changeYesNo <>"allowedit" && $x_changeYesNo <>"allowdelete" && $x_changeYesNo <>"allowadmin")
		{
		$w_actual_datetime = "'".db_actual_datetime()."'";
		$x_key_record = $_GET["key_record"];
		$x_actPermission = intval($_GET["actPermission"]);
		if ($x_actPermission != 1)
			{
			$x_newPermission = 1;
			}
		else
			{
			$x_newPermission = 0;
			}
		if ($p_modulSelect == "recruiter")
			{
			if ($x_newPermission == 0)
				{
				$p_config = recruiterSend($x_key_record, $p_config);
				$updateSQL = "UPDATE " . $x_modulTable . " SET ";
				$updateSQL .= "modifyUserID = ".@$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"]. ",";
				$updateSQL .= "modifyWhen = ".$w_actual_datetime.",";			
				$updateSQL .= $x_changeYesNo."=".$x_newPermission.",";			
				$updateSQL .= "emailSend = ".$w_actual_datetime;			
				$updateSQL .= " WHERE id= '".$x_key_record."'";
				$updateRs = db_query($updateSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
				}
			}
		else
			{
			$updateSQL = "UPDATE " . $x_modulTable . " SET ";
			$updateSQL .= "modifyUserID = ".@$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"]. ",";			
			$updateSQL .= "modifyWhen = ".$w_actual_datetime.",";			
			$updateSQL .= $x_changeYesNo."=".$x_newPermission;			
			$updateSQL .= " WHERE id= '".$x_key_record."'";
			$updateRs = db_query($updateSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
			}
		}
	}

function footerNavigation($p_config)
	{
	$footerNavigationHTML = "";
	if (ISSET($_GET["whichModul"]) || ISSET($_POST["x_whichModul"]))  $popupBack =  "onclick='parent.popupCodeClose(); return false;'"; else $popupBack = "";
	if (!empty($p_config["modulAction"]))
		{
		$footerNavigationHTML .= "<div style='clear:both;height: 10px;'></div>
		<div id='footerNavigation'>";
		if ($p_config["modulAction"]=="pictureEdit")
			{
			$footerNavigationHTML .= "<input type='submit' name='Action' value='".$p_config["configShare"]["saveTitle"]."'>";
			$footerNavigationHTML .= "<input type='submit' name='Action' value='".$p_config["configShare"]["saveNoBackTitle"]."'>";
			}
		else if ($p_config["modulAction"]!="view" && $p_config["modulAction"]!="delete")
			{
			$footerNavigationHTML .= "<input type='submit' name='Action' value='".$p_config["configShare"]["saveTitle"]."'>";
			if (!(ISSET($_GET["whichModul"]) || ISSET($_POST["x_whichModul"])))
				{
				$footerNavigationHTML .= "<input type='submit' name='Action' value='".$p_config["configShare"]["saveNoBackTitle"]."'>";
				}
			}
		else if ($p_config["modulAction"]=="delete")
			{
			$footerNavigationHTML .= "<input type='submit' name='Action' value='".$p_config["configShare"]["deleteTitle"]."'>";
			}
		else
			{
//			$footerNavigationHTML .= "<td align='center'>&nbsp;</td>";
			}			
		if (!empty($p_config[$p_config["modulSelect"]]["whichBack"]))
			{
//			$footerNavigationHTML .= "<input type='submit' name='Action' value='".$p_config["configShare"]["backTitle"]."'>";
			$footerNavigationHTML .= "<input type='submit' name='Action' value='".$p_config["configShare"]["backTitle"]."' ".$popupBack.">";
			}
		$footerNavigationHTML .= "</div>";
		$footerNavigationHTML .= "<div style='clear:both;height: 1px;'></div>";
		}
	return $footerNavigationHTML;
	}

function subMenu($p_config, $p_itemValues, $p_modulMenu)
	{
	$subMenuHTML = "";
	if (!isset($p_config["plus_param"])) $p_config["plus_param"] = "";
	if (isModulView($p_config,$p_config["modulSelect"])) 
		{ 
		if (!isset($p_config[$p_config["modulSelect"]]["noView"]) || !$p_config[$p_config["modulSelect"]]["noView"])
			{
			if (($p_itemValues["x_id"] != NULL))
				{
				$subMenuHTML .= "<a title='' href='index.php?modulSelect=".$p_modulMenu."&amp;modulAction=view&amp;key=" . urlencode($p_itemValues["x_id"]) . $p_config["plus_param"]."'>";
				}
			else
				{
				$subMenuHTML .= "<a title='' href=\"" . "javascript:alert('Invalid Record! Key is null');" . "\">";
				}
			if ($p_config[$p_config["modulSelect"]]["is_newitemcount"] == 1  && is_null($p_itemValues["x_isReadUserID"]) &&
				($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2 || $_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 3))
				{
				$subMenuHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"viewButton") ."' border='0' name='view' title='".setConfigValue($p_config,$p_config["modulSelect"],"viewTitle")."' class='buttonBox'></a>";
				}
			else
				{
				$subMenuHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"viewButton") ."' border='0' name='view' title='".setConfigValue($p_config,$p_config["modulSelect"],"viewTitle")."' class='buttonBox'></a>";
				}
			}

		else
			{
//			$subMenuHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"noButton")."' border='0'>";
			}
		}
	if (isModulAdd($p_config,$p_config["modulSelect"]) && setConfigValue($p_config,"configShare","onlyView") != 1  &&
//		($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2 || $_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 3))
		($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] > 1))
		{ 
		if (!isset($p_config[$p_config["modulSelect"]]["noCopy"]) || $p_config[$p_config["modulSelect"]]["noCopy"]!=1)
			{
			if (($p_itemValues["x_id"] != NULL))
				{
				$subMenuHTML .= "<a title='' href='index.php?modulSelect=".$p_modulMenu."&amp;modulAction=add&amp;key=" . urlencode($p_itemValues["x_id"]) . $p_config["plus_param"]."'>";
				}
			else
				{
				$subMenuHTML .= "<a title='' href=\"" . "javascript:alert('Invalid Record! Key is null');" . "\">";
				}
			$subMenuHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"copyButton")."' border='0' name='copy' title='".setConfigValue($p_config,$p_config["modulSelect"],"copyTitle")."' class='buttonBox'></a>";
			}
		else
			{
//			$subMenuHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"noButton")."' border='0'>";
			}
		} 
	if (isModulEdit($p_config,$p_config["modulSelect"]) && setConfigValue($p_config,"configShare","onlyView") != 1) 
		{ 
		if (!isset($p_config[$p_config["modulSelect"]]["noEdit"]) || !$p_config[$p_config["modulSelect"]]["noEdit"])
			{
			if (($p_itemValues["x_id"] != NULL))
				{
				$subMenuHTML .= "<a title='' href='index.php?modulSelect=".$p_modulMenu."&amp;modulAction=edit&amp;key=" . urlencode($p_itemValues["x_id"]) . $p_config["plus_param"]."'>";
				}
			else
				{
				$subMenuHTML .= "<a title='' href=\"" . "javascript:alert('Invalid Record! Key is null');" . "\">";
				}
			$subMenuHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"editButton")."' border='0' name='edit' title='".setConfigValue($p_config,$p_config["modulSelect"],"editTitle")."' class='buttonBox'></a>";
			}

		else
			{
//			$subMenuHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"noButton")."' border='0'>";
			}
		}
	if (isModulDelete($p_config,$p_config["modulSelect"]) && setConfigValue($p_config,"configShare","onlyView") != 1) 
		{ 
		if (!isset($p_config[$p_config["modulSelect"]]["noDelete"]) || !$p_config[$p_config["modulSelect"]]["noDelete"])
			{
			if (($p_itemValues["x_id"] != NULL))
				{
				$subMenuHTML .= "<a title='' href='index.php?modulSelect=".$p_modulMenu."&amp;modulAction=delete&amp;key=" . urlencode($p_itemValues["x_id"]) . $p_config["plus_param"]."'>";
				}
			else
				{
				$subMenuHTML .= "<a title='' href=\"" . "javascript:alert('Invalid Record! Key is null');" . "\">";
				}
			$subMenuHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"deleteButton")."' border='0' name='delete' title='".setConfigValue($p_config,$p_config["modulSelect"],"deleteTitle")."' class='buttonBox'></a>";
			}
		else
			{
//			$subMenuHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"noButton")."' border='0'>";
			}

		} 
	return $subMenuHTML;
	}

function navigationNew($p_config,$p_modulMenu)
	{
	$p_config["sharedNavigation"]="";
	if ($p_config[$p_config["modulSelect"]]["totalRecs"] > 0)
		{
		$p_config[$p_config["modulSelect"]]["rsEof"] = ($p_config[$p_config["modulSelect"]]["totalRecs"] < ($p_config[$p_config["modulSelect"]]["startRec"] + $p_config[$p_config["modulSelect"]]["displayRecs"]));
		$p_config[$p_config["modulSelect"]]["PrevStart"] = $p_config[$p_config["modulSelect"]]["startRec"] - $p_config[$p_config["modulSelect"]]["displayRecs"];
		if ($p_config[$p_config["modulSelect"]]["PrevStart"] < 1) $p_config[$p_config["modulSelect"]]["PrevStart"] = 1;
		$p_config[$p_config["modulSelect"]]["NextStart"] = $p_config[$p_config["modulSelect"]]["startRec"] + $p_config[$p_config["modulSelect"]]["displayRecs"];
		if ($p_config[$p_config["modulSelect"]]["NextStart"] > $p_config[$p_config["modulSelect"]]["totalRecs"] ) $p_config[$p_config["modulSelect"]]["NextStart"] = $p_config[$p_config["modulSelect"]]["startRec"];
		$p_config[$p_config["modulSelect"]]["LastStart"] = intval(($p_config[$p_config["modulSelect"]]["totalRecs"]-1)/$p_config[$p_config["modulSelect"]]["displayRecs"])*$p_config[$p_config["modulSelect"]]["displayRecs"]+1;
		if ($p_config[$p_config["modulSelect"]]["startRec"] > $p_config[$p_config["modulSelect"]]["totalRecs"])
			{
			$p_config[$p_config["modulSelect"]]["startRec"]=$p_config[$p_config["modulSelect"]]["totalRecs"];
			}
		else
			{
			}
		$p_config[$p_config["modulSelect"]]["stopRec"] = $p_config[$p_config["modulSelect"]]["startRec"] + $p_config[$p_config["modulSelect"]]["displayRecs"] - 1;
		$p_config[$p_config["modulSelect"]]["recCount"] = $p_config[$p_config["modulSelect"]]["totalRecs"] - 1;
		if ($p_config[$p_config["modulSelect"]]["rsEof"])
			{
			$p_config[$p_config["modulSelect"]]["recCount"]=$p_config[$p_config["modulSelect"]]["totalRecs"];
			}
		if ($p_config[$p_config["modulSelect"]]["stopRec"] > $p_config[$p_config["modulSelect"]]["recCount"])
			{
			$p_config[$p_config["modulSelect"]]["stopRec"] = $p_config[$p_config["modulSelect"]]["recCount"];
			}
		$p_config["sharedNavigation"] .= "<span class='navigationText'>".$p_config["configShare"]["item"]." <b>" . $p_config[$p_config["modulSelect"]]["startRec"] . " - " . $p_config[$p_config["modulSelect"]]["stopRec"] . " / " . $p_config[$p_config["modulSelect"]]["totalRecs"] . "</b> </span>";
		$p_config["sharedNavigation"] .= "<span class='navigationText'>".$p_config["configShare"]["page"]."&nbsp;</span>";
		// first page button
		if ($p_config[$p_config["modulSelect"]]["startRec"] == 1)
			{
			$p_config["sharedNavigation"] .= "<img src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"noButton")."' border='0' class='buttonBox'>";
			}
		else
			{
			$p_config["sharedNavigation"] .= "<a href='index.php?".$p_config["modulSelect"]."start=1'><img src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"firstButton")."' border=0 name='first' class='buttonBox' title='".setConfigValue($p_config,$p_config["modulSelect"],"firstTitle")."'></a>";
			}
		// previous page button
		if ($p_config[$p_config["modulSelect"]]["PrevStart"] == $p_config[$p_config["modulSelect"]]["startRec"])
			{
			$p_config["sharedNavigation"] .= "<img src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"noButton")."' border='0' class='buttonBox'>";
			}
		else
			{
			$p_config["sharedNavigation"] .= "<a href='index.php?".$p_config["modulSelect"]."start=" . $p_config[$p_config["modulSelect"]]["PrevStart"] . "'><img src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"prevButton")."' border=0 name='backward' class='buttonBox' title='".setConfigValue($p_config,$p_config["modulSelect"],"prevTitle")."'></a>";
			}
		// current page number
		$p_config["sharedNavigation"] .= "<span class='navigationText'><input type='text' name='".$p_config["modulSelect"]."pageno' value='";
		$p_config["sharedNavigation"] .= intval(($p_config[$p_config["modulSelect"]]["startRec"]-1)/$p_config[$p_config["modulSelect"]]["displayRecs"])+1;
		$p_config["sharedNavigation"] .= "' size='4' style='text-align:right'></span>";
		$p_config["sharedNavigation"] .= "<span class='navigationText'>/<b>";
		$p_config["sharedNavigation"] .= intval(($p_config[$p_config["modulSelect"]]["totalRecs"]-1)/$p_config[$p_config["modulSelect"]]["displayRecs"])+1;
		$p_config["sharedNavigation"] .= "</b>&nbsp;</span>";
		// next page button
		if ($p_config[$p_config["modulSelect"]]["NextStart"] == $p_config[$p_config["modulSelect"]]["startRec"])
			{
			$p_config["sharedNavigation"] .= "<img src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"noButton")."' border='0' class='buttonBox'>";
			}
		else
			{
			$p_config["sharedNavigation"] .= "<a href='index.php?".$p_config["modulSelect"]."start=" . $p_config[$p_config["modulSelect"]]["NextStart"] . "'><img src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"nextButton")."' border=0 name='forward' class='buttonBox' title='".setConfigValue($p_config,$p_config["modulSelect"],"nextTitle")."'></a>";
			}
		// last page button 
		if ($p_config[$p_config["modulSelect"]]["LastStart"] == $p_config[$p_config["modulSelect"]]["startRec"])
			{
			$p_config["sharedNavigation"] .= "<img src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"noButton")."' border='0' class='buttonBox'>";
			}
		else
			{
			$p_config["sharedNavigation"] .= "<a href='index.php?".$p_config["modulSelect"]."start=" . $p_config[$p_config["modulSelect"]]["LastStart"] . "'><img src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"lastButton")."' border=0 name='last' class='buttonBox' title='".setConfigValue($p_config,$p_config["modulSelect"],"lastTitle")."'></a>";
			}
		if (isModulAdd($p_config,$p_config["modulSelect"]))
			{
			if ((!isset($p_config[$p_config["modulSelect"]]["noAdd"]) || !$p_config[$p_config["modulSelect"]]["noAdd"]) && (!isset($GLOBALS["treeAdmin"]) || !$GLOBALS["treeAdmin"]))
				{
				$p_config["sharedNavigationAdd"] .= "<input name='addSubmit' id='addSubmit' type='submit' value='".$p_config["configShare"]["addTitle"]."'>";
				}
			}
		if ($p_config["modulSelect"] == "config" && isset($p_config[$p_config[$p_config["modulSelect"]]["whichBack"]]["configBack"]))
			{
			$p_config[$p_config["modulSelect"]]["whichBack"]=$p_config[$p_config[$p_config["modulSelect"]]["whichBack"]]["configBack"];
			}
		if (setConfigValue($p_config,$p_config["modulSelect"],"whichBack")!='')
			{
			$p_config["sharedNavigation"] .= "<a href='index.php?modulSelect=" . setConfigValue($p_config,$p_config["modulSelect"],"whichBack") . "&modulAction=list'><img src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"backButton")."' border=0 name='back' class='buttonBox' title='".setConfigValue($p_config,$p_config["modulSelect"],"backTitle")."'></a>";
			}
		}
	else
		{
		$p_config["sharedNavigation"] .= "<span class='navigationTextError'>";
		if (isModulList($p_config,$p_config["modulSelect"]))
			{
			$p_config["sharedNavigation"] .= $p_config["configShare"]["noRecordTitle"];

			}
		else
			{
			$p_config["sharedNavigation"] .= $p_config["configShare"]["noRightsTitle"];
			}
		$p_config["sharedNavigation"] .= "</span>";
		if (isModulAdd($p_config,$p_config["modulSelect"]))
			{
			if (!isset($p_config[$p_config["modulSelect"]]["noAdd"]) || !$p_config[$p_config["modulSelect"]]["noAdd"])
				{
				$p_config["sharedNavigationAdd"] .= "<input name='addSubmit' id='addSubmit' type='submit' value='".$p_config["configShare"]["addTitle"]."'>";
				}
			}
		if ($p_config["modulSelect"] == "config" && isset($p_config[$p_config[$p_config["modulSelect"]]["whichBack"]]["configBack"]))
			{
			$p_config[$p_config["modulSelect"]]["whichBack"]=$p_config[$p_config[$p_config["modulSelect"]]["whichBack"]]["configBack"];
			}
		if (setConfigValue($p_config,$p_config["modulSelect"],"whichBack")!='')
			{
			$p_config["sharedNavigation"] .= "<a href='index.php?modulSelect=" . setConfigValue($p_config,$p_config["modulSelect"],"whichBack") . "&modulAction=list'><img src='" . setConfigValue($p_config,"configShare","imageButton") . setConfigValue($p_config,$p_config["modulSelect"],"backButton")."' border=0 name='back' class='buttonBox' title='".setConfigValue($p_config,$p_config["modulSelect"],"backTitle")."'></a>";
			}
		}
	if (setConfigValue($p_config,$p_config["modulSelect"],"noNavigationDefault")==0)
		{
		$p_config["navigationHTML"]=$p_config["sharedNavigation"];
		$p_config["navigationAddHTML"]=$p_config["sharedNavigationAdd"];
		}
	return $p_config;
	}

function orderChange($p_config,$which_field, $orderTitle)
	{
	$actualOrder = setConfigValue($p_config,$p_config["modulSelect"],$which_field);
	if (ISSET($actualOrder))
		{
		$order_box .= $orderTitle."&nbsp;";
		$really_order = str_replace("Title","",$which_field);
		$order_box .="<a title='' href='index.php?modulAction=list&amp;".$p_config["modulSelect"]."order=" . urlencode($really_order) . "'>";
		$order_box .= "<img alt='".setConfigValue($p_config,"configShare","orderTitle")."' src='";
		if ($p_config[$p_config["modulSelect"]]["OrderBy"] == $really_order) 
			{ 
		 	if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OT"] == "ASC") 
				{
				$order_box .= setConfigValue($p_config,"configShare","imageButton") . "asc.png";
				}
			else if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OT"] == "DESC") 
				{
				$order_box .= setConfigValue($p_config,"configShare","imageButton") . "desc.png";
				}
			else
				{
				$order_box .= setConfigValue($p_config,"configShare","imageButton") . "nosort.png";
				}
			}
		else
			{
			$order_box .= setConfigValue($p_config,"configShare","imageButton") . "nosort.png";
			}
		$order_box .= "' title='".setConfigValue($p_config,"configShare","orderTitle")."' border='0' width='16' height='16'>";
		$order_box .= "</a>";
		}
	else
		{
		$order_box = NULL;
		}
	return $order_box;
	}

function tplUp($name,$p_config,$p_tplPATH)
	{
	$addDir=$p_tplPATH;
	$ext='html';
	if (file_exists($addDir."{$name}.{$ext}"))
		{ 
		$tpl='';
		$cont=file($addDir.$name.'.'.$ext);
		while(list($line_num,$line)=each($cont)) $tpl.=$line;
		return $tpl;
		}
	else die ("TPL NEM TALÁLTAM: $name");
	}

function ParseTplFORM($tpl,$p_config,$p_itemValues)
	{
	$ex=explode ('##START##',$tpl);
	for ($i=0; $i<sizeof($ex); $i++)
		{
		if (substr_count($ex[$i],'##STOP##')>0)
			{
			$xxpdfParseTpl=explode('##STOP##',$ex[$i]);
			$funParam = explode('#',$xxpdfParseTpl[0]);
			switch($funParam[0])
				{
				case "title":
					/*
					##Start##title#modul#field##Stop##
					example: 
					##Start##title#usertitle#nameTitle##Stop##
					*/
					if (isset($p_config[$funParam[1]][$funParam[2]]))
						{
						$to=$p_config[$funParam[1]][$funParam[2]];
						}
					else
						{
						$to=$p_config["configShare"][$funParam[2]];
						}
					break;
				case "textarea":
					/*
					##Start##textarea#field#cols#rows##Stop##
					example:
					##Start##textarea#x_name#60#10##Stop##
					*/
					$to='<textarea name="'.$funParam[1].'" cols="'.$funParam[2].'" rows="'.$funParam[3].'" style="width:'.$funParam[4].';height:'.$funParam[5].'">'.$p_itemValues[$funParam[1]].'</textarea>';
					$to.=$p_config["configShare"][str_replace("x_","e_",$funParam[1])."Err"];
					break;
				case "text":
					/*
					##Start##text#field#size#maxlength##Stop##
					example:
					##Start##text#x_name#63#100##Stop##
					*/
					$to='<input type="text" name="'.$funParam[1].'" size="'.$funParam[2].'" maxlength="'.$funParam[3].'" value="'.$p_itemValues[$funParam[1]].'">';
					$to.=$p_config["configShare"][str_replace("x_","e_",$funParam[1])."Err"];
					break;
				case "editorText":
					/*
					##Start##editorText#field#style#jcol#jrow##Stop##
					example:
					##Start##editorText#x_description#height: 170px; width: 500px;border: 1px solid #999999;#700#200##Stop##
					*/
					$to='<textarea id="x_description" name="x_description" style="height: 170px; width: 500px;border: 1px solid #999999;">'.htmlspecialchars($p_itemValues[$funParam[1]]).'</textarea><script language="javascript1.2" type="text/javascript">generate_wysiwyg(\'x_description\',700,200);</script>';
					break;
				case "selectOption":
					/*
					##Start##selectOption#table#pleaseSelect#admin##Stop##
					example:
					##Start##selectOption#site#1#0##Stop##
					*/
					$to=selectOption($p_config,$funParam[1],$p_itemValues,$funParam[2],$funParam[3]);
					break;
				case "itemValues":
					$to=$p_itemValues[$funParam[1]];
					break;
				case "config":
					/*
					##Start##selectOption#table#pleaseSelect#admin##Stop##
					example:
					##Start##selectOption#site#1#0##Stop##
					*/
					{
					$configSize = sizeof($funParam);
					switch ($configSize)
						{
						case 2:
							$to=$p_config[$funParam[1]];
							break;
						case 3:
							$to=$p_config[$funParam[1]][$funParam[2]];
							break;
						default:
							break;
						}
					}
					break;
				case "configPrice":
					/*
					##Start##selectOption#table#pleaseSelect#admin##Stop##
					example:
					##Start##selectOption#site#1#0##Stop##
					*/
					{
					$configSize = sizeof($funParam);
					switch ($configSize)
						{
						case 2:
							$to=number_format(intval($p_config[$funParam[1]]),0,',','.');
							break;
						case 3:
							$to=number_format($p_config[$funParam[1]][$funParam[2]],0,',','.');
							break;
						default:
							break;
						}
					}
					break;
				case "captcha":
					/*
					##Start##text#field#size#maxlength##Stop##
					example:
					##Start##captcha#x_name#8#8##Stop##
					*/
					$to = '<img src="/normal/111hosting/inc/capimg.php?width=100&height=40&characters=5">';
					break;
				}
			$tpl=str_replace('##START##'.$xxpdfParseTpl[0].'##STOP##', $to, $tpl);
			}
		}
	return $tpl;
	}

function ParseTpl($tpl,$p_config)
	{
	$qs=array();
	$qv=array();
	$ex=explode ('{$',$tpl);
	for ($i=0; $i<sizeof($ex); $i++)
		{
		if (substr_count($ex[$i],'}')>0)
			{
			$xxpdfParseTpl=explode('}',$ex[$i]);
			if (substr_count($xxpdfParseTpl[0],'[')>0)
				{
				$clrpdfParseTpl=explode ('[',$xxpdfParseTpl[0]); 
				$sppdfParseTpl=str_replace('$','',substr($clrpdfParseTpl[1],0,strlen($clrpdfParseTpl[1])-1)); 
				$to=$p_config[$sppdfParseTpl];
				}
			$tpl=str_replace('{$'.$xxpdfParseTpl[0].'}', $to, $tpl);
			}
		}
	return $tpl;
	}

function header1($p_config)
	{
	if ($p_config["configShare"]["whichSystemMode"]=="admin")
		{
		$p_config["pageStartHTML"] .= '<LINK REL="stylesheet" HREF="'.$p_config["configShare"]["cssFileName"].'" TYPE="text/css">';
		}
	$javascriptCFG = iniCFGParser($p_config["configShare"]["iniCFG"],"##cssCFG##","##/cssCFG##");
	$javascriptItemCFG = explode('<#>',$javascriptCFG);
	$javascriptHTML="";
	for ($javascriptItemCFGCount=0;$javascriptItemCFGCount<count($javascriptItemCFG);$javascriptItemCFGCount++)
		{
		if (!empty($javascriptItemCFG[$javascriptItemCFGCount]))
			{
			$p_config["pageStartHTML"] .= "<script language=\"JavaScript\" type=\"text/javascript\" src=\"" . setConfigValue($p_config,"configShare","sharePath") . "js/".$javascriptItemCFG[$javascriptItemCFGCount].".js\"></script>";
			}
		}
	$javascriptCFG = iniCFGParser($p_config["configShare"]["iniCFG"],"##javascriptCFG##","##/javascriptCFG##");
	$javascriptItemCFG = explode('<#>',$javascriptCFG);
	$javascriptHTML="";
	for ($javascriptItemCFGCount=0;$javascriptItemCFGCount<count($javascriptItemCFG);$javascriptItemCFGCount++)
		{
		if (!empty($javascriptItemCFG[$javascriptItemCFGCount]))
			{
			$p_config["pageStartHTML"] .= "<script language=\"JavaScript\" type=\"text/javascript\" src=\"" . setConfigValue($p_config,"configShare","sharePath") . "js/".$javascriptItemCFG[$javascriptItemCFGCount].".js\"></script>";
			}
		}
	$javascriptCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##javascriptCFG##","##/javascriptCFG##");
	$javascriptItemCFG = explode('<#>',$javascriptCFG);
	$javascriptHTML="";
	for ($javascriptItemCFGCount=0;$javascriptItemCFGCount<count($javascriptItemCFG);$javascriptItemCFGCount++)
		{
		if (!empty($javascriptItemCFG[$javascriptItemCFGCount]))
			{
			$p_config["pageStartHTML"] .= "<script language=\"JavaScript\" type=\"text/javascript\" src=\"" . setConfigValue($p_config,"configShare","sharePath") . "js/".$javascriptItemCFG[$javascriptItemCFGCount].".js\"></script>";
			}
		}
	if ($p_config["modulAction"]=="add" || $p_config["modulAction"]=="edit")
		{
		}

	$p_config["topLogoHTML"] = topLogo($p_config);
	$p_config["topMenuHTML"] = topMenu($p_config);
	$p_config = loginService($p_config);
	$p_config["topAdminHTML"] = topAdmin($p_config);
	$p_config["topSearchHTML"] = topSearch($p_config);
	$p_config["topStatusHTML"] = topStatus($p_config);
	$p_config["systemTitle"] = $p_config["configShare"]["systemTitle"];
	return $p_config;
	}

function display($p_config)
	{
	if (isset($p_config[$p_config["modulSelect"]]["template"]))
		{
		echo ParseTplFORM(tplUp($p_config[$p_config["modulSelect"]]["template"],$p_config,$p_config["configShare"]["tplPath"]),$p_config,"");
		}
	else
		{
		if (!empty($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"]) && $_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 1) $p_config["configShare"]["onlyView"] = 0;
		else $p_config["configShare"]["onlyView"] = 0;
		$p_config["fullHTML"] = tplUp('layout',$p_config,$p_config["configShare"]["tplPath"]);
		echo ParseTplFORM($p_config["fullHTML"],$p_config,"");	
		}
	}

function optionView($p_config,$p_itemTable,$p_itemField,$p_itemID,$p_itemName,$p_itemValues)
	{
	$sqlwrk = "SELECT ".$p_itemID.",".$p_itemName." FROM ".$p_itemTable." WHERE ".$p_itemID." = " . $p_itemValues[$p_itemField];
	$rswrk = db_query($sqlwrk, setConfigValue($p_config,"configShare","conn"));
	$x_result_name = "";
	if ($rswrk && $rowwrk = db_fetch_array($rswrk))
		{
		$x_result_name = $rowwrk[$p_itemName];
		}
	else
		{
		$x_result_name = "&nbsp;";
		}
	db_free_result($rswrk);
	return $x_result_name;
	}

function filterSelect($p_config,$p_itemTable,$p_itemValues,$p_pleaseSelect)
	{
	if (empty($_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_".$p_itemTable."FilterID"]))
		{
//		$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_".$p_itemTable."FilterID"] = 1;
		} // set default value
	
	if (ISSET($p_config[$p_itemTable]["selectWidth"]) && !EMPTY($p_config[$p_itemTable]["selectWidth"]))
		{
		$selectWidth="style='width:".$p_config[$p_itemTable]["selectWidth"].";'";
		}
	else
		{
		$selectWidth="";
		}
	if (ISSET($p_config[$p_itemTable]["selectFields"]) && !EMPTY($p_config[$p_itemTable]["selectField"]))
		{
		$selectFields=$p_config[$p_itemTable]["selectFields"];
		}
	else
		{
		$selectFields="id, name";
		}
	$resultHTML .= "<select name=\"x_".$p_itemTable."FilterID\" ".$selectWidth." onChange='this.form.submit();'>";
	if ($p_pleaseSelect==1)
		{
		$resultHTML .= "<option value=\"-1\">".setConfigValue($p_config,$p_config["modulSelect"],"itemSelectTitle")."</option>";
		}
	$sqlwrk = "SELECT ".$selectFields." FROM ".$p_itemTable." ORDER BY name";
	$rswrk = db_query($sqlwrk, setConfigValue($p_config,"configShare","conn"));
	if ($rswrk)
		{
		$rowcntwrk = 0;
		while ($datawrk = db_fetch_array($rswrk))
			{
			$resultHTML .= "<option value=\"" . htmlspecialchars($datawrk["id"]) . "\"";
			if ($datawrk["id"] == $_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_".$p_itemTable."FilterID"])
				{
				$resultHTML .= " selected";
				}
			$resultHTML .= ">" . $datawrk["name"] . "</option>";
			$rowcntwrk++;
			}
		}
	db_free_result($rswrk);
	$resultHTML .= "</select>";
	return $resultHTML;
	}

function optionSelect($p_config,$p_itemTable,$p_itemField,$p_itemID,$p_itemName,$p_itemValues,$p_selectField)
	{
	if (empty($p_itemValues[$p_itemField]))
		{
		$p_itemValues[$p_itemField] = 0;
		} // set default value
	$resultHTML = "<option value=\"\">".setConfigValue($p_config,$p_config["modulSelect"],"itemSelectTitle")."</option>";
	if ($p_itemTable != "size")
		{
		$sqlwrk = "SELECT ".$p_itemID.",".$p_itemName." FROM ".$p_itemTable." ORDER BY ".$p_itemName;
		}
	else
		{
		$sqlwrk = "SELECT ".$p_itemID.",".$p_itemName.",sizeWidth,sizeHeight FROM ".$p_itemTable." ORDER BY ".$p_itemName;
		}
	$rswrk = db_query($sqlwrk, setConfigValue($p_config,"configShare","conn"));
	if ($rswrk)
		{
		$rowcntwrk = 0;
		while ($datawrk = db_fetch_array($rswrk))
			{
			$resultHTML .= "<option ";
			if ($p_itemTable == "size")
				{
				$resultHTML .= "rel='".$datawrk["sizeWidth"]."<=>".$datawrk["sizeHeight"]."' ";
				}
			$resultHTML .= "value=\"" . htmlspecialchars($datawrk[$p_itemID]) . "\"";
			if ($datawrk["id"] == @$p_itemValues[$p_itemField])
				{
				$resultHTML .= " selected";
				}
			$resultHTML .= ">" . $datawrk[$p_itemName];
			if ($p_itemTable == "size")
				{
				$resultHTML .= " [".$datawrk["sizeWidth"]."x".$datawrk["sizeHeight"]."]";
				}
			$resultHTML .= "</option>";
			$rowcntwrk++;
			}
		}
	db_free_result($rswrk);
	$p_config[$p_selectField]=$resultHTML;
	return $p_config;
	}

function otherService($p_config, $p_modulName, $p_whichBack)
	{
	$resultHTML .= "<td>";
	if (isModulView($p_config,$p_modulName))
		{
		$resultHTML .= "<a title='' href='index.php?modulSelect=".$p_modulName."&amp;modulAction=list&amp;".$p_modulName."cmd=resetall&amp;whichBack=".$p_whichBack."'>";
		$resultHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . "dictionary.png' border=0 name='".$p_modulName."' title='".setConfigValue($p_config,$p_modulName,"title")."'>";
		$resultHTML .= "</a>&nbsp;";
		}
	if (isModulAdd($p_config,$p_modulName))
		{
		$resultHTML .= "<a title='' href='index.php?modulSelect=".$p_modulName."&amp;modulAction=add&amp;whichBack=".$p_whichBack."'>";
		$resultHTML .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . "plus.png' border=0 name='".$p_modulName."add' title='".setConfigValue($p_config,$p_modulName,"title")." ".setConfigValue($p_config,"configShare","addTitle") ."'>";
		$resultHTML .= "</a>";
		}
	$resultHTML .= "</td>";
	return $resultHTML;
	}

function debugPrintValue($p_config, $p_printHead, $p_printValue, $p_printNeed)
	{
	if (($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2) && ($p_printNeed == 1))
		{
		print ($p_printHead . " => " . $p_printValue."<br>");
		}
	}

function pictureView($p_config, $whichpicture, $picturetitle, $sWidth, $sHeight)
	{
	if (!empty($whichpicture)) 
		{ 
		if (is_file($whichpicture))
			{
			if (!(strpos($whichpicture,".swf") > 0))
				{
				if (empty($picturetitle))
					{
					$whichpictureview = "<img alt='".$picturetitle."' src='" . $whichpicture . "' border='0'>";
					}
				else
					{
					$whichpictureview = "<img  alt='".$picturetitle."' src='" . $whichpicture . "' border='0' title='".$picturetitle."'>";
					}
				}
			else
				{
				$whichpictureview = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
					codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
					id="name" width="'.$sWidth.'" height="'.$sHeight.'">
					<param name="movie" value="'.$whichpicture.'">
					<param name="quality" value="high">
					<param name="wmode" value="transparent">
					<embed name="name" src="'.$whichpicture.'"
					quality="high" wmode="transparent" width="'.$sWidth.'" height="'.$sHeight.'"
					type="application/x-shockwave-flash"
					pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?
					P1_Prod_Version=ShockwaveFlash">
					</embed>
					</object>';
				}
			}
		else
			{
			$whichpictureview = "<img alt='".$picturetitle."' src='".$p_config["configShare"]["imageButton"]."nopict.png' border='0'>";
			}
		} 
	else
		{
		$whichpictureview = "<img alt='".$picturetitle."' src='".$p_config["configShare"]["imageButton"]."nopict.png' border='0'>";
		}
	return $whichpictureview;	
	}

function pictureService($p_config, $whichPicture, $key, $p_itemValues)
	{
	$whichpictureview = "<a title='' href='index.php?modulAction=pictureEdit&amp;key=" . urlencode($key) ."&amp;table=".$p_config["modulSelect"]."'>";
	if (!empty($whichPicture)) 
		{ 
		if (is_file($whichPicture))
			{
			$whichpictureview .= "<img alt='' src='" . $whichPicture. "' border='0' name='view' title='".$p_config["configShare"]["pictureEditTitle"]."'>";
			}
		else
			{
			$whichpictureview .= "<img alt='' src='" . $p_config["configShare"]["imageButton"] . "nopict.png' border='0' name='view' title='".$p_config["configShare"]["pictureAddTitle"]."' class='buttonBox'>";
			}
		} 
	else
		{
		$whichpictureview .= "<img alt='' src='" . $p_config["configShare"]["imageButton"] . "nopict.png' border='0' name='view' title='".$p_config["configShare"]["pictureAddTitle"]."' class='buttonBox'>";
		}
	$whichpictureview .= "</a>";
	return $whichpictureview;	
	}

function passChange($p_config)
	{
	if(!isset($_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"]) ||
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"] == 1)
		{
		jumpToPage(setConfigValue($p_config,"configShare","baseModul"));
		}
	$p_config = initTitles($p_config);
	$x_whichBack = @$_GET["whichBack"];
	if (isset($x_whichBack))
		{
		$p_config[$p_config["modulSelect"]]["whichBack"] = "index.php?modulAction=list&modulSelect=".$x_whichBack."&cmd=resetall";
		}
	else
		{
		$p_config[$p_config["modulSelect"]]["whichBack"] = "index.php?modulAction=list";
		}
	if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] == 1) jumpToPage(setConfigValue($p_config,"configShare","baseModul"));
	if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"] == $p_config[$p_config["modulSelect"]]["key"])	
		{
		$p_config["users"]["editTitle"]=setConfigValue($p_config,"configShare","mydata");
		$p_config["topStatus2HTML"] = $p_config["users"]["editTitle"];
		}
	if (empty($p_config["getAction"]))
		{
		$p_config["getAction"] = "I";	//display with input box
		}
	$itemValues = itemValuesFromPOST($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
	$p_config["x_errorText"]="";
	$p_config["x_fieldFocus"]="";
	switch ($p_config["getAction"])
		{
		case "I": // get a record to display
			$itemValues = modulGetRecord($p_config, $itemValues, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
			break;
		case "U": // update
			$itemValues = itemValuesFromPOST($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
			$itemValues["x_oldpassword"] = @$_POST["x_oldpassword"];
			$itemValues["x_password2"] = @$_POST["x_password2"];
			$p_config = passChangeCheck($p_config, $itemValues);
			if ($p_config["x_errorText"] == 'NULL' || $p_config["x_errorText"] == "")		
				{
				// add the values into an array
				$itemValues["x_modifyUserID"] = @$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"];
				$itemValues["x_modifyWhen"] = db_actual_datetime();
				$fieldList = makeFieldList($p_config, $itemValues, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
				fieldListUpdateSQL($p_config, $fieldList);
				$selectUserSQL = "SELECT * FROM users WHERE id='".$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"]."'";
				$selectUserRS = db_query($selectUserSQL, setConfigValue($p_config,"configShare","conn"));
				if (db_num_rows($selectUserRS) != 0)
					{
					$itemUserValues = db_fetch_array($selectUserRS);
					}
				$fromMail= "From: 190.hu-info@190.hu\nReply-To:info@190.hu\nMIME-Version: 1.0\nContent-type: text/html; charset=iso-8859-2";
				$regMailSubject = "Jelszó";
				$regMailContent = "Jelszó: ".$itemValues["x_password"];
				if (mail($itemUserValues["email"], $regMailSubject, $regMailContent, $fromMail))
					{
					$p_config[$p_config["modulSelect"]]["noJump"]=0;
					}                                                            
				else 
					{
					$p_config["x_errorText"] = "<br>Levél elküdése sikertelen!";
					}
				jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
				}		
			else
				{
				$p_config["topErrorMessageHTML"] = topErrorMessage($p_config);
				}		
		}
	$p_config["contentHTML"] = passChangeInput($p_config,$itemValues,"U");
	return $p_config;
	}

function passChangeInput($p_config, $p_itemValues, $p_getAction)
	{
	$p_config = initTitles($p_config);
	$resultHTML = "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
	$resultHTML .= "<tr align='center'>";
	$resultHTML .= "<td valign='top' align='center'>";
	$resultHTML .= "<input type='hidden' name='a' value='".$p_getAction."'>";
	$resultHTML .= "<input type='hidden' name='errorText' value='" . $p_config["x_errorText"] . "'>";
	$resultHTML .= "<input type='hidden' name='fieldFocus' value='" . $p_config["x_fieldFocus"] . "'>";
	$resultHTML .= "<input type='hidden' name='key' value='" . htmlspecialchars(@$p_itemValues["$x_id"]) ."'>";
	$resultHTML .= "<input type='hidden' name='x_id' value='" . htmlspecialchars(@$p_itemValues["x_id"]) . "'>";
	$resultHTML .= "<input type='hidden' name='x_langID' value='" . @$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLangID"] . "'>";
	$resultHTML .= "<table border='0' cellspacing='1' cellpadding='2'>";
	$resultHTML .= "<tr>";
	$resultHTML .= "<td class='titleColor'><span class='baseFont'>".setConfigValue($p_config,$p_config["modulSelect"],"oldpasswordTitle")." *</span>&nbsp;</td>";
	$resultHTML .= "<td class='fieldColor'><span class='baseFont'><input type='password' name='x_oldpassword' value='" . @$_POST["x_oldpassword"] . "' size=22 maxlength=20></span>&nbsp;</td>";
	$resultHTML .= "</tr>";
	$resultHTML .= "<tr>";
	$resultHTML .= "<td class='titleColor'><span class='baseFont'>".setConfigValue($p_config,$p_config["modulSelect"],"passwordTitle")."</span>&nbsp;</td>";
	$resultHTML .= "<td class='fieldColor'><span class='baseFont'><input type='password' name='x_password' value='" . @$_POST["x_password"] . "' size=22 maxlength=20></span>&nbsp;</td>";
	$resultHTML .= "</tr>";
	$resultHTML .= "<tr>";
	$resultHTML .= "<td class='titleColor'><span class='baseFont'>".setConfigValue($p_config,$p_config["modulSelect"],"password2Title")."</span>&nbsp;</td>";
	$resultHTML .= "<td class='fieldColor'><span class='baseFont'><input type='password' name='x_password2' value='" . @$_POST["x_password2"] . "' size=22 maxlength=20></span>&nbsp;</td>";
	$resultHTML .= "</tr>";
	$resultHTML .= "</table></td></tr>";
	$resultHTML .= "</table></td></tr>";
	$resultHTML .= "<SCRIPT LANGUAGE=\"JavaScript\"  type=\"text/javascript\">";
	$resultHTML .= "switch (document.".$p_config["modulAction"]."form.fieldFocus.value)";
	$resultHTML .= "{";
	$resultHTML .= "case \"x_oldpassword\" : document.".$p_config["modulAction"]."form.x_oldpassword.focus();";
	$resultHTML .= "break;";
	$resultHTML .= "case \"x_password\" : document.".$p_config["modulAction"]."form.x_password.focus();";
	$resultHTML .= "break;";
	$resultHTML .= "case \"x_password2\" : document.".$p_config["modulAction"]."form.x_password2.focus();";
	$resultHTML .= "break;";
	$resultHTML .= "default : document.".$p_config["modulAction"]."form.x_oldpassword.focus();";
	$resultHTML .= "break;";
	$resultHTML .= "}";
	$resultHTML .= "</script>";
	return $resultHTML;
	}

function passChangeCheck($p_config, $p_itemValues)
	{
	$p_config["x_errorText"]="";
	$p_config["x_fieldFocus"]="";
	$strSQL = "SELECT * FROM " . $p_config["modulSelect"] . " WHERE id=".$p_itemValues["x_id"]." AND password='" . $p_itemValues["x_oldpassword"] . "'";
	$rs = db_query($strSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
	if (empty($p_itemValues["x_oldpassword"]))
		{
		$p_config["x_errorText"] = setConfigValue($p_config,$p_config["modulSelect"],"passwordOldEmptyError");
		$p_config["x_fieldFocus"] = "x_oldpassword";
		}
	else if (db_num_rows($rs) == 0) 
		{	
		$p_config["x_errorText"] = setConfigValue($p_config,$p_config["modulSelect"],"notFoundUserError");
		$p_config["x_fieldFocus"] = "x_oldpassword";
		}
	else if (empty($p_itemValues["x_password"]))
		{
		$p_config["x_errorText"] = setConfigValue($p_config,$p_config["modulSelect"],"passwordEmptyError");
		$p_config["x_fieldFocus"] = "x_password";
		}
	else if (empty($p_itemValues["x_password2"]))
		{
		$p_config["x_errorText"] = setConfigValue($p_config,$p_config["modulSelect"],"password2EmptyError");
		$p_config["x_fieldFocus"] = "x_password2";
		}
	else if ($p_itemValues["x_password"] != $p_itemValues["x_password2"])
		{
		$p_config["x_errorText"] = setConfigValue($p_config,$p_config["modulSelect"],"passwordPasswordError");
		$p_config["x_fieldFocus"] = "x_password";
		}
	return $p_config;
	}
?>
