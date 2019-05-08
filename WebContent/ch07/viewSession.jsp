<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewSession</title>
</head>
<body>

<%
//Enumeration을 사용해 세션의 key set을 가져옴

Enumeration<String> attr = session.getAttributeNames();

while(attr.hasMoreElements()){	//다음 요소가 있으면?
	String key = attr.nextElement();	//다음 요소를 읽어옴
	Object value = session.getAttribute(key);	//return 타입이 Object이므로
	
	out.println("키 : " + key + " / 값 : " + value + "<br>");
}

String id = (String)session.getAttribute("id");
int age = 0;

//session을 지운 후 NullPointerException이 안 나오게 하려면 if문처리를 해야...
if(session.getAttribute("age") != null){
	age = (int)session.getAttribute("age");
}

double height=0;
if(session.getAttribute("height") != null){
	height = (double)session.getAttribute("height");
}

%>
아이디 : <%=session.getAttribute("id") %><br>
비밀번호 : <%=session.getAttribute("passwd") %><br>
나이 : <%=age %><br>
키 : <%=height %><br>
<br>
<a href="deleteSession.jsp">세션 삭제</a>

</body>
</html>