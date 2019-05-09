<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="member.MemberDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_list2</title>
<%@include file="../include/header.jsp" %>

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

<script type="text/javascript">

function view(userid){
	document.form1.userid.value=userid;
	document.form1.submit();
}

</script>

</head>
<body>

<%-- <%
Map<String, Object> map = (Map<String,Object>)session.getAttribute("map");
List<MemberDTO> list = (List<MemberDTO>)map.get("list");
int count = (int)map.get("count");

%>
 --%>

<table>
<caption style="text-align: right;">등록된 회원 수 : ${map.count}</caption>
	<tr>
		<th>이름</th>
		<th>비밀번호</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>우편번호</th>
		<th>주소1</th>
		<th>주소2</th>
		<th>가입일</th>
	</tr>
	
<%-- <%for(MemberDTO dto : list){%> --%>
<c:forEach var="dto" items="${map.list}">
	<tr>
		<!-- ${dto.userid}는 private한 글로별변수 자체를 가져오는 것이 아니라 내부적으로 getter 메소드를 호출하여 가져온다. -->
		<td><a href="#" onclick="view('${dto.userid }')">${dto.name }</a></td>
		<td>${dto.passwd }</td>
		<td>${dto.email }</td>
		<td>${dto.hp }</td>
		<td>${dto.zipcode }</td>
		<td>${dto.address1 }</td>
		<td>${dto.address2 }</td>
		<td>${dto.join_date }</td>
	</tr>
</c:forEach>
<%-- <%} %> --%>
</table>
<form name="form1" method="post" action="/jsp02/member_servlet/view.do">
  <input type="hidden" name="userid">
</form>


</body>
</html>