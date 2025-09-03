function popupCodeClose(tableName,id)
	{
	$("#addFrame").hide();
	$("#popupCode").attr("src","");
	if (typeof tableName != "undefined")
		{
		$.get('/inc/selectreload.php?tableName='+tableName, null, function(resp) {
			$('#x_' + tableName + 'ID').html(resp);
			$('#x_' + tableName + 'ID').val(id);
			sizeChange();
		});
		}
	}
	
function loadXMLDocAdvertiser()
	{
	$("#addFrame").show();
	$("#popupCode").attr("src","index.php?modulSelect=advertiser&modulAction=add&advertisercmd=resetall&whichModul=advert");
	}

function loadXMLDocCampaign()
	{
	$("#addFrame").show();
	$("#popupCode").attr("src","index.php?modulSelect=campaign&modulAction=add&advertisercmd=resetall&whichModul=advert");
	}

function loadXMLDocSource()
	{
	$("#addFrame").show();
	$("#popupCode").attr("src","index.php?modulSelect=source&modulAction=add&advertisercmd=resetall&whichModul=advert");
	}

function loadXMLDocSize()
	{
	$("#addFrame").show();
	$("#popupCode").attr("src","index.php?modulSelect=size&modulAction=add&advertisercmd=resetall&whichModul=advert");
	}

function sizeChange()
	{
	var $select = $('#x_sizeID');
	var value = $select.val();
	var $option = $select.find('option[value="'+value+'"]');
	var rel = $option.attr("rel");
	var size_array = rel.split("<=>");
	$('#x_sizeWidth').val(size_array[0]);
	$('#x_sizeHeight').val(size_array[1]);
	return;
	}

function doIframe()
	{
	o = document.getElementsByTagName('iframe');
	for(i=0;i<o.length;i++)
		{
		if (/\bautoHeight\b/.test(o[i].className))
			{
			setHeight(o[i]);
			addEvent(o[i],'load', doIframe);
			}
		}
	}

function setHeight(e)
	{
	if(e.contentDocument)
		{
		e.height = e.contentDocument.body.offsetHeight + 35;
		}
	else
		{
		e.height = e.contentWindow.document.body.scrollHeight;
		}
	}

function addEvent(obj, evType, fn)
	{
	if(obj.addEventListener)
		{
		obj.addEventListener(evType, fn,false);
		return true;
		}
	else if (obj.attachEvent)
		{
		var r = obj.attachEvent("on"+evType, fn);
		return r;
		}
	else
		{
		return false;
		}
	}

if (document.getElementById && document.createTextNode)
	{
	addEvent(window,'load', doIframe);	
	}
