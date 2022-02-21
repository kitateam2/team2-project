<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


<!-- 댓글 함수 -->
<script>
//댓글 쓰기 폼 체크
function book_review_form() {
	var text = document.getElementById('book_review_short');

	if (text.value.length < 3) {
		alert('댓글 내용을 3글자 이상 입력하세요.');
		text.focus();
		text.select();
		return false;
	}
	return true;			
}

//댓글 삭제하기
function book_review_delete(book_review_no, book_review_star){
	if (confirm('댓글을 삭제하시겠습니까?')){
		location.href='book_review_delete?book_review_no=' + book_review_no;
	}
}

<!-- 페이지 이동 스크립트  -->
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}

</script>
</head>

<body>

<div class="box3">
<br>
<h1><center>
	<p>Book Store &nbsp; &nbsp;
	<!-- 검색폼 -->
		<input id="bookName" type="text" placeholder="검색어 입력" value="${searchText}">
		<button id="search" onclick="pagingFormSubmit()" value="검색">검색</button>	</p></center>
	</h1>
	<br>
	<div class="navigation_bar">
	<table class="gnb_main add_1">
		<tr colspan="5" id="blank"></tr>
		<tr> 
				<td class="class_item"><a href="url" class="text">국내도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="url" class="text">외국도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="bookInfo" class="text">책 상세정보</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="blogmain" class="text">블로그 메인</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="blogmain" class="text">고객센터</a></td><td>&nbsp;</td>
			<c:if test="${sessionScope.loginId == null}">
				<td class="class_item2"><a href="condition">회원가입</a></td><td>&nbsp;</td>
				<td class="class_item2"><a href="login">로그인</a></td><td>&nbsp;</td>
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<td class="class_item2"><a href="logout">로그아웃</a></td><td>&nbsp;</td>
				<td class="class_item2"><a href="cart">장바구니</a></td><td>&nbsp;</td>
				<td class="class_item2"><a href="myblog" style="color:white;">개인 블로그</a></td><td>&nbsp;</td>
				<td class="class_item3">${sessionScope.loginId}님 환영합니다.</td>
			</c:if>
		</tr>	
	</table>
	</div> <!-- navigation bar -->

<!-- 여기까지가 header 부분 -->

<div class="container">
      book information
      
<br>
<table>

<tr>
	<th>표지</th>
	<th style="width:220px">책 상세정보</th>
	<th>별점</th>
	<th>가격</th>
	<th>장바구니</th>
</tr>

<!-- 반복 시작 -->
<c:forEach var="book" items="${booklist}">  
<tr>
	<td class="center">${book.book_image}</td>  
	<td>
		<a href="read?book_no=${book.book_isbn}">${book.book_title}</a>  <!-- read다음 book_no는 parameterType값 ; controller와 일치해야함 -->
	</td>
	<td class="center">${book.book_reward}</td>
	<td class="center">${book.book_price}</td>
	<td>장바구니</td>
</tr>

</c:forEach>        
<!-- 반복 끝 -->
</table>
<br/><br/>

<div id="navigator">
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

<!-- /페이지 이동 끝 -->
      
<p><img src="download?filename=${api.book_image}"></p>  <!-- 책 이미지 controller에서 불러오기 지정  -->
  
</div>

	<!-- 댓글 자리 -->
	<form class="card" id="book_review_form" action="book_review" method="post"  onsubmit="return book_review_form()">
		<div class="card-body"><textarea name="book_review_short" id="book_review_short" class="form-control" rows="1"></textarea></div>
		<input type="submit" value="댓글등록" />
	</form>

	<!-- 댓글 리스트 -->
	<table>
		<tr><th> 댓글 리스트 </th></tr>
		<c:forEach var="book_review" items="${BookReviewList}">
		<tr>
			<td>${book_review.book_review_writer}</td>
			<td>${book_review.book_review_short}</td>
			<td><c:if test="${loginId == book_review.book_review_writer}">
				[<a href="javascript:replyEditForm(${book_review.book_review_no},'${book_review.book_review_short}')">수정</a>]
				</c:if>
			</td>
			<td><c:if test="${loginId == book_review.book_review_writer}">
				[<a href="javascript:book_review_delete(${book_review.book_review_no})">삭제</a>]
				</c:if>
			</td>
		</tr>	
		</c:forEach>
	</table>







</div><!-- box3 -->


<div class="card-footer">Footer</div>
</body>
</html>