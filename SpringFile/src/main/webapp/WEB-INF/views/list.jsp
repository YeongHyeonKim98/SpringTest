<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>

</style>
</head>
<body>
	<!-- list.jsp -->
	<h1>게시판 <small>파일 업로드</small></h1>
	
	<table class="horizontal">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>파일</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.seq}</td>
			<td><a href="/file/view?seq=${dto.seq}">${dto.subject}</a></td>
			<td>${dto.regdate}</td>
			<td>
				<%-- 
				<c:forEach items="${dto.files}" var="fdto">
				<div>${fdto.filename}</div>
				</c:forEach> 
				--%>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<div>
		<button type="button" onclick="location.href='/file/add';">
			<span class="material-symbols-outlined">edit_note</span>
			쓰기
		</button>
	</div>
	
	<script>
	
	</script>
</body>
</html>



















