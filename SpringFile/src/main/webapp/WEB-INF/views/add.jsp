<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	#attachZone {
		border: 1px solid #CCC;
		width: 99%;
		min-height: 100px;
	}
	
	#attachZone div {
		margin: 5px 10px;
		border-bottom: 1px solid #DDD;
		display: flex;
		justify-content: space-between;
	}
	
	
</style>
</head>
<body>
	<!-- add.jsp -->
	<h1>게시판 <small>파일 업로드</small></h1>
	
	<form method="POST" action="/file/addok" enctype="multipart/form-data">
	<table class="vertical">
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" required class="full"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" required class="full"></textarea></td>
		</tr>
		<tr>
			<th>파일</th>
			<td>
				<!-- <input type="file" name="attach" class="full"> -->
				
				<!-- 
				<div><input type="file" name="attach" class="full"></div>
				<div><input type="file" name="attach" class="full"></div>
				<div><input type="file" name="attach" class="full"></div> 
				-->
				
				<!-- <div><input type="file" name="attach" class="full" multiple></div> -->
				
				<div id="attachZone"></div>
				<input type="file" name="attach" id="attach" class="full" style="display: none;">
				
			</td>
		</tr>
	</table>
	<div>
		<input type="button" value="돌아가기" onclick="location.href='/file/list';">
		<button type="submit">
			<span class="material-symbols-outlined">edit_note</span>
			쓰기
		</button>
	</div>
	</form>
	
	<script>
	
		//첨부 파일 선택 화면 구현
		let fileList = []; //첨부파일들
		
		$('#attachZone').on('dragenter', function(e) {
							//$(this).css('background-color', 'tomato');
							e.preventDefault();
							e.stopPropagation();
						})
		                .on('dragover', function(e) {
		                	//$(this).css('background-color', 'gold');
		                	e.preventDefault();
							e.stopPropagation();
		                })
		                .on('dragleave', function(e) {
		                	//$(this).css('background-color', 'cornflowerblue');
		                	e.preventDefault();
							e.stopPropagation();
		                })
		                .on('drop', function(e) {
		                	//$(this).css('background-color', 'yellowgreen');
		                	e.preventDefault();
		                	
		                	let files = e.originalEvent.dataTransfer.files;
		                	console.log(files);
		                	
		                	if (files != null & files != undefined) {
		                		
		                		let temp = '';
		                		
		                		for (let i=0; i<files.length; i++) {
		                			
		                			let f = files[i];
		                			
		                			let filename = f.name;
		                			let filesize = f.size / 1024 / 1024;
		                			filesize = filesize < 1 ? filesize.toFixed(2) : filesize.toFixed(1); 
		                			
		                			temp += `<div>
		                						<span>\${filename}</span>
		                						<span>\${filesize}MB</span>
		                					 </div>`;
		                			
		                		}//for
		                		
		                		$(this).append(temp);
		                		
		                		//<input type="file" files="">
		                		$('#attach').prop('files', files);
		                		
		                	}
		                	
		                });
		
		
	
	</script>
</body>
</html>






































