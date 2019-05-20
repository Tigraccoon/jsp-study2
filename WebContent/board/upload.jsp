<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload</title>
<%@include file="../include/header.jsp" %>
</head>
<body>

<h2>파일 업로드</h2>
<!-- 파일 업로드는 반드시 post방식으로 전송 -->
<!-- enctype="multipart/form-data" 파일 업로드 타입 지정 필요 -->
<form action="upload_result.jsp" method="post" name="form1" enctype="multipart/form-data">
	이름 : <input name="name"><br><br>
	제목 : <input name="subject"><br><br>
	파일1 : <input type="file" name="file1"><br><br>
	파일2 : <input type="file" name="file2"><br><br>
	<input type="submit" value="업로드">
</form>


</body>
</html>