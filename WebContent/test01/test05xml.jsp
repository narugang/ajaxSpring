<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동기 통신</title>
</head>
<body>
<div id="data">여기에 데이터 표시</div>
<a id="link" href="ajaxtest.txt">데이터 불러오기</a>
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
		
		req.onreadystatechange = function(){
			var data = document.getElementById("data");
			if(req.readyState == 4){
				if(req.status == 200){
					xmlData = req.responseXML;
					/* alert(xmlData); */
					txt = '';
					x = xmlData.getElementsByTagName("ARTIST");
					for(i =0; i <x.length; i++){
						/* alert(x[i]); */
						txt = txt + x[i].childNodes[0].nodeValue + "<br>";
					}
					data.innerHTML = txt;
				} else {
					data.innerHTML = "Server Error!";
				}
			} else {
				data.innerHTML = "Loading..."
			}
		}
		
		req.open('GET','cd_catalog.xml');
		req.send(null);
	}
</script>
</body>
</html>