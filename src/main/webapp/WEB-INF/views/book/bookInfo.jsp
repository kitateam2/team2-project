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

//bt1 버튼 클릭했을때 실행될 함수
function bt1Click(n){
	
	alert('장바구니 이동');
	$.ajax({
		url:'ajaxcart',
		type:'post',
		data: {book_isbn: n},
		dataType:'text',
		success: function() { alert('장바구니에 담았습니다.'); },
		error: function() { alert('로그인을 해주세요'); }
	}); 
}

function bt2Click(n){
	
	alert('위시리스트이동');
	$.ajax({
		url:'ajaxwishlist',
		type:'post',
		data: {book_isbn: n},
		dataType:'text',
		success: function() { alert('위시리스트에 담았습니다.'); },
		error: function() { alert('로그인을 해주세요'); }
	});
}

//페이지 넘버링
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('bookName');
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
<%-- <h1><center>
	<p>Book Store &nbsp; &nbsp;
	<!-- 검색폼 -->
		<input id="bookName" type="text" placeholder="검색어 입력" value="${searchText}" onkeypress="if(event.keyCode == 13){ bookPage(); }">
		<button id="search" onclick="bookPage();" value="검색">검색</button>	</p></center>
	</h1> --%>
	
	<!-- 검색폼 -->
	<h1><center>
	<p><a href="/team2" style="color:black; font-size:35px; font-weight:bold;">Book Store</a> &nbsp; &nbsp;
	<form id="bookName" method="get" action="list">
		<input type="hidden" name="page" id="page" />
		<input type="text" placeholder="검색어 입력" name="searchText" value="${searchText}" onkeypress="if(event.keyCode == 13){ bookPage(); }"/>
		<input type="button" id="search" onclick="javascript: pagingFormSubmit(1); bookPage();" value="검색">
	</form></p></center></h1>
	<!-- /검색폼 --> 

	<br>
	<div class="navigation_bar">
	<table class="gnb_main add_1">
		<tr colspan="5" id="blank"></tr>
		<tr> 
				<td class="class_item"><a href="url" class="text" style="color:white; font-size:16px;">국내도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="url" class="text" style="color:white; font-size:16px;">외국도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="bookInfo" class="text" style="color:white; font-size:16px;">책 상세정보</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="blogmain" class="text" style="color:white; font-size:16px;">블로그 메인</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="blogmain" class="text" style="color:white; font-size:16px;">고객센터</a></td><td>&nbsp;</td>
			<c:if test="${sessionScope.loginId == null}">
				<td class="class_item2"><a href="condition" style="color:white; font-size:16px;">회원가입</a></td><td>&nbsp;</td>
				<td class="class_item2"><a href="login" style="color:white; font-size:16px;">로그인</a></td><td>&nbsp;</td>
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<td class="class_item2" style="color:white; font-size:16px;"><a href="logout">로그아웃</a></td><td>&nbsp;</td>
				<td class="class_item2" style="color:white; font-size:16px;"><a href="cart">장바구니</a></td><td>&nbsp;</td>
				<td class="class_item2" style="color:white; font-size:16px;"><a href="myblog">개인 블로그</a></td><td>&nbsp;</td>
				<td class="class_item3" style="color:white; font-size:16px;">${sessionScope.loginId}님 환영합니다.</td>
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
		<p style="font-size: 16px; font-weight:bold;"><a href="read?book_isbn=${book.book_isbn}">${book.book_title}</a></p>  <!-- read다음 book_no는 parameterType값 ; controller와 일치해야함 -->
		<p style="font-size: 14px; font-weight:normal;">저자: ${book.book_author}</p>
		<p style="font-size: 12px; font-weight:bold; color:#acacac;"><${book.book_public}></p>
	</td>
	<td class="center" style="width:150px; text-align:center; font-size: 14px;">${book.book_reward}</td>
	<td class="center" style="width:150px; text-align:center; font-size: 14px;"><fmt:formatNumber value="${book.book_price}" pattern="###,###" />원</td>
	<td class="center" style="width:70px; text-align:center;">    
			<a href="#" onclick="bt1Click(${book.book_isbn});" class="btn btn-primary">Add to Cart</a><br><br>
			<a href="#" onclick="bt2Click(${book.book_isbn});" class="btn btn-primary">위시리스트</a>
	</td>
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
		<c:if test="${counter == navi.currentPage}"></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>

</div><!-- /페이지 이동 끝 -->


</div><!-- box3 -->


<div class="card-footer">Footer</div>
</body>
</html>