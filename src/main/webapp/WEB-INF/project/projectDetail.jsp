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
.show-container{
	position: relative;
	width: 100%;
	height: 700px;
	padding-left: 20px;
}
.show-conatiner .content-title {
    font-size: 20px;
	font-weight: 600;
	color: #212140;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class = "show-container">
		<br><span class="content-title">서비스내용</span>
		<div>${project.service}</div>
		<br><span class="content-title">개발환경</span>
		<div>${project.environment}</div>
		<br><span class="content-title">기능설명</span>
		<div>${project.function_detail}</div>
		<br><span class="content-title">유지보수</span>
		<div>${project.maintenance}</div>
		<br><span class="content-title">코드정보</span>
		<div>${project.code_link}</div>
	</div>
</body>
</html>