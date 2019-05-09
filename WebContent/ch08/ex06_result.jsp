<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06_result</title>
</head>
<body>

<%-- <%@ page import="java.util.HashMap" %>
<%
HashMap<String, String> map = (HashMap<String, String>)request.getAttribute("map");

String[] fruits = {"포도", "오렌지", "바나나", "사과"};	//키값

for(String key : fruits){
	out.println("키 : " + key + " / 값 : " + map.get(key) + "<br>");
}
%>
 --%>

<%@include file="../include/header.jsp" %>
${map["포도"] }<br>
${map["오렌지"] }<br>
${map["바나나"] }<br>
${map["사과"] }<br>

<!-- 모두 출력할 경우(forEach) -->
<h3>for~Each</h3>

<!-- 
	2가지 방식으로 처리 가능
	1) ${변수.속성}
	2) ${변수["속성"]}

 -->


<c:forEach var="fruits" items="${map }">
<%-- 	${fruits} : ${fruits.key} => ${fruits.value}<br>--%>
	${fruits["key"]} => ${fruits["value"]}<br>
</c:forEach>


</body>
</html>