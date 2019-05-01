<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member2.Member2DTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2_view</title>
<script src="../include/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="/jsp02/member2_Servlet/update.do";	//버튼이 2개이므로 action 경로 지정을 여기서
		document.form1.submit();
	});
	
	$("#btnDelete").click(function(){
		if(confirm("진짜 삭제??") == true){
			document.form1.action="/jsp02/member2_Servlet/delete.do";
			document.form1.submit();
		}
	});
	
});

</script>

<style type="text/css">
body{
	background: #cccccc;
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

</style>
</head>
<body>

<%Member2DTO dto = (Member2DTO)request.getAttribute("dto"); %>

<form action="" method="post" name="form1">
<table>
	<tr>
		<th colspan="2">회원관리</th>
	</tr>
	<tr>
		<th>아이디 : </th>
		<td><input name="userid" disabled="disabled" value="<%=dto.getUserid()%>"></td>
	</tr>
	<tr>
		<th>비밀번호 : </th>
		<td><input name="passwd" value="<%=dto.getPasswd()%>"></td>
	</tr>
	<tr>
		<th>이름 : </th>
		<td><input name="name" value="<%=dto.getName()%>"></td>
	</tr>
	<tr>
		<th>이메일 : </th>
		<td><input name="email" value="<%=dto.getEmail()%>"></td>
	</tr>
	<tr>
		<th>전화번호 : </th>
		<td><input name="hp" value="<%=dto.getHp()%>"></td>
	</tr>
	<tr>
		<th>우편번호 : </th>
		<td><input name="zipcode" value="<%=dto.getZipcode()%>"></td>
	</tr>
	<tr>
		<th>주소 : </th>
		<td><input name="address1" value="<%=dto.getAddress1()%>"></td>
	</tr>
	<tr>
		<th>상세주소 : </th>
		<td><input name="address2" value="<%=dto.getAddress1()%>"></td>
	</tr>
	<tr>
		<th>가입일 : </th>
		<td><%=dto.getJoin_date() %></td>
	</tr>
	<tr>
		<th colspan="2">
			<button id="btnUpdate">수정</button>
			<button id="btnDelete">삭제</button>
		</th>
	</tr>
</table>

</form>




</body>
</html>