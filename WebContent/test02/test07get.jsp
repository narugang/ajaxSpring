<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비동기통신</title>
</head>
<body>
	<div id="data">여기에 데이터 표시</div>
	n1: <input type="text" name="n1" id="n1">
	n2: <input type="text" name="n2" id="n2">
	<input id="calc" type="button" value="더하기">

	<script src="https://code.jquery.com/jquery-2.2.4.min.js"
		integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
		crossorigin="anonymous"></script>

	<script>
  	window.onload = function(){
  		var calc = document.getElementById("calc");
  		calc.onclick=function(e){
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
  					data.innerHTML = req.responseText;
  				}else{
  					data.innerHTML = "Server Error!";
  				}
  			}else {
  				data.innerHTML = "Loading...";
  			}
  		}
  		
  		req.open('GET', 'response.jsp?'+'n1='+$('#n1').val()+'&n2='+$('#n2').val());
  		req.send(null);
  	}
  </script>

</body>
</html>

