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
	

<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

</head>
<body>

<div id="header" data-role="header" data-theme="a" style="text-align: center;">	
		<div>
			<a href="/blog/blogmain" class="ui-btn-left ui-btn ui-shadow ui-corner-all" data-role="button">블로그</a>
		</div>
		<div style="width: 30%; display: inline-block;">
			<form id="pagingForm" method="get" action="${pageContext.request.contextPath}/blogmain">
				<input type="hidden" name="page" id="page">
				<input type="text" name="searchText" value="${searchText}" onkeypress="if( event.keyCode == 13 ){pagingFormSubmit(1);}" data-type="search">				
			</form>
		</div>		
		
		<a href="#panel" class="ui-btn-right ui-btn ui-shadow ui-corner-all ui-icon-bars ui-btn-icon-notext ui-btn-inline"></a>	
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
        <td><img src="resources/img/book/x9791130679822.jpg"></td>
        <td>Doe</td>
        <td>john@example.com</td>
        <td>Doe</td>
        <td><img src="resources/img/book/구매.JPG"></td>
      </tr>
      <tr>
        <td><img src="resources/img/book/x9791159095887.jpg"></td>
        <td>Moe</td>
        <td>mary@example.com</td>
        <td>Doe</td>
        <td><img src="resources/img/book/구매.JPG"></td>
      </tr>
      <tr>
        <td><img src="resources/img/book/x9791190885928.jpg"></td>
        <td>Dooley</td>
        <td>july@example.com</td>
        <td>Doe</td>
        <td><img src="resources/img/book/구매.JPG"></td>
      </tr>
    </tbody>
  </table>
</div>



<div class="card-footer">Footer</div>
</body>
</html>