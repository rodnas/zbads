<?php
if ($_GET["tableName"])
	{
	$databaseServer="localhost";
	$databaseUser="root";
	$databasePassword="";
	$databaseSelect="zbads";
	// use database
	$connection = mysql_connect($databaseServer,$databaseUser,$databasePassword); 
	mysql_select_db($databaseSelect, $connection);	
	if ($_GET["tableName"] != "size")
		{
		$sqlwrk = "SELECT id,name FROM ".$_GET["tableName"]." ORDER BY name";
		}
	else
		{
		$sqlwrk = "SELECT id,name,sizeWidth,sizeHeight FROM ".$_GET["tableName"]." ORDER BY name";
		}
	$sql=mysql_query($sqlwrk);
	while($row=mysql_fetch_array($sql))
		{
		$id=$row['id'];
		if ($_POST["x_id"] == $id) $selected = " selected"; else $selected="";
		$data=$row['name'];
		echo '<option ';
		if ($_GET["tableName"] == "size")
			{
			echo 'rel="'.$row["sizeWidth"]."<=>".$row["sizeHeight"].'"';
			}
		echo ' value="'.$id.'"'.$selected.'>'.$data;
		if ($_GET["tableName"] == "size")
			{
			echo " [".$row["sizeWidth"]."x".$row["sizeHeight"]."]";
			}

		echo '</option>';
		}
	}
?>