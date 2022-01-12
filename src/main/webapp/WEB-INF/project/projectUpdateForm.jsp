<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style type="text/css">
	
	.base-btn{
		width: 80px;
		height: 30px;
		background-color: #212140;
		color: white;
		border: none;
		margin-left: 700px;
	}
	.base-btn:hover{
		color: white;
		background-color: #333;
	}
	.content-title {
	    font-size: 20px;
		font-weight: 600;
		color: #212140;
		text-decoration: underline;
		display: block;
		margin-top: 80px;
		margin-bottom: 8px;
	}
	
	/* 글작성폼 */
	.form-container{
		width: 100%;
		position: relative;
		padding-left: 100px;
		padding-bottom: 80px;
		
	}
	.form-container .project-title{
		width: 800px;
		height: 40px;
	}
	.form-container .code-link{
		width: 800px;
		height: 40px;
	}
	.form-container .write-form{
		width: 800px;
		height: 500px;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function() {
	  $('.summernote').summernote({
		  // 에디터 높이
		  height: 500,
		  width: 800,
		  lang: "ko-KR",
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
		  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  });
	});
	
</script>
</head>
<body>
	<div class = "form-container">
		<form id="update-form" action="/project-list/content" method="post" enctype="multipart/form-data">
			<span class="content-title">Project-Title</span>
			<input name="project_title"type="text" class ="project-title" value="${project.project_title }" placeholder="프로젝트 제목을 입력해주세요" required="required"><br>
			<span class="content-title">Main-Image</span>
			<input name="upload" type="file"  multiple="multiple">
			<span class="content-title">Service-Purpose</span>
			<textarea name="service" class="summernote write-form" required="required">${project.service }</textarea>
			
			<span class="content-title">Development-Environment</span>
			<textarea name="environment" class="summernote write-form" required="required">${project.environment }</textarea>
			
			<span class="content-title">Function-Explanation</span>
			<textarea name="function_detail" class="summernote write-form" required="required">${project.function_detail }</textarea>
			
			<span class="content-title">Maintenance</span>
			<textarea name="maintenance" class="summernote write-form" required="required">${project.maintenance }</textarea>
			
			<span class="content-title">Code-Link</span>
			<input name="code_link" type="text" class ="code-link" value="${project.code_link }" placeholder="소스코드 링크를 입력해주세요" required="required"><br>
			
			<input type="hidden" name="num" value="${project.num}">
			<br><br>
			<button type="submit" class="base-btn update-btn">수정</button>
		</form>
	</div>
</body>
</html>