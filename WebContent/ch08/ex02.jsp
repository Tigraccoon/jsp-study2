<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02</title>
</head>
<body>

<%-- <%
String name = request.getParameter("name");
if(name==null){
	name = "";
}
%>
 --%>

<!-- form 태그에 action="url"을 적지 않으면 현재 페이지가 출력 -->

<form method="get">
이름 : <input name="name" value="${param.name}">  
<input type="submit" value="확인">
</form>
<br><br>
이름 : ${param.name}

</body>
</html>