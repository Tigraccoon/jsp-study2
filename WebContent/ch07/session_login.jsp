<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session_login</title>
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

</style>
<%@ include file="../include/header.jsp" %>
<!-- JSTL 명령어 -->
<!-- c : 코어태그 -->
<!-- param.변수 == request.getParameter("변수") -->
<!-- JSTL은 Null이 자동 처리되어 NullPointerException이 발생 안 함 -->

<c:if test="${param.message == 'error'}">
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않음.");
	</script>
</c:if>
<c:if test="${param.message2 == 'error2'}">
	<script>
		alert("아이디 or 비번을 다시 확인하세요!");
	</script>
</c:if>
<c:if test="${param.message == 'logout'}">
	<script>
		alert("로그아웃되었다.");
	</script>
</c:if>
<c:if test="${param.message2 == 'LogOut'}">
	<script>
		alert("로그아웃!");
	</script>
</c:if>

<%-- <%
위 코드를 기존 방식으로 사용하면 아래처럼 됌 

if(request.getParameter("message") != null && request.getParameter("message").equals("error")){%>
	<script>alert("아이디 또는 비밀번호가 일치하지 않음.");</script>
<%
}
%> --%>

</head>
<body>

<h2>세션 로그인</h2>
<form action="${path}/session_servlet/login.do" method="post" name="form1">
<table>
	<tr>
		<th>아이디</th>
		<td><input name="userid"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<th colspan="2"><input type="submit" value="로그인"></th>
	</tr>
	
</table>

</form>



</body>
</html>