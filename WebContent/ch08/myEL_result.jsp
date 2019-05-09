<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myEL_result</title>
</head>
<body>

사원번호 : ${sessionScope.snum }<br>
사원이름 : ${sessionScope.sname }<br>
직    책 : ${sessionScope.job }<br>
부    서 : ${sessionScope.dept }<br>
입사일자 : ${sessionScope.sdate }<br>
연    봉 : ${sessionScope.sal }<br>

</body>
</html>