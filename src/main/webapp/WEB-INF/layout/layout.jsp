<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<!-- awesome font -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<!-- bootstrap -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style type="text/css">
.inner {
	width: 1536px;
	margin: 0 auto;
	position: relative;
	display: flex;
}
/* 매뉴컨테이너 */
.inner .menu-container {
	background: #212140;
	width: 25%;
	height: 700px;
}

.inner .show-container {
	width: 75%;
	height: 700px;
	overflow-y: auto;
}
</style>
</head>
<body>
	<div class = "inner">
		<div id="menuContents" class="menu-container">
			<tiles:insertAttribute name="menu"/>
		</div>
		<div  id="bodyContents" class="show-container">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>
</body>
</html>