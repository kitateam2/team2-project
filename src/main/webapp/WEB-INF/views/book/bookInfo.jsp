<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/bookHeader.css" rel="stylesheet"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	 <div class="container">
	
<header id="container">
<div id="nav-bar">
	<div id="nav-belt">
		<div class="nav-left">
			<div id="nav-logo">
				<a href="home">GO</a>
			</div>
		</div>
		<div class="nav-fill">
			<div id="nav-search">
				<form id="nav-search-bar-form">
					<div class="nav-left">
						<a href="">ALL</a>
					</div>
					<div class="nav-fill">
						<input type="text">
					</div>
					<div class="nav-right">
						<button type="submit">Search</button>
					</div>
					
				</form>
			</div>
		</div>
		<div class="nav-right">
			<div id="nav-tools">
				<c:if test="${sessionScope.loginId == null}">
				<a href="condition">sign up</a>
				<a href="login">Log in</a>
				</c:if>
				<c:if test="${sessionScope.loginId != null}">
				<a href="logout">Log out</a>
				</c:if>
				<a href="cart">Cart</a>
			</div>
		</div>
	</div>
	<div id="nav-main">
	</div>
</div>
</header>
</div>


<c:if test="${sessionScope.loginId != null}">
		<div style="max-width: 23ex;position: relative; left: 1090px;">
		${sessionScope.loginId}님 환영합니다.</div>
		</c:if>
		
<c:if test="${sessionScope.loginId != null}">		

<div style="max-width: 23ex; border: solid red; position: relative; left: 1090px; top: 24px;">
<a href="myblog" style="color:red;">개인 블로그</a>
<a href="myblog/main" style="color:red;">개인 블로그</a>


<a href="blogmain" style="color:red;">블로그 메인</a>
<a href="bookInfo" style="color:red;">책 상세정보</a>



<a href="blogmain" style="color:red;">고객센터</a>
<a href="bookInfo" style="color:red;">책 상세정보</a>

</div>
</c:if>

<div class="container">
      
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>1.표지</th>
        <th>2.책 설명</th>
        <th>3.별점</th>
        <th>4.가격</th>
        <th>5.구매 (장바구니)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><img src="../resources/img/book/x9791130679822.jpg"></td>
        <td>Doe</td>
        <td>john@example.com</td>
        <td>Doe</td>
        <td><img src="../resources/img/book/구매.jpg"></td>
      </tr>
      <tr>
        <td><img src="../resources/img/book/x9791159095887.jpg"></td>
        <td>Moe</td>
        <td>mary@example.com</td>
        <td>Doe</td>
        <td><img src="../resources/img/book/구매.jpg"></td>
      </tr>
      <tr>
        <td><img src="../resources/img/book/x9791190885928.jpg"></td>
        <td>Dooley</td>
        <td>july@example.com</td>
        <td>Doe</td>
        <td><img src="../resources/img/book/구매.jpg"></td>
      </tr>
    </tbody>
  </table>
</div>



<div class="card-footer">Footer</div>
</body>
</html>