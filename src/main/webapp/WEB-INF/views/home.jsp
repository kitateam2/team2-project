<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<a href="myblog/main">개인 블로그</a> 로그인 하지 않은 상태에서도 개인블로그 내에서 잘 되는지 확인하려고 만든 임시 링크 입니다.

<c:if test="${sessionScope.loginId == null}">
		<p><a href="join">회원가입</a></p>
		<p><a href="login">로그인</a></p>
	</c:if>

<c:if test="${sessionScope.loginId != null}">
		<h2>${sessionScope.loginId}님 환영합니다.</h2>

<<<<<<< HEAD
<a href="logout">로그아웃</a>
<a href="cart">장바구니</a>
<a href="myblog">개인 블로그</a>
=======
<p><a href="logout">로그아웃</a></p>
<a href="myblog/main">개인 블로그</a>
>>>>>>> master
<a href="blogmain">블로그 메인</a>
<a href="bookinfo">책 상세정보</a>
<a href="customerservice">고객센터</a>
</c:if>
</body>
</html>
