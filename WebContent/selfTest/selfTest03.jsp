<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 불러오기</title>
</head>
<body>
<input id="text" type="textfiled">
<br>
<a id="link" href="">데이터 불러오기</a>
<div id="data">여기에 데이터 불러오기</div>
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
<script>
	window.onload = function(){
		var link = document.getElementById("link");
		link.onclick=function(e){
			e.preventDefault();
			asyncSend();
		}
	}
	
	function getXHR(){
		var req;
		try {
			req = new XMLHttpRequest();
		}catch(e){
			try {
				req = new ActionXObject("Msxml12.XMLHTTP");
			}catch(e){
				req = new ActionXObject("Microsoft.XMLHTTP");
			}
		}
		return req;
	}
	
	function asyncSend(){
		var req = getXHR();
		var text = document.getElementById("text").value;
		alert(text);
		/* text의 value값을 불러옴 */
		
		req.onreadystatechange = function(){
			var data = document.getElementById("data");
			if(req.readyState == 4){
				if(req.status == 200){
					jsonData = JSON.parse(req.responseText);
					alert(jsonData.CATALOG.CD[0][$('#text').val()]);
					txt = '';
					for(i =0; i <jsonData.CATALOG.CD.length; i++){
						txt = txt + jsonData.CATALOG.CD[i][$('#text').val()] + "<br>";
					}
					data.innerHTML = txt;
				} else {
					data.innerHTML = "Server Error!";
				}
			} else {
				data.innerHTML = "Loading..."
			}
		}
		
		req.open('GET','cd_catalog.json');
		req.send(null);
	}
</script>
</body>
</html>