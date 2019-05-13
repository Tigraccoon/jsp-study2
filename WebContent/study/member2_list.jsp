<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="member2.Member2DTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2_list</title>
<script type="text/javascript">

function view(userid){
	document.form1.userid.value=userid;
	document.form1.submit();
}


</script>
</head>
<body>
<%@include file="../include/header.jsp" %>

<table>
	<caption style="text-align: right;">${map.count }</caption>
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>우편번호</th>
		<th>주소</th>
		<th>상세주소</th>
		<th>가입일</th>
	</tr>
	<c:forEach var="mlist" items="${map.list }">
	<tr>
		<td><a href="#" onclick="view('${mlist.userid}')">${mlist.userid }</a></td>
		<td>${mlist.passwd }</td>
		<td>${mlist.name }</td>
		<td>${mlist.email }</td>
		<td>${mlist.hp }</td>
		<td>${mlist.zipcode }</td>
		<td>${mlist.address1 }</td>
		<td>${mlist.address2 }</td>
		<td>${mlist.join_date }</td>
	</tr>
	</c:forEach>
</table>
<form name="form1" method="post" action="/jsp02/member2_Servlet/view.do">
  <input type="hidden" name="userid">
</form>



</body>
</html>