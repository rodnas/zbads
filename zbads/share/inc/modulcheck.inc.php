<?php
function modulFrameCheck($p_config,$p_itemValues)
	{
	$p_config["x_fieldFocus"]="";
	$checkCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##checkCFG##","##/checkCFG##");
	$checkItemsCFG = explode('<#>',$checkCFG);
	if (file_exists($p_config["configShare"]["incPath"].$p_config["modulSelect"].".inc.php"))
		{
		include $p_config["configShare"]["incPath"].$p_config["modulSelect"].".inc.php";
		}
	for ($checkItemCFGCount=0;$checkItemCFGCount<count($checkItemsCFG);$checkItemCFGCount++)
		{
		$checkItemCFG = explode('<=>',trim($checkItemsCFG[$checkItemCFGCount]));
		if (!ISSET($viewItem[$p_config["modulSelect"]."_".$checkItemCFG[1]]) || (ISSET($viewItem) && $viewItem[$p_config["modulSelect"]."_".$checkItemCFG[1]] != 0))
			{
			switch ($checkItemCFG[0])
				{
				case "empty":
					$realString = str_replace("<br>","",$p_itemValues[$checkItemCFG[1]]);
					if (EMPTY($realString))
						{
						$p_config[$p_config["modulSelect"]."_".$checkItemCFG[1]."_Error"] = "<br><span id='errorMessageText'>".$p_config[$p_config["modulSelect"]][$checkItemCFG[2]."EmptyError"]."</span>";
						$p_config["x_errorText"] = $p_config[$p_config["modulSelect"]."_".$checkItemCFG[1]."_Error"];
						}
					break;
				case "email":
					if (!empty($p_itemValues[$checkItemCFG[1]]))
						{ 
						if (!emailValidator($p_itemValues[$checkItemCFG[1]]))
							{
							$p_config[$p_config["modulSelect"]."_".$checkItemCFG[1]."_Error"] = "<br><span id='errorMessageText'>".$p_config[$p_config["modulSelect"]][$checkItemCFG[2]."EmptyError"]."</span>";
							$p_config["x_errorText"] = $p_config[$p_config["modulSelect"]."_".$checkItemCFG[1]."_Error"];
							}
						}
					break;
				case "duplicate":
					if ($p_config["modulAction"] == "add")
						{
						$modulCheckFieldParamDIM = explode(',',$checkItemCFG[3]);
						$strSQL = "SELECT * FROM " . $p_config["modulSelect"] . " WHERE";
						$firstField = 1;
						for ($checkFieldParamCount=0;$checkFieldParamCount<count($modulCheckFieldParamDIM);$checkFieldParamCount++)
							{
							if ($firstField == 0)
								{
								$strSQL .= " AND ";
								}
							else
								{
								$firstField = 0;
								}
							$modulCheckValueParamDIM = explode(';',$modulCheckFieldParamDIM[$checkFieldParamCount]);
							$strSQL .= " ".$modulCheckValueParamDIM[0] . "'".$p_itemValues[$modulCheckValueParamDIM[1]]."'";
							}						
						}
					else if ($p_config["modulAction"] == "edit")
						{
						$modulCheckFieldParamDIM = explode(',',$checkItemCFG[4]);
						$strSQL = "SELECT * FROM " . $p_config["modulSelect"] . " WHERE";
						$firstField = 1;
						for ($checkFieldParamCount=0;$checkFieldParamCount<count($modulCheckFieldParamDIM);$checkFieldParamCount++)
							{
							if ($firstField == 0)
								{
								$strSQL .= " AND ";
								}
							else
								{
								$firstField = 0;
								}
							$modulCheckValueParamDIM = explode(';',$modulCheckFieldParamDIM[$checkFieldParamCount]);
							$strSQL .= " ".$modulCheckValueParamDIM[0] . "'".$p_itemValues[$modulCheckValueParamDIM[1]]."'";
							}						
						}
					$rs = db_query($strSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
					if (db_num_rows($rs) != 0) 
						{	
						$p_config[$p_config["modulSelect"]."_".$checkItemCFG[1]."_Error"] = "<br><span id='errorMessageText'>".$p_config[$p_config["modulSelect"]][$checkItemCFG[2]."DuplicateError"];
						$p_config["x_errorText"] = $p_config[$p_config["modulSelect"]."_".$checkItemCFG[1]."_Error"];
						}
					break;
				case "password":
					if (!EMPTY($p_itemValues[$checkItemCFG[1]]) && $p_itemValues[$checkItemCFG[1]] != $p_itemValues[$checkItemCFG[2]])
						{
						$p_config[$p_config["modulSelect"]."_".$checkItemCFG[1]."_Error"] = "<br><span id='errorMessageText'>".$p_config[$p_config["modulSelect"]][$checkItemCFG[2]."EmptyError"]."</span>";
						$p_config["x_errorText"] = $p_config[$p_config["modulSelect"]."_".$checkItemCFG[1]."_Error"];
						}
					break;
				default:
					break;
				}
			}
		if (!EMPTY($p_config["x_errorText"]) && EMPTY($p_config["x_fieldFocus"]))
			{
			$p_config["x_fieldFocus"] = $checkItemCFG[1];
			}
		}
	return $p_config;
	}
?>