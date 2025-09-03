<?php
function modulPermission($p_config,$p_rightsModul)
	{
	$rightsResult = 0;
	if (!is_null(@$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"])) 
		{
		$legals["usersSQL"] = "SELECT active";
		$legals["usersSQL"] .= " FROM users";
		$legals["usersSQL"] .= " WHERE (id=".$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"].")";
		$legals["usersRs"] = db_query($legals["usersSQL"], setConfigValue($p_config,"configShare","conn"));
		if ($legals["usersRs"] && $legals["usersRow"] = db_fetch_array($legals["usersRs"])) 
			{
			if ($legals["usersRow"]["active"]==1)
				{
				$legals["rightsSQL"] = "SELECT modul, active";
				$legals["rightsSQL"] .= " FROM configs";
				$legals["rightsSQL"] .= " WHERE (modul='".$p_rightsModul."')";
				$legals["rightsRs"] = db_query($legals["rightsSQL"], setConfigValue($p_config,"configShare","conn"));
				if ($legals["rightsRs"] && $legals["rightsRow"] = db_fetch_array($legals["rightsRs"])) 
					{
					if ($legals["rightsRow"]["active"]==1)
						{
						$legals["groupsSQL"] = "SELECT active";
						$legals["groupsSQL"] .= " FROM groups";
						$legals["groupsSQL"] .= " WHERE (id=". $_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"].")";
						$legals["groupsRs"] = db_query($legals["groupsSQL"], setConfigValue($p_config,"configShare","conn"));
						if ($legals["groupsRs"] && $legals["groupsRow"] = db_fetch_array($legals["groupsRs"])) 
							{
							if ($legals["groupsRow"]["active"]==1)
								{
								$legals["groups_rightsSQL"] = "SELECT configs.modul,";
								$legals["groups_rightsSQL"] .= " groups_rights.active,";
								$legals["groups_rightsSQL"] .= " groups_rights.allrecs,";
								$legals["groups_rightsSQL"] .= " groups_rights.ownrecs";
								$legals["groups_rightsSQL"] .= " FROM configs";
								$legals["groups_rightsSQL"] .= " LEFT JOIN groups_rights ON groups_rights.modulID=configs.id";
								$legals["groups_rightsSQL"] .= " WHERE (configs.modul='".$p_rightsModul."'";
								$legals["groups_rightsSQL"] .= " AND groups_rights.groupsID=". $_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"].")";
								$legals["groups_rightsRs"] = db_query($legals["groups_rightsSQL"], setConfigValue($p_config,"configShare","conn"));
								if ($legals["groups_rightsRs"] && $legals["groups_rightsRow"] = db_fetch_array($legals["groups_rightsRs"])) 
									{
									if ($legals["groups_rightsRow"]["active"]==1)
										{
										$rightsResult = $legals["groups_rightsRow"]["allrecs"];
										}
									}
								}
							}
						$legals["users_rightsSQL"] = "SELECT configs.modul,";
						$legals["users_rightsSQL"] .= " users_rights.active,";
						$legals["users_rightsSQL"] .= " users_rights.allrecs,";
						$legals["users_rightsSQL"] .= " users_rights.ownrecs";
						$legals["users_rightsSQL"] .= " FROM configs";
						$legals["users_rightsSQL"] .= " LEFT JOIN users_rights ON users_rights.modulID=configs.id";
						$legals["users_rightsSQL"] .= " WHERE (configs.modul='".$p_rightsModul."'";
						$legals["users_rightsSQL"] .= " AND users_rights.usersID=". $_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"].")";
						$legals["users_rightsRs"] = db_query($legals["users_rightsSQL"], setConfigValue($p_config,"configShare","conn"));
						if ($legals["users_rightsRs"] && $legals["users_rightsRow"] = db_fetch_array($legals["users_rightsRs"])) 
							{
							if ($legals["users_rightsRow"]["active"]==1)
								{
								$rightsResult = $legals["users_rightsRow"]["allrecs"];
								}
							}
						}
					}
				}
			}
		}
	return 31;
//	return $rightsResult;
	}

function isModulView($p_config,$p_isModul)
	{
	$result = false;
	if ((modulPermission($p_config,$p_isModul) & ewAllowview) == ewAllowview)
		{
		$result =  true;
		}
	return $result;
	}

function isModulList($p_config,$p_isModul)
	{
	$result = false;
	if ((modulPermission($p_config,$p_isModul) & ewAllowlist) == ewAllowlist)
		{
		$result =  true;
		}
	return $result;
	}

function isModulAdd($p_config,$p_isModul)
	{
	$result = false;
	if ((modulPermission($p_config,$p_isModul) & ewAllowadd) == ewAllowadd)
		{
		$result =  true;
		}
	return $result;
	}

function isModulEdit($p_config,$p_isModul)
	{
	$result = false;
	if ((modulPermission($p_config,$p_isModul) & ewAllowedit) == ewAllowedit)
		{
		$result =  true;
		}
	return $result;
	}

function isModulDelete($p_config,$p_isModul)
	{
	$result = false;
	if ((modulPermission($p_config,$p_isModul) & ewAllowdelete) == ewAllowdelete)
		{
		$result =  true;
		}
	return $result;
	}

function isModulAdmin($p_config,$p_isModul)
	{
	$result = false;
	if ((modulPermission($p_config,$p_isModul) & ewAllowadmin) == ewAllowadmin)
		{
		$result =  true;
		}
	return $result;
	}

function jumpToPage($p_whichPage)
	{
	ob_end_clean();
	header("Location: ".$p_whichPage);
	}

function longtextWrapper($p_config,$p_wrapText)
	{
	$wrappedText = "";
	if (isset($p_config["configShare"]["textWrapLen"]))
		{
		$wrapingLen = setConfigValue($p_config,"configShare","textWrapLen");
		}
	else
		{
		$wrapingLen = 110;
		}
	$textDim = explode(" ",$p_wrapText);
	for ($i=0;$i<count($textDim);$i++)
		{
		$wrappedText .= " ". trim(wordwrap($textDim[$i],$wrapingLen,"<br/>\n",1));
		}
	return trim($wrappedText);
	}

function configSeparatorWrapper($p_config,$p_wrapText)
	{
	$wrappedText = str_replace("<#>","<br />",$p_wrapText);
	return trim($wrappedText);
	}

function makeFieldList($p_config, $p_itemValues, $p_tableName)
	{
	$structureResult = mysql_query("SHOW COLUMNS FROM ".$p_tableName);
	if (db_num_rows($structureResult) > 0)
		{
		while ($resultRow = mysql_fetch_assoc($structureResult))
			{
			$fieldNames[]=$resultRow["Field"];
			$fieldTypes[]=$resultRow["Type"];
			}
		} 

	$counter=0;
	while ( isset($fieldNames[$counter]) )
		{
		if ( isset($p_itemValues["x_".$fieldNames[$counter]]) )
			{
			if (strpos($fieldTypes[$counter],"int(")!==false)
				{
				if ($fieldNames[$counter]<>"id")
					{
					$theValue = (!get_magic_quotes_gpc()) ? addslashes($p_itemValues["x_".$fieldNames[$counter]]) : $p_itemValues["x_".$fieldNames[$counter]];
					$theValue = ($theValue != "") ? intval($theValue) : "NULL";
					$p_fieldList[$fieldNames[$counter]] = $theValue;
					}
				}			
			else if (strpos($fieldTypes[$counter],"char(")!==false ||
				strpos($fieldTypes[$counter],"text")!==false ||
				strpos($fieldTypes[$counter],"longtext")!==false)
				{
				if (strtolower($p_itemValues["x_".$fieldNames[$counter]])=="<br>")
					{
					$p_itemValues["x_".$fieldNames[$counter]]="";
					}
				$theValue = (!get_magic_quotes_gpc()) ? addslashes($p_itemValues["x_".$fieldNames[$counter]]) : $p_itemValues["x_".$fieldNames[$counter]];
				$theValue = ($theValue != "") ? " '" . $theValue . "'" : "NULL";
				$p_fieldList[$fieldNames[$counter]] = $theValue;
				}
			else
				{
				$theValue = (!get_magic_quotes_gpc()) ? addslashes($p_itemValues["x_".$fieldNames[$counter]]) : $p_itemValues["x_".$fieldNames[$counter]];
				$theValue = ($theValue != "") ? " '" . $theValue . "'" : "NULL";
				$p_fieldList[$fieldNames[$counter]] = $theValue;
				}			
			}
		$counter++;
		}
	return $p_fieldList;
	}

function itemValuesFromPOST($p_config, $p_tableName)
	{
	// get the form values
	$structureResult = mysqli_query($p_config["configShare"]["conn"],"SHOW COLUMNS FROM ".$p_tableName);
	if (db_num_rows($structureResult) > 0)
		{
		while ($resultRow = mysqli_fetch_assoc($structureResult))
			{
			$fieldNames[]=$resultRow["Field"];
			}
		} 
	$counter=0;
	while ( isset($fieldNames[$counter]) )
		{
		$itemValues["x_".$fieldNames[$counter]] = @$_POST["x_".$fieldNames[$counter]];
		$counter++;
		}
	return $itemValues;
	}

function pageHTMLElementsInit($p_config)
	{
	$p_config["pageStartHTML"]="";
	$p_config["topHeaderHTML"]="";
	$p_config["topAdvertHTML"]="";
	$p_config["topMenuHTML"]="";
	$p_config["afterTopMenuHTML"]="";
	$p_config["beforeTopServiceHTML"]="";
	$p_config["topServiceHTML"]="";
	$p_config["topMessageHTML"]="";
	$p_config["topStatusHTML"]="";
	$p_config["topStatus2HTML"]="";
	$p_config["topErrorMessageHTML"]="";
	$p_config["leftSideHTML"]="";
	$p_config["rightSideHTML"]="";
	$p_config["navigationHTML"]="";
	$p_config["bottomMenuHTML"]="";
	$p_config["topFooterHTML"]="";
	$p_config["footerHTML"]="";
	$p_config["contentHTML"]="";
	$p_config["loginServiceHTML"];
	$p_config["navigationHTML"];
	$p_config["navigationAddHTML"];
	return $p_config;
	}

function startList($p_config)
	{
	// avoid starting record > total records

	if ($p_config[$p_config["modulSelect"]]["startRec"] > $p_config[$p_config["modulSelect"]]["totalRecs"])
		{
		$p_config[$p_config["modulSelect"]]["startRec"] = $p_config[$p_config["modulSelect"]]["totalRecs"];
		}
	else
		{
//		$p_config[$p_config["modulSelect"]]["startRec"] = 1;
//		$p_config[$p_config["modulSelect"]]["startRec"] = $_SESSION[$p_config["configShare"]["whichSystemAndMode"] .$p_config["modulSelect"]. "startRec"];
		}

	// set the last record to display
	$p_config[$p_config["modulSelect"]]["stopRec"] = $p_config[$p_config["modulSelect"]]["startRec"] + $p_config[$p_config["modulSelect"]]["displayRecs"] - 1;
	$p_config[$p_config["modulSelect"]]["recCount"] = $p_config[$p_config["modulSelect"]]["startRec"] - 1;

	// move to the first record
	db_data_seek($p_config[$p_config["modulSelect"]]["resultSQL"], $p_config[$p_config["modulSelect"]]["recCount"]);
	$p_config[$p_config["modulSelect"]]["recActual"] = 0;
	return $p_config;
	}

/**
 * Makes directory and returns BOOL(TRUE) if exists OR made.
 *
 * @param  $path Path name
 * @return bool
 */
function rmkdir($path, $mode = 0755)
	{
	$path = rtrim(preg_replace(array("/\\\\/", "/\/{2,}/"), "/", $path), "/");
	$e = explode("/", ltrim($path, "/"));
	if(substr($path, 0, 1) == "/")
		{
		$e[0] = "/".$e[0];
		}
	$c = count($e);
	$cp = $e[0];
	for($i = 1; $i < $c; $i++)
		{
		if(!is_dir($cp) && !@mkdir($cp, $mode))
			{
			return false;
			}
		$cp .= "/".$e[$i];
		}
	return @mkdir($path, $mode);
	}

function pictureresize($inputname,$outputname,$new_w,$new_h)
	{
	$system = explode(".",$inputname);
	$inputtype = $system[count($system)-1];
	$inputtype = strtolower($inputtype);
	if (($inputtype == 'jpg') or ($inputtype == 'jpeg'))
		{
		$src_img = imagecreatefromjpeg($inputname);
		}
	if ($inputtype == 'gif')
		{
		$src_img = imagecreatefromgif($inputname);
		}
	if ($inputtype == 'png')
		{
		$src_img = imagecreatefrompng($inputname);
		}
	$old_x=imageSX($src_img);
	$old_y=imageSY($src_img);
	if ($old_x > $new_w || $old_y > $new_h)
		{
		if ($old_x > $old_y)
			{
			$thumb_w=$new_w;
			$thumb_h=$old_y*($new_h/$old_x);
			}
		if ($old_x < $old_y)
			{
			$thumb_w=$old_x*($new_w/$old_y);
			$thumb_h=$new_h;
			}
		if ($old_x == $old_y)
			{
			$thumb_w=$new_w;
			$thumb_h=$new_h;
			}
		}
	else
		{
		$thumb_w = $old_x;
		$thumb_h = $old_y;
		}
	$dst_img=ImageCreateTrueColor($thumb_w,$thumb_h);
	imagecopyresampled($dst_img,$src_img,0,0,0,0,$thumb_w,$thumb_h,$old_x,$old_y);
	if ((preg_match("/png/",$system[1])) || (preg_match("/gif/",$system[1])))
		{
		imagepng($dst_img,$outputname);
		}
	else
		{
		imagejpeg($dst_img,$outputname);
		}
	imagedestroy($dst_img);
	imagedestroy($src_img);
	$resized=1;
	return $resized;
	}

function emailValidator( $email, $chFail = false )
	{
	$msgs = Array(); $msgs[] = 'Received email address: '.$email;
	//check for email pattern (adapted and improved from http://karmak.org/archive/2003/02/validemail.html)
	//incorrectly allows IP addresses with block numbers > 256, but those will fail to create sockets anyway
	//unicode norwegian chars cannot be used: C caron, D stroke, ENG, N acute, S caron, T stroke, Z caron (PHP unicode limitation)
	if( !preg_match( "/^(([^<>()[\]\\\\.,;:\s@\"]+(\.[^<>()[\]\\\\.,;:\s@\"]+)*)|(\"([^\"\\\\\r]|(\\\\[\w\W]))*\"))@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([a-z\-0-9 …„‡‚Šˆ¤¢•“”‘o†]+\.)+[a-z]{2,}))$/i", $email ) )
		{
	        $msgs[] = 'Email address was not recognised as a valid email pattern';
	        return $chFail ? Array( false, $msgs ) : false;
		}
	$msgs[] = 'Email address was recognised as a valid email pattern';

	//get the mx host name
	if( preg_match( "/@\[[\d.]*\]$/", $email ) )
		{
		$mxHost[0] = preg_replace( "/[\w\W]*@\[([\d.]+)\]$/", "$1", $email );
		$msgs[] = 'Email address contained IP address '.$mxHost[0].' - no need for MX lookup';
		}
	else
		{
		//get all mx servers - if no MX records, assume domain is MX (SMTP RFC)
		}
	$msgs[] = 'Could not establish SMTP session with any MX servers';
	return $chFail ? Array( true, $msgs ) : true;
	}

function setConfigValue($p_config,$p_configType,$p_configField)
	{
	if ($p_configType != "configShare" && $p_configType != "registration")
		{
		$shareConfig = $p_config[$p_configType]["mainTable"];
		}
	if (isset($p_config[$shareConfig][$p_configField]))
		{
		$setConfigValueResult = $p_config[$shareConfig][$p_configField];
		}
	else if (isset($p_config[$p_configType][$p_configField]))
		{
		$setConfigValueResult = $p_config[$p_configType][$p_configField];
		}
	else if (isset($p_config["configShare"][$p_configField]))
		{
		$setConfigValueResult = $p_config["configShare"][$p_configField];
		}	
	else if (isset($p_config[$p_configField]))
		{
		$setConfigValueResult = $p_config[$p_configField];
		}
	else $setConfigValueResult = "";
	return $setConfigValueResult;
	}

function setModulConfigValue($p_modulConfig,$p_modulConfigField)
	{
	if (isset($GLOBALS[$p_modulConfig][$p_modulConfigField]))
		$setModulConfigValueResult = $GLOBALS[$p_modulConfig][$p_modulConfigField];
	else $setModulConfigValueResult = "";
	return $setModulConfigValueResult;
	}

?>