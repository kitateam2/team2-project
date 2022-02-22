<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세 설명 페이지</title>


<!-- 내부 css 파일 -->
<link href="resources/css/header.css" rel="stylesheet"/>
<link href="resources/css/bookInfo.css" rel="stylesheet"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- 검색창 디자인 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	<!-- myblogOnePost에서 따옴 -->
<!--  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>  -->	
  
 <!--   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script> -->  


<script>

//페이지 넘버링
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}

//검색 페이지 이동 
function bookPage() {
	var searchText = document.getElementById("bookName").value;
	location.href = 'list?searchText='+searchText;
}

</script>
<style>
 .bookList {
    width: 100%;
    border-top: 1px solid #e5e4e2;
    border-collapse: collapse;
  }
  .center, .bookInfo {
    border-bottom: 1px solid #e5e4e2;
    padding: 10px;
  }
</style>
</head>

<body>

<div class="box3">
<br>
<h1><center>
	<p>Book Store &nbsp; &nbsp;
	<!-- 검색폼 -->
		<input id="bookName" type="text" placeholder="검색어 입력" value="${searchText}" onkeypress="if(event.keyCode == 13){ bookPage(); }">
		<button id="search" onclick="bookPage();" value="검색">검색</button>	</p></center>
	</h1>
	<br>
	<div class="navigation_bar">
	<table class="gnb_main add_1">
		<tr colspan="5" id="blank"></tr>
		<tr> 
				<td class="class_item"><a href="url" class="text" style="color:white;">국내도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="url" class="text" style="color:white;">외국도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="bookInfo" class="text" style="color:white;">책 상세정보</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="blogmain" class="text" style="color:white;">블로그 메인</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="blogmain" class="text" style="color:white;">고객센터</a></td><td>&nbsp;</td>
			<c:if test="${sessionScope.loginId == null}">
				<td class="class_item2"><a href="condition" style="color:white;">회원가입</a></td><td>&nbsp;</td>
				<td class="class_item2"><a href="login" style="color:white;">로그인</a></td><td>&nbsp;</td>
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<td class="class_item2" style="color:white;"><a href="logout">로그아웃</a></td><td>&nbsp;</td>
				<td class="class_item2" style="color:white;"><a href="cart">장바구니</a></td><td>&nbsp;</td>
				<td class="class_item2" style="color:white;"><a href="myblog">개인 블로그</a></td><td>&nbsp;</td>
				<td class="class_item3" style="color:white;">${sessionScope.loginId}님 환영합니다.</td>
			</c:if>
		</tr>	
	</table>
	</div> <!-- navigation bar -->

<!-- 여기까지가 header 부분 -->

<div class="container">
     
      
<br>
<table class="bookList">

<tr>
	<th class="bookInfo" style="width:140px; text-align:center;">Thumbnail</th>
	<th class="bookInfo" style="width:370px; text-align:left;">Information</th>
	<th class="bookInfo" style=" width:150px;text-align:center;">Review</th>
	<th class="bookInfo" style="width:150px; text-align:center;">Price</th>
	<th class="bookInfo" style="width:70px; text-align:center;">Payment</th>
</tr>
<!-- 반복 시작 -->
<c:forEach var="book" items="${booklist}">  
<tr>
	<td class="center" style="width:140px; text-align:center;"><img src="download?filename=${book.book_image}"></td>  
	<td class="center" style="width:370px; text-align:left;">
		<p style="font-size: 16px; font-weight:bold;"><a href="list?book_no=${book.book_isbn}">${book.book_title}</a></p>  <!-- read다음 book_no는 parameterType값 ; controller와 일치해야함 -->
		<p style="font-size: 14px; font-weight:normal;">저자: ${book.book_author}</p>
		<p style="font-size: 12x; font-weight:bold; color:#acacac;"><${book.book_public}></p>
	</td>
	<td class="center" style="width:150px; text-align:center; font-size: 14px;">${book.book_reward}</td>
	<td class="center" style="width:150px; text-align:center; font-size: 14px;"><fmt:formatNumber value="${book.book_price}" pattern="###,###" />원</td>
	<td class="center" style="width:70px; text-align:center;">장바구니</td>
</tr>

</c:forEach>        
<!-- 반복 끝 -->
</table>
<br/><br/>

<div id="navigator" style="font-size: 15px; font-weight:bold; text-align:center; color:black;">
<!-- 페이지 이동 부분 -->                      
	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>

</div><!-- /페이지 이동 끝 -->



</div><!-- box3 -->


<div class="card-footer">Footer</div>
</body>
</html>