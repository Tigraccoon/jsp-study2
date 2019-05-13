<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fnExe</title>
</head>
<body>

<c:set var="str" value="Hi HTML" />
<h2>${str }</h2><br>
<br><br><hr><br><br>
<h2>${fn:replace(str, 'HTML', 'JSP') } </h2>

</body>
</html>