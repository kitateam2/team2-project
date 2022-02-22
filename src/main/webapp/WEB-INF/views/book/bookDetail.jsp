<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>

<link href="resources/css/header.css" rel="stylesheet"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 검색창 디자인 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script>
//검색 페이지 이동
function bookPage() {
	var bookname = document.getElementById("bookName").value;
	location.href = 'bookInfo?bookname='+bookname;
}

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
</script>

</head>

<body>
<!-- header부분 -->
<div class="box3">
<br>
<h1><center>
	<p>Book Store &nbsp; &nbsp;
	<!-- 검색폼 -->
		<input id="bookName" type="text" placeholder="검색어 입력" value="${searchText}">
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


</body>
</html>