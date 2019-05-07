<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useCookie</title>
</head>
<body>
<%
//클라이언트에 저장된 쿠키값을 배열로 받음

Cookie[] cookies = request.getCookies();

/* if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		out.print("쿠키이름 : " + cookies[i].getName());
		out.println(", 쿠키값 : " + cookies[i].getValue() + "<br>");
	}
}
 */
%>

<br><br><hr><br><br>

<!-- EL(Expression Language, 표현언어) -->
아이디 : ${cookie.id.value}<br>
비밀번호 : ${cookie.pwd.value}<br>
나이 : ${cookie.age.value}<br>
전화번호 : ${cookie.hp.value}<br>
<%-- 이름 : <%=request.getParameter("name") %><br>
이름 : ${param.name} --%>
<br><br><hr><br><br>

<a href="deleteCookie.jsp">쿠키 삭제</a><br>
<a href="editCookie.jsp">쿠키 변경</a>



</body>
</html>