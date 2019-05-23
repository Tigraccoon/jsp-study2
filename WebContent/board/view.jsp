<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
<%@include file="../include/header.jsp" %>
<style type="text/css">
body{
	background: #cccccc;
	text-align: center;
}
table{
	background : white;
	border-collapse: collapse;
	border-spacing: 0;
	border: 2px solid black;
	margin: auto;
	width: 1000px;
}
th, td{
	padding: 10px;
	text-align: center;
	vertical-align: middle;
	border: 0.3px solid black;
}
th{
	background: #8BB7FF;
}
</style>
</head>
<body>

<div class="container-fluid">
	<div class="row justify-content-center">
			<div class="col col-auto">
			<h2>상세화면</h2><br>
				<form name="form1" method="post">
					<table>
						<tr>
							<th>날짜</th>
							<td>${dto.reg_date}</td>
							<th>조회수</th>
							<td>${dto.readcount}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td colspan="3">${dto.writer}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">${dto.subject}</td>
						</tr>
						<tr>
							<th colspan="4">본문</th>
						</tr>
						<tr>
							<td colspan="4">${dto.content}</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td colspan="3">
								<input type="password" name="passwd" id="passwd" class="form-control"> 
								<c:if test="${param.message == 'error' }">
									<span style="color: red;"> 비밀번호가 일치하지 않습니다. </span>
								</c:if></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3">
								<c:if test="${dto.filesize > 0}">
									${dto.filename}( ${dto.filesize} bytes )
									<a href="${path}/board_servlet/download.do?num=${dto.num}" class="btn btn-primary">다운로드</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<th colspan="4" align="center">
								<input type="hidden" name="num" value="${dto.num}"> 
								<input type="button" value="수정/삭제" id="btnEdit" class="btn btn-warning"> 
								<input type="button" value="답변" id="btnReply" class="btn btn-primary">
								<input type="button" value="목록" id="btnList" class="btn btn-info">
							</th>
						</tr>
					</table>
				</form>
				<br><hr><br>
				<form method="post">
					<table>
						<tr>
							<th colspan="3">댓글쓰기</th>
						</tr>
						<tr>
							<th><label for="writer">이름</label></th>
							<td><input id="writer" class="form-control"></td>
						</tr>
						<tr>
							<th><label for="content">내용</label></th>
							<td width="70%">
								<textarea rows="3" cols="80" placeholder="댓글을 입력하세요" id="content" class="form-control"></textarea>
							</td>
							<th rowspan="2"><button id="btnSave" class="btn btn-primary">확인</button></th>
						</tr>
						
					</table>
				</form>
				<br><hr><br>
				<div id="commentList"></div>
				<br><br><br>
			</div>
		</div>
</div>


<script type="text/javascript">
$(function(){
	comment_list();
	
	$("#btnSave").click(function(){
		comment_add();
	});
	
	$("#btnList").click(function(){
		location.href="${path}/board_servlet/list.do";
	});
	
	$("#btnReply").click(function(){
		document.form1.action="${path}/board_servlet/reply.do";
		document.form1.submit();
	});
});

function comment_add(){
	var param="board_num=${dto.num}&writer=" + $("#writer").val() 
				 + "&content=" + $("#content").val();
	
	$.ajax({
		type : "post",
		url : "${path}/board_servlet/comment_add.do",
		data : param,
		success : function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}

function comment_list(){
	$.ajax({
		type : "post",
		url : "${path}/board_servlet/commentList.do",
		data : "num=${dto.num}",
		success : function(result){
			$("#commentList").html(result);
		}
	});
}

</script>
</body>
</html>