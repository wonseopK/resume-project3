<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	/* 공통사용 */
	.project-image{
		width: 500px;
		height: 320px;
	}
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
	/* 프로젝트 컨테이너 */
	.project-container{
		width: 100%;
		height: 700px;
		position: relative;
	}
	.project-container .title-container{
		margin: auto;
		width: 600px;
		height: 120px;
		color: #212140;
		font-size: 100px;
		font-weight: 500;
		text-align: center;
	}
	.project-container .search-container{
		width: 100%;
		height: 50px;
		position: relative;
		
	}
	.project-container .search-container .search{
		margin: auto;
		width: 555px;
		height: 50px;
		background: #f7f9fa;
		padding: 10px;
	}
	.project-container .search-container .search .search-option{
		width: 80px;
		height: 30px;
	}
	.project-container .search-container .search .keyword{
		width: 360px;
		height: 30px;
	}
	.project-container .project-list-container{
		width: 100%;
		height: 440px;
		position: relative;
		display: flex;
	}
	.project-container .project-list-container .project{
		witdh: 500px;
		height: 380px;
		margin-left: 50px;
		margin-top: 40px;
		cursor: pointer;
	}
	.project-container .project-list-container .project .title{
		witdh: 500px;
		height: 60px;
		text-align: center;
		color: white;
		background-color: #212140;
		line-height: 60px;
		font-size: 16px;
		font-weight: 500;
		text-overflow:ellipsis;
		white-space:nowrap;
		word-wrap:normal;
		width:500px;
		overflow:hidden;
				 
	}
	.project-container .project-list-container .project .title:hover{
		color: white;
		background-color: #333;
	}
	.project-container .page-container{
		width: 100%;
		height: 90px;
		position: relative;
		padding-top: 15px;
	}
	.project-container .page-container .page{
		width: 600px;
		height: 60px;
		background-color: #f7f9fa;
		margin: auto;
	}
	.project-container .posting-container{
		width: 100%;
		height: 800px;
		background-color: skyblue;
	}
	
</style>
</head>
<body>
	<div class="project-container">
		<div class ="title-container">
			<span>PROJECT</span>
		</div>
		
		<div class ="search-container">
			<div class ="search">
				<select class="search-option">
					<option>제목</option>
					<option>내용</option>
				</select>
				<input class= "keyword" type="text" name="keyword" placeholder="검색할 내용을 입력해주세요">
				<button class='search-btn base-btn' type="button">검색</button>
			</div>
		</div>
		<div class ="project-list-container">
			<c:forEach var="project" items="${list}">
				<div class = "project">
					<input class="project-num" type="hidden" value="${project.num}">
					<img alt="ProjectImage" src="../project/main.JPG" class='project-image'>
					<div class ="title">
						<span>${project.project_title}</span>
					</div>
				</div>
			</c:forEach>
			<div class = "project">
				<img alt="ProjectImage" src="../project/main.JPG" class='project-image'>
				<div class ="title">
					<span>팀프로젝트 번뜩</span>
				</div>
			</div>
		</div>
		<div class ="page-container">
			<div class="page">
				<button class="write-btn base-btn">글작성</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(".write-btn").click(function() {
			location.href="../project-list/project-form";
		})
		
		$(".project").click(function() {
			let num = $(this).children(".project-num").val()
			location.href="../project-list/project-detail?num="+num;
		})
		
		$(".project").hover(function() {
			$(this).children().css({
				"color": "white",
				"background-color": "#333"
			})	
		}, function() {
			$(this).children().css({
				"color": "white",
				"background-color": "#212140"
			})	
			
		})
	</script>
</body>
</html>