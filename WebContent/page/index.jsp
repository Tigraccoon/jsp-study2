<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../include/header.jsp" %>
<title>page</title>
<script type="text/javascript">

$(document).ready(function(){
	list('2');	//페이지 처리
});

function list(curPage){
	var param = "curPage=" + curPage;
	
	$.ajax({
		type : "post",
		url : "${path}/page_servlet/list.do",
		data : param,
		success : function(result){	//콜백함수(서버의 응답처리)
			$("#result").html(result);
		}		
	});
}


</script>
</head>
<body>

<h2>페이지 나누기</h2>

<br><br>
<div id="result"></div>


</body>
</html>