<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#btnLogin").click(function(){
		var param = "userid=" + $("#userid").val()
		+ "&passwd=" + $("#passwd").val();
		
		$.ajax({
			type : "post",
			url : "/jsp02/member2_Servlet/login.do",
			data : param,
			success : function(result){
				$("#result").html(result);
			}
		});
		
	});
});

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

<h2>로그인?</h2>
<br><br><hr><br><br>
<table>
	<tr>
		<th colspan="2">로그인</th>
	</tr>
	<tr>
		<th>아이디 : </th>
		<td><input id="userid"></td>
	</tr>
	<tr>
		<th>비밀번호 : </th>
		<td><input id="passwd"></td>
	</tr>
	<tr>
		<th colspan="2"><button id="btnLogin">로그인~</button></th>
	</tr>
	<tr>
		<td colspan="2"><div id="result"></div></td>
	</tr>
</table>


</body>
</html>