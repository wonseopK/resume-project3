<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	
	.base-btn{
		width: 80px;
		height: 30px;
		background-color: #212140;
		color: white;
		border: none;
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
	}
	
	/* 글작성폼 */
	.form-container{
		width: 100%;
		position: relative;
		padding-left: 20px;
		
	}
	.form-container .project-title{
		margin-top: 40px;
		width: 800px;
		height: 40px;
	}
	.form-container .code-link{
		width: 800px;
		height: 40px;
	}
	.form-container{}
	.form-container .write-form{
		width: 800px;
		height: 500px;
	}
</style>
</head>
<body>
	<div class = "form-container">
		<form action="/project-list/new-project" method="post" enctype="multipart/form-data">
			<input name="project_title"type="text" class ="project-title" placeholder="프로젝트 제목을 입력해주세요" required="required"><br>
			<br><span class="content-title">메인이미지</span><br>
			<input name="upload" type="file" required="required" multiple="multiple">
			<br><span class="content-title">서비스내용</span><br>
			<textarea name="service" class="write-form" required="required"></textarea>
			<br><span class="content-title">개발환경</span><br>
			<textarea name="environment" class="write-form" required="required"></textarea>
			<br><span class="content-title">기능설명</span><br>
			<textarea name="function_detail" class="write-form" required="required"></textarea>
			<br><span class="content-title">유지보수</span><br>
			<textarea name="maintenance" class="write-form" required="required"></textarea>
			<br><input name="code_link" class="code-link" type="text" placeholder="소스코드를 작성한 링크를 입력해주세요" required="required"> 
			<br><button type="submit" class="base-btn">등록</button>
		</form>
	</div>
</body>
</html>