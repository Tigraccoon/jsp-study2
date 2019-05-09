<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myELHashMap</title>
</head>
<body>

<%@ page import="java.util.HashMap" %>

<%
HashMap<String, String> map = new HashMap<>();

map.put("사원번호", "001");
map.put("사원이름", "홍길동");
map.put("직     책", "대리");
map.put("부     서", "전산");
map.put("입사일자", "2019년1월1일");
map.put("연     봉", "3000만");

request.setAttribute("map", map);
%>

<jsp:forward page="myELHashMap_result.jsp"></jsp:forward>

</body>
</html>