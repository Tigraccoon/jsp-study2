<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07_result</title>
</head>
<body>

<%-- <%@page import="member.MemberDTO" %>
<%
MemberDTO dto = (MemberDTO)request.getAttribute("dto");

if(dto != null){
	out.println("아이디 : " + dto.getUserid() + "<br>");
	out.println("이름 : " + dto.getName() + "<br>");
	out.println("비밀번호 : " + dto.getPasswd() + "<br>");
} else {
	out.println("출력할 값이 없는데요...?");
}
%> --%>

<!-- 
	변수 사용 범위(Scope)
	java : pageContext, request, session, application
	EL : pageScope, requestScope, sessionScope, applicationScope
	ex) 이름 : ${reqeustScope.dto.name} 이지만 ~Scope은 생략 가능!
 -->


<%@include file="../include/header.jsp" %>

아이디 : ${requestScope.dto.userid }<br>	<!-- requestScope는 생략해도 되는듯.. -->
이름 : ${dto.name }<br>
비밀번호 : ${dto.passwd }<br>

</body>
</html>