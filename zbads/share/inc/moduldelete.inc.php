<?php
function modulFrameDelete($p_config)
	{
	if (trim($_POST["Action"])==$p_config["configShare"]["backTitle"])
		{
		jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
		}
	switch ($p_config["getAction"])
		{
		case "I": // display
			$itemValues = modulGetRecord($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
			break;
		case "D": // delete
			$itemValues = modulGetRecord($p_config, setConfigValue($p_config,$p_config["modulSelect"],"mainTable"));
			if (trim($_POST["Action"])==$p_config["configShare"]["deleteTitle"])
				{
				$deleteCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##deleteCFG##","##/deleteCFG##");
				$deleteFieldCFG = explode('<#>',$deleteCFG);
				for ($deleteFieldCFGCount=0;$deleteFieldCFGCount<count($deleteFieldCFG);$deleteFieldCFGCount++)
					{
					$deleteItemCFG = explode('<=>',$deleteFieldCFG[$deleteFieldCFGCount]);
					switch (trim($deleteItemCFG[0]))
						{
						case "simple":
							$deleteSQL = "DELETE FROM ".$deleteItemCFG[1].$p_config[$p_config["modulSelect"]]["key"];
							$resultSQL = db_query($deleteSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
							break;
						case "file":
							if ($p_config[$p_config["modulSelect"]]["hide"] != "1")
								{
								$actualImgPath = $p_config["configShare"]["docrootPath"].$p_config[$p_config["modulSelect"]]["imgPath"];
								}
							else
								{
								$actualImgPath = $p_config["configShare"]["docrootPathHide"].$p_config[$p_config["modulSelect"]]["imgPath"];
								}
							$deleteFile = $actualImgPath.$itemValues[$deleteItemCFG[1]];
							if (is_file($deleteFile))
								{
								unlink($deleteFile);
								}
							break;
						case "pictureResize":
							if ($p_config[$p_config["modulSelect"]]["hide"] != "1")
								{
								$actualImgPath = $p_config["configShare"]["docrootPath"].$p_config[$p_config["modulSelect"]]["imgPath"];
								}
							else
								{
								$actualImgPath = $p_config["configShare"]["docrootPathHide"].$p_config[$p_config["modulSelect"]]["imgPath"];
								}
							$deletePicture = $actualImgPath.$itemValues[$deleteItemCFG[1]];
							if (is_file($deletePicture))
								{
								unlink($deletePicture);
								}
							$deleteSmallPicture = $actualImgPath.str_replace(".",setConfigValue($p_config,$p_config["modulSelect"],"pictSmallNamePlus").".",$itemValues[$deleteItemCFG[1]]);
							if (is_file($deleteSmallPicture))
								{
								unlink($deleteSmallPicture);
								}
							$deleteNormalPicture = $actualImgPath.str_replace(".",setConfigValue($p_config,$p_config["modulSelect"],"pictNormalNamePlus").".",$itemValues[$deleteItemCFG[1]]);
							if (is_file($deleteNormalPicture))
								{
								unlink($deleteNormalPicture);
								}
							break;
						}
					}
				jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
				}
		}
	include "modulview.inc.php";
	$p_config["getAction"]="D";
	$p_config["contentViewHTML"] = modulFrameViewRecord($p_config,$itemValues,$p_config["getAction"]);
	$p_config["navigationHTML"] = footerNavigation($p_config);
	$viewHTML = iniCFGParser($p_config["sharedTPL"]["iniCFG"],"##viewForm##","##/viewForm##");
	$p_config["contentHTML"]=ParseTplForm($viewHTML,$p_config,$itemValues);
	return $p_config;
	}
?>