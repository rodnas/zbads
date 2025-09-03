<?php
function buildSQL($p_config)
	{
	// build SQL
	if ($p_config[$p_config["modulSelect"]]["defaultFilter"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["whereClause"] .= "(" . $p_config[$p_config["modulSelect"]]["defaultFilter"] . ") AND ";
		}
	if ($p_config[$p_config["modulSelect"]]["dbwhere"] <> "" )
		{
		$p_config[$p_config["modulSelect"]]["whereClause"] .= "(" . $p_config[$p_config["modulSelect"]]["dbwhere"] . ") AND ";
		}
	if (!isModulList($p_config,$p_config["modulSelect"]))
		{
//		$p_config[$p_config["modulSelect"]]["whereClause"] .= "(0=1) AND ";
		}
	if (substr($p_config[$p_config["modulSelect"]]["whereClause"], -5) == " AND ")
		{
		$p_config[$p_config["modulSelect"]]["whereClause"] = substr($p_config[$p_config["modulSelect"]]["whereClause"], 0, strlen($p_config[$p_config["modulSelect"]]["whereClause"])-5);
		}
	if ($p_config[$p_config["modulSelect"]]["whereClause"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["strSQL"] .= " WHERE " . $p_config[$p_config["modulSelect"]]["whereClause"];
		}
	if ($p_config[$p_config["modulSelect"]]["GroupBy"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["strSQL"] .= " GROUP BY " . $p_config[$p_config["modulSelect"]]["GroupBy"] . " ";
		}
	if ($p_config[$p_config["modulSelect"]]["OrderBy"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["strSQL"] .= " ORDER BY " . $p_config[$p_config["modulSelect"]]["OrderBy"] . " " . @$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OT"];
		}
	if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] == 2)
		{
		debugPrintValue($p_config, '$p_config[$p_config["modulSelect"]]["strSQL"]', $p_config[$p_config["modulSelect"]]["strSQL"], 0);
		}
	return $p_config;
	}

function buildSQLUnion($p_config)
	{
	// build SQL
	if ($p_config[$p_config["modulSelect"]]["defaultFilter"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["whereClause"] .= "(" . $p_config[$p_config["modulSelect"]]["defaultFilter"] . ") AND ";
		}
	if ($p_config[$p_config["modulSelect"]]["dbwhere"] <> "" )
		{
		$p_config[$p_config["modulSelect"]]["whereClause"] .= "(" . $p_config[$p_config["modulSelect"]]["dbwhere"] . ") AND ";
		}
	if (($p_config[$p_config["modulSelect"]]["allRecs"] & ewAllowList) <> ewAllowList)
		{
		$p_config[$p_config["modulSelect"]]["whereClause"] .= "(0=1) AND ";
		}
	if (substr($p_config[$p_config["modulSelect"]]["whereClause"], -5) == " AND ")
		{
		$p_config[$p_config["modulSelect"]]["whereClause"] = substr($p_config[$p_config["modulSelect"]]["whereClause"], 0, strlen($p_config[$p_config["modulSelect"]]["whereClause"])-5);
		}
	if ($p_config[$p_config["modulSelect"]]["whereClause"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["strSQL"] .= " WHERE " . $p_config[$p_config["modulSelect"]]["whereClause"];
		}
	if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"] . "status_UserLevel"] == 2)
		{
		debugPrintValue($p_config, '$p_config[$p_config["modulSelect"]]["strSQL"]', $p_config[$p_config["modulSelect"]]["strSQL"], 0);
		}
	return $p_config;
	}

function checkOrder($p_config)
	{
	// check for an Order parameter
	$p_config[$p_config["modulSelect"]]["OrderBy"] = "";
	if (@$_GET[$p_config["modulSelect"]."order"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["OrderBy"] = $_GET[$p_config["modulSelect"]."order"];
		// check if an ASC/DESC/NOSORT toggle is required
		if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OB"] == $p_config[$p_config["modulSelect"]]["OrderBy"])
			{
			if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OT"] == "ASC")
				{
				$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OT"] = "DESC";
				}
			else if (@$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OT"] == "DESC")
				{
				$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OT"] = "NOSORT";
				$p_config[$p_config["modulSelect"]]["OrderBy"] = "";
				}
			else
				{
				$_SESSION_[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OT"] = "ASC";
				}
			}
		else
			{
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OT"] = "ASC";
			}
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OB"] = $p_config[$p_config["modulSelect"]]["OrderBy"];
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_REC"] = 1;
		}
	else
		{
		$p_config[$p_config["modulSelect"]]["OrderBy"] = @$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OB"];
		if ($p_config[$p_config["modulSelect"]]["OrderBy"] == "")
			{
			$p_config[$p_config["modulSelect"]]["OrderBy"] = $p_config[$p_config["modulSelect"]]["defaultOrder"];
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OB"] = $p_config[$p_config["modulSelect"]]["OrderBy"];
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_OT"] = $p_config[$p_config["modulSelect"]]["defaultOrderType"];
			}
		}
	return $p_config;
	}

function checkStart($p_config)
	{
	// check for a START parameter
	if (@$_GET[$p_config["modulSelect"]."start"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["startRec"] = $_GET[$p_config["modulSelect"]."start"];
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_REC"] = $p_config[$p_config["modulSelect"]]["startRec"];
		}
	elseif (@$_GET[$p_config["modulSelect"]."pageno"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["pageno"] = $_GET[$p_config["modulSelect"]."pageno"];
		if (is_numeric($p_config[$p_config["modulSelect"]]["pageno"]))
			{
			$p_config[$p_config["modulSelect"]]["startRec"] = ($p_config[$p_config["modulSelect"]]["pageno"] - 1)*setConfigValue($p_config,"configShare","displayRecs") + 1;
			if ($p_config[$p_config["modulSelect"]]["startRec"] <= 0)
				{
				$p_config[$p_config["modulSelect"]]["startRec"] = 1;
				}
			elseIf ($p_config[$p_config["modulSelect"]]["startRec"] >= (($p_config[$p_config["modulSelect"]]["totalRecs"]-1)/setConfigValue($p_config,"configShare","displayRecs"))*setConfigValue($p_config,"configShare","displayRecs")+1)
				{
				$p_config[$p_config["modulSelect"]]["startRec"] = (($p_config[$p_config["modulSelect"]]["totalRecs"]-1)/setConfigValue($p_config,"configShare","displayRecs"))*setConfigValue($p_config,"configShare","displayRecs") + 1;
				}
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_REC"] = $p_config[$p_config["modulSelect"]]["startRec"];
			}
		else
			{
			$p_config[$p_config["modulSelect"]]["startRec"] = @$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_REC"];
			if (!is_numeric($p_config[$p_config["modulSelect"]]["startRec"]))
				{			
				$p_config[$p_config["modulSelect"]]["startRec"] = 1; // reset start record counter
				$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_REC"] = $p_config[$p_config["modulSelect"]]["startRec"];
				}
			}
		}
	else
		{
		$p_config[$p_config["modulSelect"]]["startRec"] = @$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_REC"];
		if (!is_numeric($p_config[$p_config["modulSelect"]]["startRec"]))
			{		
			$p_config[$p_config["modulSelect"]]["startRec"] = 1; // reset start record counter
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_REC"] = $p_config[$p_config["modulSelect"]]["startRec"];
			}
		}	
	if ($p_config["configShare"]["startReset"] == 1)
		{
		$p_config[$p_config["modulSelect"]]["startRec"] = 1; // reset start record counter
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_REC"] = $p_config[$p_config["modulSelect"]]["startRec"];
		$p_config["configShare"]["startReset"] = 0;
		}
//	$_SESSION[$p_config["configShare"]["whichSystemAndMode"] .$p_config["modulSelect"]. "startRec"]=$p_config[$p_config["modulSelect"]]["startRec"];
	return $p_config;
	}

function buildWhere($p_config)
	{
	// build dbwhere
	if ($p_config[$p_config["modulSelect"]]["masterDetailWhere"] <> "" )
		{
		$p_config[$p_config["modulSelect"]]["dbwhere"] .= "(" . $p_config[$p_config["modulSelect"]]["masterDetailWhere"] . ") AND ";
		}
	if ($p_config[$p_config["modulSelect"]]["searchWhere"] <> "" )
		{
		$p_config[$p_config["modulSelect"]]["dbwhere"] .= "(" . $p_config[$p_config["modulSelect"]]["searchWhere"] . ") AND ";
		}
	if (strlen($p_config[$p_config["modulSelect"]]["dbwhere"]) > 5)
		{
		$p_config[$p_config["modulSelect"]]["dbwhere"] = substr($p_config[$p_config["modulSelect"]]["dbwhere"], 0, strlen($p_config[$p_config["modulSelect"]]["dbwhere"])-5); // trim rightmost AND
		}
	return $p_config;
	}

function buildSearch($p_config)
	{
	// build search criteria
	if ($p_config[$p_config["modulSelect"]]["advancedSearch"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["searchWhere"] = $p_config[$p_config["modulSelect"]]["advancedSearch"]; //advanced search
		}
	elseIf ($p_config[$p_config["modulSelect"]]["basicSearch"] <> "")
		{
		$p_config[$p_config["modulSelect"]]["searchWhere"] = $p_config[$p_config["modulSelect"]]["basicSearch"]; //basic search
		}
	return $p_config;
	}

function saveSearch($p_config)
	{
	// save search criteria
	if ($p_config[$p_config["modulSelect"]]["searchWhere"] <> "")
		{
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."_searchWhere"] = $p_config[$p_config["modulSelect"]]["searchWhere"];	
		$p_config[$p_config["modulSelect"]]["startRec"] = 1; //reset start record counter (new search)
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."_REC"] = $p_config[$p_config["modulSelect"]]["startRec"];
		}
	else
		{
		$p_config[$p_config["modulSelect"]]["searchWhere"] = @$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"]."_searchWhere"];
		}
	return $p_config;
	}

function clearSearch($p_config)
	{
	// get clear search cmd
	if (@$_GET[$p_config["modulSelect"]."cmd"] <> "")
		{
		$p_config[$p_config["modulSelect"]."cmd"] = $_GET[$p_config["modulSelect"]."cmd"];
		if (strtoupper($p_config[$p_config["modulSelect"]."cmd"]) == "RESET")
			{
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"] .$p_config["modulSelect"]. "startRec"]=1;
			$p_config[$p_config["modulSelect"]]["searchWhere"] = ""; //reset search criteria
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "pSearchOriginal"] = "";
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_searchWhere"] = $p_config[$p_config["modulSelect"]]["searchWhere"];
			}
		elseif (strtoupper($p_config[$p_config["modulSelect"]."cmd"]) == "RESETALL")
			{		
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"] .$p_config["modulSelect"]. "startRec"]=1;
			$p_config[$p_config["modulSelect"]]["searchWhere"] = ""; //reset search criteria
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "pSearchOriginal"] = "";
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_searchWhere"] = $p_config[$p_config["modulSelect"]]["searchWhere"];
			$p_config[$p_config["modulSelect"]]["key_m"] = "";
			$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_masterkey"] = $p_config[$p_config["modulSelect"]]["key_m"]; // clear master key
			$p_config[$p_config["modulSelect"]]["masterDetailWhere"] = "";
			}	
		$p_config[$p_config["modulSelect"]]["startRec"] = 1; //reset start record counter (reset command)
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "_REC"] = $p_config[$p_config["modulSelect"]]["startRec"];

		}
	$p_config[$p_config["modulSelect"]]["pSearchOriginal"] = $_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "pSearchOriginal"];
	return $p_config;
	}

function tableExist($p_config,$p_tableName)
	{
	$is_table = true;
	$tableExistSQL = "SELECT * FROM ".$p_tableName . " LIMIT 1";
	$tableExistRs = db_query($tableExistSQL, setConfigValue($p_config,"configShare","conn"));
	if (empty($tableExistRs))
		{
		$is_table = false;
		}
	return $is_table;		
	}

function fieldListInsertSQL($p_config, $p_fieldList)
	{
	// insert into database
	$insertItemSQL = "INSERT INTO " . setConfigValue($p_config,$p_config["modulSelect"],"mainTable") . " (";
	$insertItemSQL .= implode(",", array_keys($p_fieldList));
	$insertItemSQL .= ") VALUES (";
	$insertItemSQL .= implode(",", array_values($p_fieldList));
	$insertItemSQL .= ")";
 	db_query($insertItemSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
	}

function fieldListUpdateSQL($p_config, $p_fieldList)
	{
	// update
	$updateItemSQL = "UPDATE " . setConfigValue($p_config,$p_config["modulSelect"],"mainTable") . " SET ";
	foreach ($p_fieldList as $key=>$temp)
		{
		$updateItemSQL .= "$key = $temp, ";			
		}
	if (substr($updateItemSQL, -2) == ", ")
		{
		$updateItemSQL = substr($updateItemSQL, 0, strlen($updateItemSQL)-2);
		}
	$updateItemSQL .= " WHERE ".$p_config[$p_config["modulSelect"]]["sqlKey"];
  	$updateResult = db_query($updateItemSQL, setConfigValue($p_config,"configShare","conn")) or die(db_error());
	}

function treeCounter($p_config,$p_treeActualSQL)
	{
	$treeActualRs = db_query($p_treeActualSQL, $p_config["configShare"]["conn"]);
	$treeActualRow = db_fetch_array($treeActualRs);
	$treeCounter = $treeActualRow["treecounter"];
	db_free_result($treeActualRs);
	return $treeCounter;
	}

function itemValuesFromDB($p_config, $p_tableName)
	{
	// get data from db
	$structureResult = mysqli_query("SHOW COLUMNS FROM ".$p_tableName);
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
//		$itemValues["x_".$fieldNames[$counter]] = $p_config[$p_tableName]["resultRow"][$fieldNames[$counter]];
		$itemValues["x_".$fieldNames[$counter]] = $p_config[$p_config["modulSelect"]]["resultRow"][$fieldNames[$counter]];
		$counter++;
		}
	return $itemValues;
	}

function basicSearch($p_config)
	{
	// get search criteria for basic search
	$p_config[$p_config["modulSelect"]]["pSearch"]=@$_POST[$p_config["modulSelect"]."psearch"];
	$p_config[$p_config["modulSelect"]]["pSearchOriginal"]=$p_config[$p_config["modulSelect"]]["pSearch"];
	$p_config[$p_config["modulSelect"]]["pSearchType"] = @$_POST[$p_config["modulSelect"]."psearchtype"];
	if ($p_config[$p_config["modulSelect"]]["pSearch"] <> "")
		{
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"].$p_config["modulSelect"] . "pSearchOriginal"] = $p_config[$p_config["modulSelect"]]["pSearchOriginal"];
		$_SESSION[$p_config["configShare"]["whichSystemAndMode"] .$p_config["modulSelect"]. "startRec"]=1;
		if ($p_config[$p_config["modulSelect"]]["pSearchType"] <> "")
			{
			while (strpos($p_config[$p_config["modulSelect"]]["pSearch"], "  ") > 0)
				{
				$p_config[$p_config["modulSelect"]]["pSearch"] = str_Replace("  ", " ",$p_config[$p_config["modulSelect"]]["pSearch"]);
				}
			$arpSearch = explode(" ", trim($p_config[$p_config["modulSelect"]]["pSearch"]));
			foreach ($arpSearch as $kw)
				{
				$p_config[$p_config["modulSelect"]]["basicSearch"] .= "(";
				if (ISSET($p_config[$p_config["modulSelect"]]["iniCFG"]))
					{
					$basicSearchCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##basicSearchFieldsCFGCFG##","##/basicSearchFieldsCFG##");
					$basicSearchDIM = explode('<#>',$basicSearchCFG);
					for ($i=0;$i<count($basicSearchDIM);$i++)
						{
						$p_config[$p_config["modulSelect"]]["basicSearch"] .= $basicSearchDIM[$i]." LIKE '%" . trim($kw) . "%' OR ";
						}
					}
				else
					{
					$basicSearchDIM = explode('#',$p_config[$p_config["modulSelect"]]["basicSearchFields"]);
					for ($i=0;$i<count($basicSearchDIM);$i++)
						{
						$p_config[$p_config["modulSelect"]]["basicSearch"] .= $basicSearchDIM[$i]." LIKE '%" . trim($kw) . "%' OR ";
						}
					}
				if (substr($p_config[$p_config["modulSelect"]]["basicSearch"], -4) == " OR ")
					{
					$p_config[$p_config["modulSelect"]]["basicSearch"] = substr($p_config[$p_config["modulSelect"]]["basicSearch"], 0, strlen($p_config[$p_config["modulSelect"]]["basicSearch"])-4);
					}
				$p_config[$p_config["modulSelect"]]["basicSearch"] .= ") " . $p_config[$p_config["modulSelect"]]["pSearchType"] . " ";
				}
			}
		else
			{
			if (ISSET($p_config[$p_config["modulSelect"]]["iniCFG"]))
				{
				$basicSearchCFG = iniCFGParser($p_config[$p_config["modulSelect"]]["iniCFG"],"##basicSearchFieldsCFG##","##/basicSearchFieldsCFG##");
				$basicSearchDIM = explode('<#>',$basicSearchCFG);
				for ($i=0;$i<count($basicSearchDIM);$i++)
					{
					$p_config[$p_config["modulSelect"]]["basicSearch"].= $basicSearchDIM[$i]." LIKE '%" . $p_config[$p_config["modulSelect"]]["pSearch"] . "%' OR ";
					}
				}
			else
				{
				$basicSearchDIM = explode('#',$p_config[$p_config["modulSelect"]]["basicSearchFields"]);
				for ($i=0;$i<count($basicSearchDIM);$i++)
					{
					$p_config[$p_config["modulSelect"]]["basicSearch"].= $basicSearchDIM[$i]." LIKE '%" . $p_config[$p_config["modulSelect"]]["pSearch"] . "%' OR ";
					}
				}
			}
		}
	if (substr($p_config[$p_config["modulSelect"]]["basicSearch"], -4) == " OR ")
		{
		$p_config[$p_config["modulSelect"]]["basicSearch"] = substr($p_config[$p_config["modulSelect"]]["basicSearch"], 0, strlen($p_config[$p_config["modulSelect"]]["basicSearch"])-4);
		}
	if (substr($p_config[$p_config["modulSelect"]]["basicSearch"], -5) == " AND ")
		{
		$p_config[$p_config["modulSelect"]]["basicSearch"] = substr($p_config[$p_config["modulSelect"]]["basicSearch"], 0, strlen($p_config[$p_config["modulSelect"]]["basicSearch"])-5);
		}
	return $p_config;
	}

function modulGetRecord($p_config, $p_itemValues)
	{
	if (setConfigValue($p_config,$p_config["modulSelect"],"mainTable")!="users")
		{
		$getRecordSQL = "SELECT ".setConfigValue($p_config,$p_config["modulSelect"],"mainTable").".*,";
		$getRecordSQL .= "(SELECT users.nickname FROM users WHERE users.id = ".setConfigValue($p_config,$p_config["modulSelect"],"mainTable").".insertUserID ) AS insert_user_name,";
		$getRecordSQL .= "(SELECT users.nickname FROM users WHERE users.id = ".setConfigValue($p_config,$p_config["modulSelect"],"mainTable").".modifyUserID ) AS modify_user_name";
		$getRecordSQL .= " FROM " . setConfigValue($p_config,$p_config["modulSelect"],"mainTable");
		$getRecordSQL .= " WHERE " . $p_config[$p_config["modulSelect"]]["sqlKey"];
		}
	else
		{
		$getRecordSQL = "SELECT ".setConfigValue($p_config,$p_config["modulSelect"],"mainTable").".*";
		$getRecordSQL .= " FROM " . setConfigValue($p_config,$p_config["modulSelect"],"mainTable");
		$getRecordSQL .= " WHERE " . $p_config[$p_config["modulSelect"]]["sqlKey"];
		}
	$getRecordResult = db_query($getRecordSQL,$p_config["configShare"]["conn"]) or die(db_error());
	if (db_num_rows($getRecordResult) == 0)
		{
		jumpToPage($p_config[$p_config["modulSelect"]]["whichBack"]);
		}
	$p_config[$p_config["modulSelect"]]["resultSQL"] = db_query($getRecordSQL, $p_config["configShare"]["conn"]);
	$p_config[$p_config["modulSelect"]]["resultRow"] = db_fetch_array($p_config[$p_config["modulSelect"]]["resultSQL"]);	

	$p_itemValues =array();
	foreach ($p_config[$p_config["modulSelect"]]["resultRow"] as $key => $value) {
		$p_itemValues["x_".$key] = $value; 
	}
	$p_itemValues["x_insert_user_id"] = $p_config[$p_config["modulSelect"]]["resultRow"]["insert_user_id"];
	$p_itemValues["x_modify_user_id"] = $p_config[$p_config["modulSelect"]]["resultRow"]["modify_user_id"];
	$p_itemValues["x_insert_user_name"] = $p_config[$p_config["modulSelect"]]["resultRow"]["insert_user_name"];
	$p_itemValues["x_modify_user_name"] = $p_config[$p_config["modulSelect"]]["resultRow"]["modify_user_name"];
	db_free_result($getRecordResult);
	return $p_itemValues;
	}



/* backup the db OR just a table */
function backup_db($host,$user,$pass,$name,$tables = '*')
	{
/*
	// if mysqldump is on the system path you do not need to specify the full path
	// simply use "mysqldump --add-drop-table ..." in this case
	$dumpfname = $name . "_" . date("YmdHis").".sql";
	$command = "D:\\prog\\xampp183\\mysql\\bin\\mysqldump --add-drop-table --host=$host --user=$user ";
	if ($pass)
		{
		$command.= "--password=". $pass ." ";
		}
	$command.= $name;
	$command.= " > " . $dumpfname;
	system($command);
 
	// zip the dump file
	$zipfname = '../sql/'.$name . "_" . date("YmdHis").".zip";
	$zip = new ZipArchive();
	if($zip->open($zipfname,ZIPARCHIVE::CREATE))
		{
		$zip->addFile($dumpfname,$dumpfname);
		$zip->close();
		}
	unlink($dumpfname);
*/
	}

?>