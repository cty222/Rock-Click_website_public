function preHandler (responseText, callback, errorCallback) {
	var status = JSON.parse(responseText).status;
	if (status == "ok") {
		if (callback != null) callback(responseText);
	}
    /*else if (status == "not_login") {
		window.location = '<%= main_app.new_user_session_path %>'
    }*/
    else if (status == 'need_reflesh'){
		window.location.reload(true); //如果不填或是false會從cache讀, 而非server
	}
	else{
		errorCallback();
	}
}

function fill_in_ajax_info(inputData, page_name) {
	var sendData = new Object();
	sendData.pageName = page_name;
	sendData.async = "True";
	sendData.data = inputData;
	sendData.requestType = "POST";
	sendData.errorHandler = null;
	sendData.contentType = "application/json;charset=UTF-8";
	sendData.callback = inputData.callback;
	xmlhttpAjax (sendData);
}

function xmlhttpAjax(Info) {
	if (Info.errorHandler == null) {
		Info.errorHandler = function () {
			alert ("xmlhttpGet error!!") ;
		}
	}
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp=new XMLHttpRequest();
		xmlhttp.onreadystatechange=function()
		{
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		  {
			  if (xmlhttp.responseText == "" || xmlhttp.responseText == null)
			  {
				Info.errorHandler ();
			  }
			  Info.callback(xmlhttp.responseText);
		  } // 502 錯誤好像不是code錯誤 是 ISP相關錯誤
		  else if (xmlhttp.readyState==4 && xmlhttp.status!=200 && xmlhttp.status !=0 && xmlhttp.status!= 502) 
		  {
		  	Info.errorHandler ();
		  }
		};
		xmlhttp.open(Info.requestType, Info.pageName, Info.async);
		xmlhttp.setRequestHeader("Content-Type", Info.contentType);
		xmlhttp.setRequestHeader("Accept", "application/json");
		// Rails only?
		var token=$('meta[name="csrf-token"]').attr('content');
		xmlhttp.setRequestHeader('X-CSRF-Token',token);
		//alert(JSON.stringify(Info.SendData));  //for debug
		xmlhttp.send(JSON.stringify(Info.data));
	}
}

function TestResponse(response)
{
	alert(response);
}