<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_view</title>
<script src="../include/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

$(function(){
	//id가 btnUpdate 인 태그를 클릭하면?
	$("#btnUpdate").click(function(){
		document.form1.action="/jsp02/member_servlet/update.do";	//버튼이 2개이므로 action 경로 지정을 여기서
		document.form1.submit();
	});
	
	$("#btnDelete").click(function(){
		if(confirm("진짜 삭제??") == true){
			document.form1.action="/jsp02/member_servlet/delete.do";
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

<%
	MemberDTO dto = (MemberDTO) request.getAttribute("dto");
%>
<form action="" name="form1" method="post">
<table>
	<tr>
		<th>아이디</th>
		<td><%=dto.getUserid()%></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input value="<%=dto.getPasswd()%>" name="passwd"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input value="<%=dto.getName()%>" name="name"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input value="<%=dto.getEmail()%>" name="email" type="email"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input value="<%=dto.getHp()%>" name="hp" type="tel"></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><input value="<%=dto.getZipcode()%>" name="zipcode"></td>
	</tr>
	<tr>
		<th>주소1</th>
		<td><input value="<%=dto.getAddress1()%>" name="address1"></td>
	</tr>
	<tr>
		<th>주소2</th>
		<td><input value="<%=dto.getAddress2()%>" name="address2"></td>
	</tr>
	<tr>
		<th>가입일</th>
		<td><%=dto.getJoin_date()%></td>
	</tr>
	 <tr>
   		<td colspan="2" align="center">
  		<!-- userid가 반드시 필요함. hidden 처리 -->
 		<input type="hidden" name="userid" value="<%=dto.getUserid() %>">
 		<button type="button" id="btnUpdate">수정</button>
   		<button type="button" id="btnDelete">삭제</button>
 </tr>
</table>
</form>

</body>
</html>