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
	<!-- add.jsp > view.jsp -->
	<h1>게시판 <small>파일 업로드</small></h1>
	
	<table class="vertical">
		<tr>
			<th>번호</th>
			<td>${dto.seq}</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>${dto.regdate}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.content}</td>
		</tr>
		<tr>
			<th>파일</th>
			<td>
				<c:forEach items="${dto.files}" var="fdto">
					<div>
						<c:choose>
							<c:when test="${fdto.mimetype == 'text/plain'}"><span class="material-symbols-outlined">description</span></c:when>
							<c:when test="${fdto.mimetype == 'image/jpeg'}"><span class="material-symbols-outlined">image</span></c:when>
							<c:otherwise><span class="material-symbols-outlined">file_present</span></c:otherwise>
						</c:choose>
						<a href="/file/resources/files/${fdto.filename}" download>${fdto.filename}</a>
						(${fdto.filesize}B)
					</div>
				</c:forEach>
			</td>
		</tr>
	</table>
	<div>
		<input type="button" value="돌아가기" onclick="location.href='/file/list';">
	</div>
	
	<script>
	
	</script>
</body>
</html>






































