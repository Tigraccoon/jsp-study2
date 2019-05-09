<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01</title>
</head>
<body>

<!-- 
	1) EL 특징 : JSP에 내장되어있다. 코드가 깔끔하다. 조건문, 반복문의 기능은 없다. 간단한 계산은 가능하다.(사칙연산, 삼항연산)
	2) JSTL의 특징 : 외부 라이브러리(jar파일)가 필요하다. 조건문, 반복문 등 복잡한 연산이 가능하다.  
	따라서 EL은 단독으로 쓰이지 않고 JSTL과 혼합하여 사용한다. 
 -->

+ ${2+5}<br>
/ ${4/5}<br>
mod ${7 mod 5}<br> <!-- 나머지 -->
% ${7 % 5}<br>
&lt; ${2 < 3}<br>
le ${3.1 le 3.2}<br> <!-- LEss 작다 -->
<!-- 삼항연산자 -->
3항 ${(5>3) ? 5 : 3}<br>

</body>
</html>