<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myEL</title>
<%@include file="../include/header.jsp" %>

</head>
<body>

<c:set var="snum" value="${param.snum }" scope="session" />
<c:set var="sname" value="${param.sname }" scope="session" />
<c:set var="job" value="${param.job }" scope="session" />
<c:set var="dept" value="${param.dept }" scope="session" />
<c:set var="sdate" value="${param.sdate }" scope="session" />
<c:set var="sal" value="${param.sal }" scope="session" />

<h3>scope생성?</h3>
<form method="get">
사원번호 : <input name="snum" value="001"><br>
사원이름 : <input name="sname" value="홍길동"><br>
직    책 : <input name="job" value="대리"><br>
부    서 : <input name="dept" value="전산"><br>
입사일자 : <input name="sdate" value="2019년 1월 1일"><br>
연    봉 : <input name="sal" value="3000만"><br>
<input type="submit" value="저장">
</form>
<br>
<a href="myEL_result.jsp">전송</a>

</body>
</html>