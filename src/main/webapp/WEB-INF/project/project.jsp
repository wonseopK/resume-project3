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
		height: 400px;
	}
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
	.write-btn{
		position: absolute;
		top: 33px;
		right: 53px;
	}
	/* 프로젝트 컨테이너 */
	.project-container{
		width: 100%;
		height: 700px;
		position: relative;
	}
	.title-container{
		margin: auto;
		width: 600px;
		height: 120px;
		color: #212140;
		font-size: 100px;
		font-weight: 500;
		text-align: center;
	}
	.search-container{
		width: 100%;
		height: 50px;
		position: relative;
	}
	.search{
		margin: auto;
		width: 555px;
		height: 50px;
		background: #f7f9fa;
		padding: 10px;
	}
	.search-option{
		width: 80px;
		height: 30px;
	}
	.keyword{
		width: 360px;
		height: 30px;
	}
	.project-list-container{
		width: 100%;
		height: 440px;
		position: relative;
		display: flex;
	}
	.project-detail{
		witdh: 500px;
		height: 380px;
		margin-left: 50px;
		margin-top: 40px;
		cursor: pointer;
	}
	.title{
		witdh: 500px;
		height: 60px;
		text-align: center;
		background-color: white;
		color: #333;
		line-height: 60px;
		font-size: 16px;
		font-weight: 600;
		text-overflow:ellipsis;
		white-space:nowrap;
		word-wrap:normal;
		width:500px;
		overflow:hidden;
		border: 5px solid #f7f9fa;
				 
	}
	.page-container{
		margin-top: 50px;
		width: 100%;
		height: 90px;
		position: relative;
		padding-top: 15px;
	}
	.page{
		width: 600px;
		height: 60px;
		margin: auto;
		text-align: center;
		line-height: 60px;
	}
</style>
</head>
<body>
	<div class="project-container">
		<div class ="title-container">
			<span>PROJECT</span>
		</div>
		<!-- <div class ="search-container">
			<div class ="search">
				<select class="search-option">
					<option>제목</option>
					<option>내용</option>
				</select>
				<input class= "keyword" type="text" name="keyword" placeholder="검색할 내용을 입력해주세요">
				<button class='search-btn base-btn' type="button">검색</button>
			</div>
		</div> -->
		<div class ="project-list-container">
			<c:forEach var="project" items="${list}">
				<div class = "project-detail">
					<input type="hidden" class="project-num" value="${project.num}">
					<img alt="ProjectImage" src="../project/${project.main_image}" class='project-image'>
					<div class ="title">
						<span>${project.project_title}</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class ="page-container">
			<c:if test="${page.totalCount>0}">
				<div class="page">
					<ul class="pagination">
						<!-- 이전 -->
						<c:if test="${page.startPage>1}">
							<li><a href="../resume/project-list?currentPage=${page.startPage-1}">이전</a></li>
						</c:if>
						
						<c:forEach var="pp" begin="${page.startPage}" end="${page.endPage}">
							<c:if test="${page.currentPage==pp}">
								<li class="active"><a href="../resume/project-list?currentPage=${pp}">${pp}</a></li>
							</c:if>
							<c:if test="${page.currentPage!=pp}">
								<li><a href="../resume/project-list?currentPage=${pp}">${pp}</a></li>
							</c:if>
						</c:forEach>
						
						<!-- 다음 -->
						<c:if test="${page.endPage<totalPage}">
							<li><a href="../resume/project-list?currentPage=${page.endPage+1}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
			<button class="write-btn base-btn">글작성</button>
		</div>
	</div>
	<input type="hidden" id="currentPage" value="${page.currentPage }">
	
	<script type="text/javascript">
		$(".write-btn").click(function() {
			location.href="../project-list/project-form";
		})
		
		$(".project-detail").click(function() {
			let num = $(this).children(".project-num").val()
			let currentPage = $("#currentPage").val()
			location.href="../project-list/project-detail?num="+num+"&currentPage="+currentPage;
		})
		
		$(".project-detail").hover(function() {
			$(this).children().css({
				"color": "#333",
				"background-color": "#f7f9fa"
			})	
		}, function() {
			$(this).children().css({
				"color": "#333",
				"background-color": "white"
			})	
		})
	</script>
</body>
</html>