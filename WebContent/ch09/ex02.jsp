<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02</title>

</head>
<body>

<%
//pageContext.setAttribute("country", "korea");
%>
<c:set var="country" value="korea" scope="page" />
<c:if test="${country != null }">
	국가명 : ${country }<br>
	<!-- 위 출력문을 JSTL로 쓰려면 <c:out value="${country}" /> <br> 이렇게 해야하지만 굳이...? -->
</c:if>
<br><br><hr><br><br>
<%
int[] nums = {10,70,80,50,40,30,20};
//pageContext.setAttribute("num", nums);
%>

<c:set var="num" value="<%=nums %>"/>

<c:forEach var="n" items="${num }">
	${n }&nbsp;
</c:forEach>
<br><br><hr><br><br>
<!-- 다중 조건문 -->
<input id="season" type="text" readonly="readonly" value="">

<c:set var="season" value="여~름" />

<c:choose>
	<c:when test="${season == '봄' }">
		<img alt="봄" src="../images/summer.jpg">
	</c:when>
	<c:when test="${season == '여~름' }">
		<img alt="여~름" src="../images/summer.jpg">
	</c:when>
	<c:when test="${season == '가~을' }">
		<img alt="가~을" src="../images/autumn.jpg">
	</c:when>
	<c:when test="${season == '겨~울' }">
		<img alt="겨~울" src="../images/winter.jpg">
	</c:when>
	
	
</c:choose>


</body>
</html>