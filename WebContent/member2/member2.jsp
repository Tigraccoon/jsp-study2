<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function(){
	list();
});

function list(){
	$.ajax({
		type : "post",
		url : "/jsp02/member2_Servlet/list.do",
		success : function(result){
			$("#member2List").html(result);
		}
	});
}


</script>

<style type="text/css">
body{
	background: #cccccc;
	text-align: center;
}
table{
	background : white;
	border-collapse: collapse;
	border-spacing: 0;
	border: 2px solid black;
	margin: auto;
}
th, td{
	padding: 10px;
	text-align: center;
	vertical-align: middle;
	border: 0.3px solid black;
}
th{
	background: #8BB7FF;
}
div{
	background: white;
	padding: 100px;
}
</style>
</head>
<body>

<h2>회원 관리</h2>
<br><br><br>

<table>


</table>

<br><br><br><hr><br><br><br>

<div id="member2List"></div>



</body>
</html>