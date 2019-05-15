<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../bootstrap-4.3.1-dist/css/bootstrap.min.css">
<title>list</title>
<%@include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="../bootstrap-4.3.1-dist/js/bootstrap.bundle.min.js"></script>
<script src="../bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">

function gb_search(){
	
	document.form1.action="${path}/guestbook_servlet/list.do";
	document.form1.submit();
}


</script>
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
	width: 600px;
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
	<div class="row justify-content-md-center">
		<div class="col col-auto">
			<h2>방명록</h2>
			${count}개의 글이 있습니다.<br><br>
		</div>
	</div>
	<div class="row justify-content-center">
			<div class="col col-auto">
				<form name="form1" id="form1" method="post" class="form-inline">
					<div class="form-row justify-content-center">
					<div class="col-auto">
						<select name="searchkey" id="searchkey" class="form-control">
							<c:choose>
								<c:when test="${searchkey == 'name' }">
									<option value="name" selected="selected">이름</option>
									<option value="content">내용</option>
									<option value="name_content">이름+내용</option>
								</c:when>
								<c:when test="${searchkey == 'content' }">
									<option value="name">이름</option>
									<option value="content" selected="selected">내용</option>
									<option value="name_content">이름+내용</option>
								</c:when>
								<c:when test="${searchkey == 'name_content' }">
									<option value="name">이름</option>
									<option value="content">내용</option>
									<option value="name_content" selected="selected">이름+내용</option>
								</c:when>
							</c:choose>
						</select>
					</div>
					<div class="col-auto">
						<input class="form-control" name="search" id="search" value="${search }" size="40" placeholder="검색할 내용을 입력하셍"> 
					</div>
					<div class="col-auto">
						<input type="button" value="검색" onclick="gb_search()" class="form-control btn btn-primary">
					</div>
					</div>
				</form>
		</div>
	</div>
	<br>
	<div class="row justify-content-md-center">
		<div class="col col-auto">
			<input class="btn btn-success" type="button" value="글쓰기" onclick="location.href='${path}/guestbook/write.jsp'">
		</div>
	</div>
	<br>
		<c:forEach var="dto" items="${list }">
			<div class="row justify-content-center">
				<div class="col col-auto">
					<form action="${path }/guestbook_servlet/passwd_check.do" method="post">
						<input type="hidden" name="idx" value="${dto.idx }">
						<table>
							<tr>
								<th>이름</th>
								<td>${dto.name}</td>
								<th>날짜</th>
								<td>${dto.post_date}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan="3">${dto.email}</td>
							</tr>
							<tr>
								<td colspan="4">${dto.content}</td>
							</tr>
							<tr>
								<th><label for="passwd">비밀번호</label></th>
								<td colspan="3">
								<div class="row justify-content-center">
								<div class="col col-auto">
									<input type="password" name="passwd" placeholder="password" class="form-control" id="passwd">
								</div>
								<div class="col col-auto">
									<input type="submit" value="수정/삭제" class="btn btn-primary">
								</div>
								</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		<br>
		</c:forEach>
	
</div>


</body>
</html>