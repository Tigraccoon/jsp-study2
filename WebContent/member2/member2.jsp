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
	$("#btnInsert").click(function(){
		insert();
	});
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

function insert(){
	var param="userid="+$("#userid").val()
    +"&passwd="+$("#passwd").val()
    +"&name="+$("#name").val()
    +"&email="+$("#email").val()
    +"&hp="+$("#hp").val()
    +"&zipcode="+$("#zipcode").val()
    +"&address1="+$("#address1").val()
    +"&address2="+$("#address2").val();
	
	$.ajax({
		type: "post",
		url: "/jsp02/member2_Servlet/insert.do",
		data: param,
		success:function(){
			list();//회원목록 갱신
			//입력값 초기화
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
			$("#zipcode").val("")
			$("#address1").val("")
			$("#address2").val("");
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
	<tr>
		<th colspan="2">회원 추가</th>
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
		<th>이름 : </th>
		<td><input id="name"></td>
	</tr>
	<tr>
		<th>이메일 : </th>
		<td><input id="email"></td>
	</tr>
	<tr>
		<th>전화번호 : </th>
		<td><input id="hp"></td>
	</tr>
	<tr>
		<th>우편번호 : </th>
		<td><input id="zipcode"></td>
	</tr>
	<tr>
		<th>주소 : </th>
		<td><input id="address1"></td>
	</tr>
	<tr>
		<th>상세주소 : </th>
		<td><input id="address2"></td>
	</tr>
	<tr>
		<th colspan="2"><button id="btnInsert">추가!</button></th>
	</tr>
</table>

<br><br><br><hr><br><br><br>

<div id="member2List"></div>



</body>
</html>