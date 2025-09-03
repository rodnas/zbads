<?php
function modulFrameEdit($p_config)
	{
	if (trim($_POST["Action"])==$p_config["configShare"]["backTitle"])
		{
		jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
		}
	$itemValues = itemValuesFromPOST($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
	switch ($p_config["getAction"])
		{
		case "I": // get a record to display
			$itemValues = modulGetRecord($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
			break;
		case "U": // update
			$itemValues = itemValuesFromPOST($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
//			if (ISSET($_POST["x_password2"]) && !EMPTY($_POST["x_password2"]))
//				{
				$itemValues["x_password2"] = $_POST["x_password"];
//				}
			include "modulcheck.inc.php";
			$p_config = modulFrameCheck($p_config, $itemValues);
			if ($p_config["x_errorText"] == 'NULL' || $p_config["x_errorText"] == "")		
				{
				$inputCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##modulEditCFG##","##/modulEditCFG##");
				$modulEditParamDIM = explode('<#>',$inputCFG);
				if ($p_config[$p_config["modulSelect"]]["hide"] != "1")
					{
					$actualImgPath = $p_config["configShare"]["docrootPath"].$p_config[$p_config["modulSelect"]]["imgPath"];
					}
				else
					{
					$actualImgPath = $p_config["configShare"]["docrootPathHide"].$p_config[$p_config["modulSelect"]]["imgPath"];
					}
				for ($editFieldCount=0;$editFieldCount<count($modulEditParamDIM);$editFieldCount++)
					{
					$modulEditFieldDIM = explode('#',$modulEditParamDIM[$editFieldCount]);
					switch ($modulEditFieldDIM[0])
						{
						case "pictureAdd":
							$itemValues[trim($modulEditFieldDIM[1])] = @$_POST[trim($modulEditFieldDIM[1])];
							if (@$_FILES[$modulEditFieldDIM[1]]['name']!="") 
								{
								$imagetype = @$_FILES[$modulEditFieldDIM[1]]['type'];
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
									$pictureNameSAVE = substr(@$_FILES[$modulEditFieldDIM[1]]['name'],0,strpos(@$_FILES[$modulEditFieldDIM[1]]['name'],"."))."_".$itemValues["x_id"]. $extension;
									$dirMake = rmkdir($actualImgPath, 0755);
									$pictureNameOrig = realPath($actualImgPath)."/".$pictureNameSAVE;
									move_uploaded_file(@$_FILES[$modulEditFieldDIM[1]]['tmp_name'],$pictureNameOrig);
									chmod($pictureNameOrig,0755);
									$itemValues[$modulEditFieldDIM[1]] = $pictureNameSAVE;
									}
								}
							break;
						case "pictureResizeAdd":
							$itemValues[$modulEditFieldDIM[1]] = @$_POST[$modulEditFieldDIM[1]];
							if (@$_FILES[$modulEditFieldDIM[1]]['name']!="") 
								{
								$imagetype = @$_FILES[$modulEditFieldDIM[1]]['type'];
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
									$pictureNameSAVE = substr(@$_FILES[$modulEditFieldDIM[1]]['name'],0,strpos(@$_FILES[$modulEditFieldDIM[1]]['name'],"."))."_".$itemValues["x_id"]. $extension;
									$dirMake = rmkdir($actualImgPath, 0755);
									$pictureNameOrig = realPath($actualImgPath)."/".$pictureNameSAVE;
									move_uploaded_file(@$_FILES[$modulEditFieldDIM[1]]['tmp_name'],$pictureNameOrig);
									chmod($pictureNameOrig,0644);
									$pictureNameSmallSAVE = $p_config["modulSelect"]."_".$itemValues["x_id"].setConfigValue($p_config,$p_config["modulSelect"],"pictSmallNamePlus"). $extension;
									$pictureNameSmallOrig = realPath($actualImgPath)."/".$pictureNameSmallSAVE;
									pictureresize($pictureNameOrig,$pictureNameSmallOrig,setConfigValue($p_config,$p_config["modulSelect"],"pictSmallWidth"),setConfigValue($p_config,$p_config["modulSelect"],"pictSmallHeight"));
									chmod($pictureNameSmallOrig,0644);
									$pictureNameNormalSAVE = $p_config["modulSelect"]."_".$itemValues["x_id"].setConfigValue($p_config,$p_config["modulSelect"],"pictNormalNamePlus"). $extension;
									$pictureNameNormalOrig = realPath($actualImgPath)."/".$pictureNameNormalSAVE;
									pictureresize($pictureNameOrig,$pictureNameNormalOrig,setConfigValue($p_config,$p_config["modulSelect"],"pictNormalWidth"),setConfigValue($p_config,$p_config["modulSelect"],"pictNormalHeight"));
									chmod($pictureNameNormalOrig,0644);
									$itemValues[$modulEditFieldDIM[1]] = $pictureNameSAVE;
									}
								}
							break;
						case "logoAdd":
							$itemValues[$modulEditFieldDIM[1]] = @$_POST[$modulEditFieldDIM[1]];
							if (@$_FILES[$modulEditFieldDIM[1]]['name']!="") 
								{
								$imagetype = @$_FILES[$modulEditFieldDIM[1]]['type'];
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
									$pictureNameSAVE = substr(@$_FILES[$modulEditFieldDIM[1]]['name'],0,strpos(@$_FILES[$modulEditFieldDIM[1]]['name'],"."))."_".$itemValues["x_id"]. $extension;
									$dirMake = rmkdir($actualImgPath, 0755);
									$pictureNameOrig = realPath($actualImgPath)."/".$pictureNameSAVE;
									move_uploaded_file(@$_FILES[$modulEditFieldDIM[1]]['tmp_name'],$pictureNameOrig);
									chmod($pictureNameOrig,0644);
									$pictureNameSmallSAVE = $p_config["modulSelect"]."_".$itemValues["x_id"].setConfigValue($p_config,$p_config["modulSelect"],"pictSmallNamePlus"). $extension;
									$pictureNameSmallOrig = realPath($actualImgPath)."/".$pictureNameSmallSAVE;
									pictureresize($pictureNameOrig,$pictureNameSmallOrig,setConfigValue($p_config,$p_config["modulSelect"],"logoWidth"),setConfigValue($p_config,$p_config["modulSelect"],"logoHeight"));
									chmod($pictureNameSmallOrig,0644);
									$itemValues[$modulEditFieldDIM[1]] = $pictureNameSmallSAVE;
									}
								}
							break;
						case "fileAdd":
							$itemValues[$modulEditFieldDIM[1]] = @$_POST[$modulEditFieldDIM[1]];
							$fileNameElement = explode(".",@$_FILES[$modulEditFieldDIM[1]]['name']);
							$extension = ".".$fileNameElement[count($fileNameElement)-1];
							if (@$_FILES[$modulEditFieldDIM[1]]['name']!="")
								{
								$fileType = @$_FILES[$modulEditFieldDIM[1]]['type'];
								$dirMake = rmkdir($actualImgPath, 0755);
								$fileNameSAVE = substr(@$_FILES[$modulEditFieldDIM[1]]['name'],0,strpos(@$_FILES[$modulEditFieldDIM[1]]['name'],"."))."_".$itemValues["x_id"]. $extension;
								$fileNameOrig = realPath($actualImgPath)."/".$fileNameSAVE;
								move_uploaded_file(@$_FILES[$modulEditFieldDIM[1]]['tmp_name'],$fileNameOrig);
								chmod($fileNameOrig,0644);
								$itemValues[$modulEditFieldDIM[1]] = $fileNameSAVE;
								}
							break;
						case "active":
							if ($itemValues[$modulEditFieldDIM[1]]==$modulEditFieldDIM[2] && $itemValues["x_active"] != 1)
								{
								$itemValues["x_active"] = 1;
								}
							break;
						case "x_expirationdate":
							$itemValues[$modulEditFieldDIM[0]]=date('Y.m.d',mktime(0,0,0,substr($itemValues[$modulEditFieldDIM[1]],5,2),substr($itemValues[$modulEditFieldDIM[1]],8,2),substr($itemValues[$modulEditFieldDIM[1]],0,4)+1));
							break;
						case "default":
							break;
						}
					}
				// add the values into an array
				if ($p_config["modulSelect"]!="advertlog")
					{
					$itemValues["x_modifyUserID"] = @$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserID"];
					$itemValues["x_modifyWhen"] = db_actual_datetime();
					}
				if (trim($_POST["Action"])==$p_config["configShare"]["saveTitle"] || trim($_POST["Action"])==$p_config["configShare"]["saveNoBackTitle"])
					{
					$fieldList = makeFieldList($p_config, $itemValues, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
					fieldListUpdateSQL($p_config, $fieldList);
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
	$p_config["getAction"]="U";
	$p_config["contentEditHTML"] = modulFrameInputRecord($p_config,$itemValues,$p_config["getAction"]);
	$p_config["navigationHTML"] = footerNavigation($p_config);
	$editHTML = iniCFGParser($p_config["sharedTPL"]["iniCFG"],"##editForm##","##/editForm##");
	$p_config["contentHTML"]=ParseTplForm($editHTML,$p_config,$itemValues);
	return $p_config;
	}
?>