<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#header{
		position: fixed;		
		margin-left: 100px;
		width: 1308px;
		background-color: yellow;
		text-align: center; 
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
<div id="header">

<div style=float:right;>          
<c:if test="${sessionScope.loginId == null}">
	<a href="condition">회원가입</a>
</c:if>
<c:if test="${sessionScope.loginId == null}">
	<a href="${pageContext.request.contextPath}/blogmain/login">로그인</a>					
</c:if>
<c:if test="${sessionScope.loginId != null}">
	<span>${sessionScope.loginId}님 접속중</span>&nbsp;
</c:if>
<c:if test="${sessionScope.loginId != null}">
	<a href="${pageContext.request.contextPath}/blogmain/logout">로그아웃</a>
</c:if>
<c:if test="${sessionScope.loginId != null}">
	<a href="">내블로그</a>
</c:if>
</div>  

<div style=float:left;>
	<a href="/team2/blogmain">블로그홈</a>
</div>

<div style="width: 30%; display: inline-block;">
	<form id="pagingForm" method="get" action="${pageContext.request.contextPath}/blogmain">
		<input type="hidden" name="page" id="page">
		<input type="text" name="searchText" value="${searchText}" onkeypress="if( event.keyCode == 13 ){pagingFormSubmit(1);}">
		<input type="button" onclick="pagingFormSubmit(1)" value="검색">				
	</form>
</div>
</div>
</body>
</html>