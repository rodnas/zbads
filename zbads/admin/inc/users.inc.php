<?php
$viewItem['users_x_langID']=0;
$viewItem['users_x_description']=0;
$viewItem['users_x_newsletter']=0;
if ($p_config["modulAction"]=="edit")
	{
	$viewItem['users_x_password']=0;
	$viewItem['users_x_password2']=0;
	}
if ($p_config["modulAction"] == "list")
	{
	$viewItem['users_x_insertWhen']=0;
	}
?>