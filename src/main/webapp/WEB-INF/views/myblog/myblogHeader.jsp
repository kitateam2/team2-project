<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script>
function message_window(){
	
	var w = window.open('../message/${sessionScope.loginId}/window', '메시지', 'top=200,left=500,width=1200,height=600');
}

<!-- 페이지 이동 스크립트  -->

function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}
</script>
<style type="text/css">
.row >* {
	padding-right: 0; 
    padding-left: 0;
}
</style>


<title>${user_id} 블로그</title>
</head>
<body>
	 <!-- 개인블로그 헤더 -->
	<header class="col-md-12 row" style="background-color:rgb(169, 169, 169); height:4em; width:100%; cursor: pointer; --bs-gutter-x:0rem; --bs-gutter-x:0rem">
		<div class="col-md-3 align-self-center" onclick="location.href='/team2'"><h2>BOOK STORE</h2></div> <!-- 로고 -->
		<div class="col-md-2 offset-md-4 align-self-center " style="text-align:right;"><a onclick="location.href='/team2'">메인페이지</a></div>
		<div class="col-md-1 align-self-center" style="text-align:right;"><a onclick="location.href='/team2/blogmain'">블로그홈</a></div>
		<c:if test="${sessionScope.loginId != null}">
			<div class="col-md-1 align-self-center" style="text-align:right;">
			<a onclick="location.href='/team2/myblog/${sessionScope.loginId}'">${sessionScope.loginId}님</a> 
			</div>
			<div class="col-md-1 align-self-center" style="text-align:right;" onclick="location.href='${pageContext.request.contextPath}/myblog/logout?user_id=${user_id}'"><a>로그아웃</a></div>
		</c:if>
		<c:if test="${sessionScope.loginId == null}">
			<div class="col-md-1 align-self-center" style="text-align:right;">
				<a onclick="location.href='../condition'">회원가입</a> 
			</div>
			<div class="col-md-1 align-self-center" style="text-align:right;"><a onclick="location.href='${pageContext.request.contextPath}/login?url=' + location.href">로그인</a></div>
		</c:if>
	</header><!-- 개인블로그 헤더 -->

</body>
</html>
