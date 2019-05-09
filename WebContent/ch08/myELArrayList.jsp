<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myELArrayList</title>
</head>
<body>

<%@ page import="java.util.ArrayList" %>

<%
ArrayList<String> list = new ArrayList<>();
list.add("사원번호 : 001");
list.add("사원이름 : 홍길동");
list.add("직    책 : 대리");
list.add("부    서 : 전산");
list.add("입사일자 : 2019년1월1일");
list.add("연    봉 : 3000만");

request.setAttribute("list", list);
%>


<jsp:forward page="myELArrayList_result.jsp"></jsp:forward>

</body>
</html>