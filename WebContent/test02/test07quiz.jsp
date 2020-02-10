<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비동기통신</title>
</head>
<body>
	<input type="text" name="q" id="q">
	<input id="get" type="button" value="불러오기">
	<div id="data">여기에 데이터 표시</div>

	<script src="https://code.jquery.com/jquery-2.2.4.min.js"
		integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
		crossorigin="anonymous"></script>

	<script>
  	window.onload = function(){
  		var get = document.getElementById("get");
  		get.onclick=function(e){
  			asyncSend();
  		}
  	}
  	function getXHR(){
  		var req;
  		try{
  			req = new XMLHttpRequest();
  		}catch(e){
  			try{
  				req = new ActiveXObject("Msxm12.XMLHTTP");
  			}catch(e){
  				req = new ActiveXObject("Microsoft.XMLHTTP");
  			}
  		}
  		return req;
  	}
  	
  	function asyncSend(){
  		var req = getXHR();
  		
  		req.onreadystatechange = function(){
  			var data = document.getElementById("data");
  			if(req.readyState == 4){
  				if(req.status == 200){
  					xmlData = req.responseXML;
  					txt = '';
  					x = xmlData.getElementsByTagName($('#q').val());
  					for(i = 0; i < x.length; i++){
  						txt = txt + x[i].childNodes[0].nodeValue + "<br>";
  					}
  					data.innerHTML = txt;
  				}else{
  					data.innerHTML = "Server Error!";
  				}
  			}else {
  				data.innerHTML = "Loading...";
  			}
  		}
  		
  		req.open('GET', 'cd_catalog.xml');
  		req.send(null);
  	}
  </script>

</body>
</html>

