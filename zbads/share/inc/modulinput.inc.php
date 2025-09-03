<?php
function modulFrameInputRecord($p_config, $p_itemValues, $p_getAction)
	{
	$inputCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##inputCFG##","##/inputCFG##");
	$inputItemsCFG = explode('<#>',$inputCFG);
	for ($inputItemCFGCount=0;$inputItemCFGCount<count($inputItemsCFG);$inputItemCFGCount++)
		{
		$inputItemCFG = explode('<=>',trim($inputItemsCFG[$inputItemCFGCount]));
		switch ($inputItemCFG[0])
			{
			case "simple":
				$p_config[$p_config["modulSelect"]."_".$inputItemCFG[1]]=htmlspecialchars($p_itemValues[$inputItemCFG[1]]);
				break;
			case "optionSelect":
				$p_config=optionSelect($p_config,$inputItemCFG[1],$inputItemCFG[2],$inputItemCFG[3],$inputItemCFG[4],$p_itemValues,$p_config["modulSelect"]."_".$inputItemCFG[1]);
				if (isModulAdd($p_config,$inputItemCFG[1]))
					{
					$p_config[$p_config["modulSelect"]."_".$inputItemCFG[1]."_a"] .= "<img alt='' src='" . setConfigValue($p_config,"configShare","imageButton") . "plus.png' border=0 name='".$inputItemCFG[1]."add' title='".setConfigValue($p_config,$inputItemCFG[1],"title")." ".setConfigValue($p_config,"configShare","addTitle") ."'  onclick='loadXMLDoc".ucfirst($inputItemCFG[1])."()'>";
					}
				break;
			case "prevView":
				$p_config[$p_config["modulSelect"]."_".$inputItemCFG[1]]=optionView($p_config,$inputItemCFG[1],$inputItemCFG[2],$inputItemCFG[3],$inputItemCFG[4],$p_itemValues);
				break;
			case "editorText":
				$p_config[$p_config["modulSelect"]."_".$inputItemCFG[1]]=htmlspecialchars($p_itemValues[$inputItemCFG[1]]);
				if (empty($inputItemCFG[2]) || intval($inputItemCFG[2]) < 500) $inputItemCFG[2] = 500;
				if (empty($inputItemCFG[3]) || intval($inputItemCFG[3]) < 150) $inputItemCFG[3] = 150;
				break;
			case "simpleText":
				$p_config[$p_config["modulSelect"]."_".$inputItemCFG[1]]=htmlspecialchars($p_itemValues[$inputItemCFG[1]]);
				if (empty($inputItemCFG[2])) $inputItemCFG[2] = 60;
				if (empty($inputItemCFG[2])) $inputItemCFG[3] = 10;
				break;
			case "checkbox":
				$p_config[$p_config["modulSelect"]."_".$inputItemCFG[1]]=activateTd($p_itemValues,$inputItemCFG[1],"");
				break;
			case "datePanel":
				$p_config[$p_config["modulSelect"]."_".$inputItemCFG[1]]=htmlspecialchars($p_itemValues[$inputItemCFG[1]]);
				break;
			case "pictureView":
				$actualImgPath = $p_config["configShare"]["docrootPath"].$p_config[$p_config["modulSelect"]]["imgPath"];
				$p_config[$p_config["modulSelect"]."_".$inputItemCFG[1]."_p"] = $actualImgPath.$p_itemValues[$inputItemCFG[1]];
				$p_config[$p_config["modulSelect"]."_".$inputItemCFG[1]]=pictureView($p_config, $actualImgPath.$p_itemValues[$inputItemCFG[1]],"",$p_itemValues["x_sizeWidth"],$p_itemValues["x_sizeHeight"]);
				break;
			}
		}
	$inputForm = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##inputForm##","##/inputForm##");
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
					$inputForm = str_replace("<".$viewItemNOW.">","",$inputForm);
					$inputForm = str_replace("</".$viewItemNOW.">","",$inputForm);
					}
				else
					{
					$inputForm = ini2CFGParser($inputForm,"<".$viewItemNOW.">","</".$viewItemNOW.">");
					}
				next($viewItem);
				}
			}
		}

	$resultHTML .= ParseTpl($inputForm,$p_config,"");
	$resultHTML .= modulPositionExplode($p_config, $p_itemValues, "modulPositionParam");
	return $resultHTML;
	}

function modulPositionExplode($p_config, $p_itemValues, $whichPositionPage)	
	{
	$resultHTML = "<SCRIPT type=\"text/javascript\" LANGUAGE=\"JavaScript\">";
	$resultHTML .= "switch (document.".$p_config["modulAction"]."form.fieldFocus.value)";
	$resultHTML .= "{";
	$positionCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##positionCFG##","##/positionCFG##");
	$positionItemsCFG = explode('<#>',$positionCFG);
	if (file_exists($p_config["configShare"]["incPath"].$p_config["modulSelect"].".inc.php"))
		{
		include $p_config["configShare"]["incPath"].$p_config["modulSelect"].".inc.php";
		}
	for ($positionItemCFGCount=0;$positionItemCFGCount<count($positionItemsCFG);$positionItemCFGCount++)
		{
		$positionItemCFG = explode('<=>',trim($positionItemsCFG[$positionItemCFGCount]));
		if (!ISSET($viewItem[$p_config["modulSelect"]."_".$positionItemCFG[0]]) || (ISSET($viewItem) && $viewItem[$p_config["modulSelect"]."_".$positionItemCFG[0]] != 0))
			{
			switch ($positionItemCFG[1])
				{
				case "case":
					$resultHTML .= "case '".$positionItemCFG[0]."' : document.".$p_config["modulAction"]."form.".$positionItemCFG[0].".focus();";
					$resultHTML .= "break;";
					break;
				case "default":
					$resultHTML .= "default : document.".$p_config["modulAction"]."form.".$positionItemCFG[0].".focus();";
					$resultHTML .= "break;";
					break;
				}
			}
		}
	$resultHTML .= "}";
	$resultHTML .= "</script>";
	return $resultHTML;
	}
?>