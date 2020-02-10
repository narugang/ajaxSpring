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
		/* textarea에서 변수를 받아와서 그 변수를 보내서 값을 받아와야한다. */
		var text = document.getElementById("text").value
		alert(text);
		req.onreadystatechange = function(){
			var data = document.getElementById("data");
			if(req.readyState == 4){
				if(req.status == 200){
					alert(text); /* value를 불러오는지 확인 */
					jsonData = JSON.parse(req.responseText);
					xmlData = req.responseXML;
					
					for(i =0; i <jsonData.CATALOG.CD.length; i++){
						alert(jsonData.CATALOG.CD[i].value === text);
						
					}
					
					
					
					alert(jsonData.CATALOG.CD[i].value === document.getElementById("text").value); /* test만 써서는 변수를 가져오는게 불가능 */
					alert(xmlData.ARTIST.CD == document.getElementById("text").value);
					txtC = '';
					txtX = '';
					
					for(i =0; i <jsonData.CATALOG.CD.length; i++){
						txtC = jsonData.CATALOG.CD[i] == test + "<br>";
						
					}
					data.innerHTML = txtC;
					
					for(i =0; i <xmlData.CATALOG.CD.length; i++){
						txtX = xmlData.ARTIST.CD[i] == test + "<br>";
					}
					data.innerHTML = txtX;
				} else {
					data.innerHTML = "Server Error!";
				}
			} else {
				data.innerHTML = "Loading..."
			}
		}
		req.open('GET','cd_catalog.xml');
		req.open('GET','cd_catalog.json');
		req.send(null);
	}
</script>
</body>
</html>