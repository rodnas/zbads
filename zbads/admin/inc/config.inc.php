<?php
// user levels
define("ewAllowAdd", 1, true);
define("ewAllowDelete", 2, true);
define("ewAllowEdit", 4, true);
define("ewAllowView", 8, true);
define("ewAllowList", 8, true);
define("ewAllowSearch", 8, true);
define("ewAllowAdmin", 16, true);

// database connect
$config["configShare"]["databaseType"] = "mysql";
$config["configShare"]["languageType"] = "hu";
$config["configShare"]["setNames"]="set names utf8";
switch(strtolower($_SERVER['HTTP_HOST'])) {
	case 'localhost':
	case 'localhost.site':		// Xampp
	case 'zbads.site':
		$config["configShare"]["databaseServer"] = "localhost";
		$config["configShare"]["databaseSelect"] = "zbads";
		$config["configShare"]["databaseUser"] = "root";
		$config["configShare"]["databasePassword"] = "";
		break;
	case 'localhost:81':		// Laragon
	case 'zbads:81':
		$config["configShare"]["databaseServer"] = "localhost:3307";
		$config["configShare"]["databaseSelect"] = "zbads";
		$config["configShare"]["databaseUser"] = "root";
		$config["configShare"]["databasePassword"] = "";
		break;
	case 'locphp70:8012':
	case 'locphp73:8012':
	case 'locphp74:8012':
	case 'locphp81:8012':
	case 'local:8012':
	case 'localhost:8012':
		$config["configShare"]["databaseServer"] = "localhost:3308";
		$config["configShare"]["databaseSelect"] = "zbads";
		$config["configShare"]["databaseUser"] = "root";
		$config["configShare"]["databasePassword"] = "";
		break;
	case 'localhost.docker:8100':	// Docker
	case 'zbads.docker:8100':
		$config["configShare"]["databaseServer"] = "database:3306";
		$config["configShare"]["databaseSelect"] = "zbads";
		$config["configShare"]["databaseUser"] = "root";
		$config["configShare"]["databasePassword"] = "tiger";
		break;
	case 'localhost.server':	// Guest Ubuntu Server
	case 'zbads.server':
	case 'localhost.desktop':	// Guest Ubuntu Server
	case 'zbads.desktop':
		$config["configShare"]["databaseServer"] = "localhost";
		$config["configShare"]["databaseSelect"] = "zbads";
		$config["configShare"]["databaseUser"] = "root";
		$config["configShare"]["databasePassword"] = "123";
		break;
	default:
		$config["configShare"]["databaseServer"] = "localhost";
		$config["configShare"]["databaseSelect"] = "zbads";
		$config["configShare"]["data7baseUser"] = "root";
		$config["configShare"]["databasePassword"] = "";
		break;
}


$config["configShare"]["iniCFG"] = cfgUp("configshare",$config,"admin/cfg/");
$modulCFG = iniCFGParser($config["configShare"]["iniCFG"],"##modulCFG##","##/modulCFG##");
$modulFieldsCFG = explode('<#>',$modulCFG);
for ($modulFieldCFGCount=0;$modulFieldCFGCount<count($modulFieldsCFG);$modulFieldCFGCount++)
	{
	$modulFieldCFG = explode('<=>',$modulFieldsCFG[$modulFieldCFGCount]);
	$config["configShare"][trim($modulFieldCFG[0])]=ParseCFG(trim($modulFieldCFG[1]),$config);
	}

function cfgUp($name,$config,$p_cfgPATH)
	{
	$addDir=$p_cfgPATH;
	$ext='cfg';
	if (file_exists($addDir."{$name}.{$ext}"))
		{ 
		$cfg='';
		$cont=file($addDir.$name.'.'.$ext);
		while(list($line_num,$line)=each($cont)) $cfg.=$line;
		$config = ParseCFG($config["configShare"]["iniCFG"],$config);
		return $cfg;
		}
	else die ("CFG NEM TALÁLTAM: $name");
	}

function ParseCFG($cfg,$p_config)
	{
	$ex=explode ('##START##',$cfg);
	for ($i=0; $i<sizeof($ex); $i++)
		{
		if (substr_count($ex[$i],'##STOP##')>0)
			{
			$xxpdfParseTpl=explode('##STOP##',$ex[$i]);
			$funParam = explode('#',$xxpdfParseTpl[0]);
			switch($funParam[0])
				{
				case "configShare":
					$configSize = sizeof($funParam);
					$to=$p_config[$funParam[0]][$funParam[1]];
					break;
				case "SERVER_NAME":
					$to=strtolower($_SERVER['SERVER_NAME']);
					break;
				case "SERVER_ADDR":
					$to=strtolower($_SERVER['SERVER_ADDR']);
					break;
				case "REMOTE_NAME":
					$to=strtolower($_SERVER['SERVER_NAME']);
					break;
				case "REMOTE_ADDR":
					$to=strtolower($_SERVER['SERVER_ADDR']);
					break;
				case "REMOTE_HOST":
					$to=strtolower(gethostbyaddr($_SERVER['SERVER_ADDR']));
					break;
				}
			$cfg=str_replace('##START##'.$xxpdfParseTpl[0].'##STOP##', $to, $cfg);
			}
		}
	return $cfg;
	}

function iniCFGParser($mainCFG,$startCFG,$stopCFG)
	{
	$result = trim(substr($mainCFG,0,strpos($mainCFG,$stopCFG)));
	$result = trim(substr($result,strpos($result,$startCFG)+strlen($startCFG)));
	return $result;
	}

function ini2CFGParser($mainCFG,$startCFG,$stopCFG)
	{
	if (strpos($mainCFG,$startCFG) > 0)
		{
		$result = trim(substr($mainCFG,0,strpos($mainCFG,$startCFG)));
		$result .= trim(substr($mainCFG,strpos($mainCFG,$stopCFG)+strlen($stopCFG)));
		}
	else
		{
		$result = $mainCFG;
		}
	return $result;
	}
?>