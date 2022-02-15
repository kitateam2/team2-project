<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#left {		
		background-color: rgb(230, 230, 250);		
		float: left;		
		width: 250px;
		height: 100%;
	}
</style>
<script>
	function pagingFormSubmit(currentPage) {
		var form = document.getElementById('pagingForm');
		var page = document.getElementById('page');
		page.value = currentPage;
		form.submit();
	}
</script>
</head>
<body>
<div id="left">

	<div>
		<a href="/team2">홈</a>&nbsp;
		<a href="/team2/blogmain">블로그홈</a>
	</div>
	
<!-- 검색 -->
	<div style="text-align:center;">
		<form id="pagingForm" method="get" action="${pageContext.request.contextPath}/blogmain">
			<input type="hidden" name="page" id="page">
			<input type="text" name="searchText" value="${searchText}" onkeypress="if( event.keyCode == 13 ){pagingFormSubmit(1);}" style="width: 50%; display: inline-block;">
			<input type="button" onclick="pagingFormSubmit(1)" value="검색">				
		</form>
	</div>
	
</div>
</body>
</html>