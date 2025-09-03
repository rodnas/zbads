<?php
function modulFrameAdd($p_config)
	{
	if (trim($_POST["Action"])==$p_config["configShare"]["backTitle"])
		{
		jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
		}
	$makeActive = '1';
	$beforeAddCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##beforeAddCFG##","##/beforeAddCFG##");
	$beforeAddFieldCFG = explode('<#>',$beforeAddCFG);
	for ($beforeAddFieldCFGCount=0;$beforeAddFieldCFGCount<count($beforeAddFieldCFG);$beforeAddFieldCFGCount++)
		{
		$beforeAddItemCFG = explode('<=>',$beforeAddFieldCFG[$beforeAddFieldCFGCount]);
		switch ($beforeAddItemCFG[0])
			{
			case "prevkey":
				$itemValues[$beforeAddItemCFG[1]]=$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."_prev_key"];
				break;
			}
		}
	$itemValues["x_advertiserID"]=$_SESSION["advert_x_advertiserID"];
	$itemValues["x_campaignID"]=$_SESSION["advert_x_campaignID"];
	$itemValues["x_sourceID"]=$_SESSION["advert_x_sourceID"];
	$itemValues["x_sizeID"]=$_SESSION["advert_x_sizeID"];
	$itemValues["x_sizeWidth"]=$_SESSION["advert_x_sizeWidth"];
	$itemValues["x_sizeHeight"]=$_SESSION["advert_x_sizeHeight"];
	switch ($p_config["getAction"])
		{
		case "C": // get a record to display
			$addSQL = "SELECT * FROM " . setConfigValue($p_config,$p_config["modulSelect"],"mainTable") . " WHERE " . $p_config[$p_config["modulSelect"]]["sqlKey"];
			$addResult = db_query($addSQL, setConfigValue($p_config,"configShare","conn"));
			if (db_num_rows($addResult) == 0)
				{
				jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
				}
			else
				{
				$p_config[$p_config["modulSelect"]]["resultRow"] = db_fetch_array($addResult);
				$itemValues = itemValuesFromDB($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable") );
				}
			db_free_result($addResult);
			break;
		case "A": // add
			$itemValues = itemValuesFromPOST($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
			if (ISSET($_POST["x_password2"]) && !EMPTY($_POST["x_password2"]))
				{
				$itemValues["x_password2"] = $_POST["x_password2"];
				}
			if (strtolower($itemValues["x_description"])=="<br>")
				{
				$itemValues["x_description"]="";
				}
			include "modulcheck.inc.php";
			$p_config = modulFrameCheck($p_config, $itemValues);
			if ($p_config["x_errorText"] == 'NULL' || $p_config["x_errorText"] == "")		
				{
				// add the values into an array

				$makeActive = '1';
				$beforeAddCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##beforeAddCFG##","##/beforeAddCFG##");
				$beforeAddFieldCFG = explode('<#>',$beforeAddCFG);
				for ($beforeAddFieldCFGCount=0;$beforeAddFieldCFGCount<count($beforeAddFieldCFG);$beforeAddFieldCFGCount++)
					{
					$beforeAddItemCFG = explode('<=>',$beforeAddFieldCFG[$beforeAddFieldCFGCount]);
					switch ($beforeAddItemCFG[0])
						{
						case "prevkey":
							$itemValues[$beforeAddItemCFG[1]]=$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."_prev_key"];
							break;
						case "notActive":
							$makeActive = '0';
							break;
						case "member":
							if (empty($itemValues[$beforeAddItemCFG[1]]))
								{
								$itemValues[$beforeAddItemCFG[1]] = $p_config["configShare"]["registrationUserLevel"];
								}
							break;
						case "genActivationCode":
							$itemValues[$beforeAddItemCFG[1]] = md5($itemValues[$beforeAddItemCFG[2]]);
							break;
						case "genNewsletterAccount":
							if (isset($_POST["x_newsletter"]) && !empty($_POST["x_newsletter"])) 
								{
								$itemValues["x_newsletter"]=1;
								$itemValues["x_activation_code"]=md5($itemValues["x_name"]);
								$insertSQL="INSERT INTO newsletter (name, email, activationCode, regmailWhen) VALUES ";
								$insertSQL .= "('".$itemValues["x_surname"]." ".$itemValues["x_forename"]."', '".$itemValues["x_email"]."', '".$itemValues["x_activationCode"]."', '".db_actual_datetime()."')";
							 	db_query($insertSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
								$newsletterAccountLast="".mysql_insert_id()."";
								$p_config = regNewsletterMailSend($itemValues, $p_config, $newsletterAccountLast);
								}
							break;
						}
					}
				$itemValues["x_active"] = $makeActive;
				$itemValues["x_insertUserID"] = @$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"];
				if (EMPTY($itemValues["x_langID"])) 
					{
					$itemValues["x_langID"]=$p_config["configShare"]["langID"];
					}
				$itemValues["x_insertWhen"] = db_actual_datetime();
				if (($_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 2 ||
					$_SESSION[$p_config["configShare"]["whichSystemAndMode"]."status_UserLevel"] == 3) && 
					$p_config["modulSelect"] != "support")
					{
					$itemValues["x_isReadWhen"] = db_actual_datetime();
					$itemValues["x_isReadUserID"] = @$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"];
					}
				if (trim($_POST["Action"])==$p_config["configShare"]["saveTitle"] || trim($_POST["Action"])==$p_config["configShare"]["saveNoBackTitle"])
					{
					$fieldList = makeFieldList($p_config, $itemValues, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
					fieldListInsertSQL($p_config, $fieldList);
					$last_id="".mysql_insert_id()."";
					$makeActive = '1';
					$afterAddCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##afterAddCFG##","##/afterAddCFG##");
					$afterAddFieldCFG = explode('<#>',$afterAddCFG);
					if ($p_config[$p_config["modulSelect"]]["hide"] != "1")
						{
						$actualImgPath = $p_config["configShare"]["docrootPath"].$p_config[$p_config["modulSelect"]]["imgPath"];
						}
					else
						{
						$actualImgPath = $p_config["configShare"]["docrootPathHide"].$p_config[$p_config["modulSelect"]]["imgPath"];
						}
					for ($afterAddFieldCFGCount=0;$afterAddFieldCFGCount<count($afterAddFieldCFG);$afterAddFieldCFGCount++)
						{
						$afterAddItemCFG = explode('<=>',$afterAddFieldCFG[$afterAddFieldCFGCount]);
						switch ($afterAddItemCFG[0])
							{
							case "pictureAdd":
								$itemValues[$afterAddItemCFG[1]] = @$_POST[$afterAddItemCFG[1]];
								if (@$_FILES[$afterAddItemCFG[1]]['name']!="") 
									{
									$imagetype = @$_FILES[$afterAddItemCFG[1]]['type'];
									if (($imagetype=="image/pjpeg")	|| ($imagetype=="image/jpeg") || ($imagetype=="image/jpg")
										|| ($imagetype=="image/gif") || ($imagetype=="image/png"))
										{
										if (($imagetype=="image/pjpeg") || ($imagetype=="image/jpeg") || ($imagetype=="image/jpg"))
											{
											$extension = ".jpg";
											}
										if (($imagetype=="image/gif"))
											{
											$extension = ".gif";
											}
										if (($imagetype=="image/png"))
											{
											$extension = ".png";
											}
										$pictureNameSAVE = substr(@$_FILES[$afterAddItemCFG[1]]['name'],0,strpos(@$_FILES[$afterAddItemCFG[1]]['name'],"."))."_".$last_id. $extension;
										$dirMake = rmkdir($actualImgPath, 0755);
										$pictureNameOrig = realPath($actualImgPath)."/".$pictureNameSAVE;
										move_uploaded_file(@$_FILES[$afterAddItemCFG[1]]['tmp_name'],$pictureNameOrig);
										chmod($pictureNameOrig,0644);
										chmod($pictureNameSmallOrig,0644);
										$itemValues[$afterAddItemCFG[1]] = $pictureNameSAVE;
										}
									}
								$theValue = (!get_magic_quotes_gpc()) ? addslashes($itemValues[$afterAddItemCFG[1]]) : $itemValues[$afterAddItemCFG[1]];
								$theValue = ($theValue != "") ? " '" . $theValue . "'" : "NULL";
								$fieldList["`$afterAddItem[2]`"] = $theValue;
								break;
							case "pictureResizeAdd":
								$itemValues[$afterAddItemCFG[1]] = @$_POST[$afterAddItemCFG[1]];
								if (@$_FILES[$afterAddItemCFG[1]]['name']!="") 
									{
									$imagetype = @$_FILES[$afterAddItemCFG[1]]['type'];
									if (($imagetype=="image/pjpeg")	|| ($imagetype=="image/jpeg") || ($imagetype=="image/jpg")
										|| ($imagetype=="image/gif") || ($imagetype=="image/png"))
										{
										if (($imagetype=="image/pjpeg") || ($imagetype=="image/jpeg") || ($imagetype=="image/jpg"))
											{
											$extension = ".jpg";
											}
										if (($imagetype=="image/gif"))
											{
											$extension = ".gif";
											}
										if (($imagetype=="image/png"))
											{
											$extension = ".png";
											}
										$pictureNameSAVE = substr(@$_FILES[$afterAddItemCFG[1]]['name'],0,strpos(@$_FILES[$afterAddItemCFG[1]]['name'],"."))."_".$last_id. $extension;
										$dirMake = rmkdir($actualImgPath, 0755);
										$pictureNameOrig = realPath($actualImgPath)."/".$pictureNameSAVE;
										move_uploaded_file(@$_FILES[$afterAddItemCFG[1]]['tmp_name'],$pictureNameOrig);
										chmod($pictureNameOrig,0644);
										$pictureNameSmallSAVE = $p_config["modulSelect"]."_".$last_id.setConfigValue($p_config,$p_config["modulSelect"],"pictSmallNamePlus").$extension;
										$pictureNameSmallOrig = realPath($actualImgPath)."/".$pictureNameSmallSAVE;
										pictureresize($pictureNameOrig,$pictureNameSmallOrig,setConfigValue($p_config,$p_config["modulSelect"],"pictSmallWidth"),setConfigValue($p_config,$p_config["modulSelect"],"pictSmallHeight"));
										chmod($pictureNameSmallOrig,0644);
										$pictureNameNormalSAVE = $p_config["modulSelect"]."_".$last_id.setConfigValue($p_config,$p_config["modulSelect"],"pictNormalNamePlus"). $extension;
										$pictureNameNormalOrig = realPath($actualImgPath)."/".$pictureNameNormalSAVE;
										pictureresize($pictureNameOrig,$pictureNameNormalOrig,setConfigValue($p_config,$p_config["modulSelect"],"pictNormalWidth"),setConfigValue($p_config,$p_config["modulSelect"],"pictNormalHeight"));
										chmod($pictureNameNormalOrig,0644);
										$itemValues[$afterAddItemCFG[1]] = $pictureNameSAVE;
										}
									}
								$theValue = (!get_magic_quotes_gpc()) ? addslashes($itemValues[$afterAddItemCFG[1]]) : $itemValues[$afterAddItemCFG[1]];
								$theValue = ($theValue != "") ? " '" . $theValue . "'" : "NULL";
								$fieldList["`$afterAddItemCFG[2]`"] = $theValue;
								break;
							case "fileAdd":
								$itemValues[$afterAddItemCFG[1]] = @$_POST[$afterAddItemCFG[1]];
								if (@$_FILES[$afterAddItemCFG[1]]['name']!="") 
									{
									$fileNameElement = explode(".",@$_FILES[$afterAddItemCFG[1]]['name']);
									$extension = ".".$fileNameElement[count($fileNameElement)-1];
									$dirMake = rmkdir($actualImgPath, 0755);
									$fileNameSAVE = substr(@$_FILES[$afterAddItemCFG[1]]['name'],0,strpos(@$_FILES[$afterAddItemCFG[1]]['name'],"."))."_".$last_id. $extension;
									$fileNameOrig = realPath($actualImgPath)."/".$fileNameSAVE;
									move_uploaded_file(@$_FILES[$afterAddItemCFG[1]]['tmp_name'],$fileNameOrig);
									chmod($fileNameOrig,0644);
									$itemValues[$afterAddItemCFG[1]] = $fileNameSAVE;
									}
								$theValue = (!get_magic_quotes_gpc()) ? addslashes($itemValues[$afterAddItemCFG[1]]) : $itemValues[$afterAddItemCFG[1]];
								$theValue = ($theValue != "") ? " '" . $theValue . "'" : "NULL";
								$fieldList["`$afterAddItemCFG[2]`"] = $theValue;
								break;
							case "regUserMailSend":
								if (isset($itemValues[$afterAddItemCFG[3]]))
									{
									$p_config = regUserMailSend($itemValues, $p_config, $last_id);
									if (isset($p_config[$p_config["modulSelect"]]["noJump"]) && $p_config[$p_config["modulSelect"]]["noJump"] == 1)
										{
										$itemValues[$afterAddItemCFG[1]] = db_actual_datetime();
										$theValue = (!get_magic_quotes_gpc()) ? addslashes($itemValues[$afterAddItemCFG[1]]) : $itemValues[$afterAddItemCFG[1]];
										$theValue = ($theValue != "") ? " '" . $theValue . "'" : "NULL";
										$fieldList["`$afterAddItemCFG[2]`"] = $theValue;
										}
									}
								break;
							case "regUserNewsletter":
								if (isset($itemValues[$afterAddItemCFG[3]]))
									{
									$p_config = regNewsletterMailSend($itemValues, $p_config, $last_id);
									if (isset($p_config[$p_config["modulSelect"]]["noJump"]) && $p_config[$p_config["modulSelect"]]["noJump"] == 1)
										{
										$itemValues[$afterAddItemCFG[1]] = db_actual_datetime();
										$theValue = (!get_magic_quotes_gpc()) ? addslashes($itemValues[$afterAddItemCFG[1]]) : $itemValues[$afterAddItemCFG[1]];
										$theValue = ($theValue != "") ? " '" . $theValue . "'" : "NULL";
										$fieldList["`$afterAddItemCFG[2]`"] = $theValue;
										}
									}
								break;
							case "regNewsletterMailSend":
								if (isset($itemValues[$afterAddItemCFG[3]]))
									{
									$p_config = regNewsletterMailSend($itemValues, $p_config, $last_id);
									if (isset($p_config[$p_config["modulSelect"]]["noJump"]) && $p_config[$p_config["modulSelect"]]["noJump"] == 1)
										{
										$itemValues[$afterAddItemCFG[1]] = db_actual_datetime();
										$theValue = (!get_magic_quotes_gpc()) ? addslashes($itemValues[$afterAddItemCFG[1]]) : $itemValues[$afterAddItemCFG[1]];
										$theValue = ($theValue != "") ? " '" . $theValue . "'" : "NULL";
										$fieldList["`$afterAddItemCFG[2]`"] = $theValue;
										}
									}
								break;
							case "active":
								if ($itemValues[$afterAddItemCFG[1]]==$afterAddItemCFG[2] && $itemValues["x_active"] != 1)
									{
									$itemValues["x_active"] = 1;
									}
								break;
							case "x_expirationdate":
								$itemValues[$afterAddItemCFG[0]]=date('Y.m.d',mktime(0,0,0,substr($itemValues[$afterAddItemCFG[1]],5,2),substr($itemValues[$afterAddItemCFG[1]],8,2),substr($itemValues[$afterAddItemCFG[1]],0,4)+1));
								break;
							}
						}
					$fieldList = makeFieldList($p_config, $itemValues, $p_config[$p_config["modulSelect"]]["mainTable"]);
					if (isset($afterAddCFG))
						{
						$updateSQL = "UPDATE " . $p_config[$p_config["modulSelect"]]["mainTable"] . " SET ";
						foreach ($fieldList as $key=>$temp)
							{
							$updateSQL .= "$key = $temp, ";			
							}
						if (substr($updateSQL, -2) == ", ")
							{
							$updateSQL = substr($updateSQL, 0, strlen($updateSQL)-2);
							}
						$updateSQL .= " WHERE id=".$last_id;
					  	$rs = mysql_query($updateSQL, setConfigValue($p_config,"configShare","conn")) or die(mysql_error());
						}
					}
				if ($p_config["modulSelect"]=="advertiser")
					{
					$_SESSION["advert_x_advertiserID"]=$last_id;
					}
				if ($p_config["modulSelect"]=="campaign")
					{
					$_SESSION["advert_x_campaignID"]=$last_id;
					}
				if ($p_config["modulSelect"]=="source")
					{
					$_SESSION["advert_x_sourceID"]=$last_id;
					}
				if ($p_config["modulSelect"]=="size")
					{
					$_SESSION["advert_x_advertiserID"]=$last_id;
					$_SESSION["advert_x_sizeID"]=$last_id;
					$_SESSION["advert_x_sizeWidth"]=$itemValues["x_sizeWidth"];
					$_SESSION["advert_x_sizeHeight"]=$itemValues["x_sizeHeight"];
					}
				if (trim($_POST["Action"])==$p_config["configShare"]["saveTitle"] || trim($_POST["Action"])==$p_config["configShare"]["saveNoBackTitle"])
					{
					if (trim($_POST["Action"])==$p_config["configShare"]["saveTitle"])
						{
						if ($p_config["modulSelect"]=="advertiser" ||
							$p_config["modulSelect"]=="campaign" ||
							$p_config["modulSelect"]=="source" ||
							$p_config["modulSelect"]=="size")
							{
							?>
							<script type="text/javascript">
							parent.popupCodeClose("<?php echo $p_config["modulSelect"];?>",<?php echo $last_id;?>);
							</script>
							<?php
							}
						else
							{
							jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
							}

						}
					}
				}
		}
	include "modulinput.inc.php";
	$p_config["getAction"]="A";
	$p_config["contentAddHTML"] = modulFrameInputRecord($p_config,$itemValues,$p_config["getAction"]);
	$p_config["navigationHTML"] = footerNavigation($p_config);
	$addHTML = iniCFGParser($p_config["sharedTPL"]["iniCFG"],"##addForm##","##/addForm##");
	$p_config["contentHTML"]=ParseTplForm($addHTML,$p_config,$itemValues);
	return $p_config;
	}
?>