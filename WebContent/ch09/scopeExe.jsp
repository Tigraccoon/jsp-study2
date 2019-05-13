<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopeExe</title>
</head>
<body>

<c:set var="page" value="1234" scope="page"/>
<c:set var="request" value="kim" scope="request" />
<c:set var="session" value="김철수" scope="session" />
<c:set var="application" value="전산부" scope="application" />
<c:set var="date" value="<%=new Date() %>"/>

page : ${pageScope.page }<br>
request : ${requestScope.request }<br>
session : ${sessionScope.session }<br>
application : ${applicationScope.application }<br>
입사일자 : <fmt:formatDate value="${date }" pattern="YYYY-MM-dd hh:mm:ss E"/>
</body>
</html>