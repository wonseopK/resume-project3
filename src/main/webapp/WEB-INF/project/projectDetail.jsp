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
		background: #212140;
		color: white;
		border: none;
}
.base-btn:hover{
	color: white;
	background: grey;
}
.list-btn{
	position: absolute;
	bottom: -50px;
	left: 150px;
}
.delete-btn{
	position: absolute;
	bottom: -50px;
	right: 100px;
}
.update-btn{
	position: absolute;
	bottom: -50px;
	right: 10px;
}

.show-container2{
	position: relative;
	width: 100%;
	padding-left: 150px;
	margin-bottom: 80px;
}
.content-title {
    font-size: 20px;
	font-weight: 600;
	color: #212140;
	text-decoration: underline;
}
.show-contents{
	width: 700px;
	margin-top: 10px;
}
</style>
</head>
<body>
	
	<div class = "show-container2">
		
		<br><span class="content-title">Service-Purpose</span>
		<div class="show-contents">${project.service}</div>
		
		<br><span class="content-title">Development-Environment</span>
		<div class="show-contents">${project.environment}</div>
		
		<br><span class="content-title">Function-Explanation</span>
		<div class="show-contents">${project.function_detail}</div>
		
		<br><span class="content-title">Maintenance</span>
		<div class="show-contents">${project.maintenance}</div>
		<br><span class="content-title">Code-Link</span>
		<br><a target="blank" href="${project.code_link}">move to GitHub</a>
		<button type = "button" class="base-btn list-btn">목록</button>
		<button type = "button" class="base-btn delete-btn" >삭제</button>
		<button type = "button" class="base-btn update-btn" >수정</button>
	</div>
</body>
</html>