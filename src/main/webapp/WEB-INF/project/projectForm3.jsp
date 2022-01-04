<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
  <script src="resources/js/summernote/summernote-lite.js"></script>
	<script src="resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="resources/css/summernote/summernote-lite.css">
</head>
<body>
<form method="post">
  <textarea id="summernote" name="editordata"></textarea>
</form>
<script type="text/javascript">
	$(document).ready(function() {
	  $('#summernote').summernote();
	});
</script>
</body>
</html>