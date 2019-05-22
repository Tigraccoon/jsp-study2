<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<%@include file="../include/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	list('1');	//페이지 처리
});

function list(curPage){
	var param = "curPage=" + curPage;
	
	$.ajax({
		type : "post",
		url : "${path}/board_servlet/list.do",
		data : param,
		success : function(result){	//콜백함수(서버의 응답처리)
			$("#result").html(result);
		}		
	});
}
</script>
<%-- <c:redirect url="/board_servlet/list.do"></c:redirect>
 --%></head>
<body>
<div id="result"></div>


</body>
</html>