<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
//bt1 버튼 클릭했을때 실행될 함수
function bt1Click(){
	var n = document.getElementById('book_isbn_param').value;
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

function bt2Click(){
	var n = document.getElementById('book_isbn_param').value;
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
				<td class="class_item"><a href="userService" class="text" style="color:white; font-size:16px;">고객센터</a></td><td>&nbsp;</td>
			<c:if test="${sessionScope.loginId == null}">
				<td class="class_item2"><a href="condition" style="color:white; font-size:16px;">회원가입</a></td><td>&nbsp;</td>
				<td class="class_item2"><a href="login" style="color:white; font-size:16px;">로그인</a></td><td>&nbsp;</td>
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<td class="class_item2" style="color:white; font-size:16px;"><a href="logout">로그아웃</a></td><td>&nbsp;</td>
				<td class="class_item2" style="color:white; font-size:16px;"><a href="cart">장바구니</a></td><td>&nbsp;</td>
				<td class="class_item2" style="color:white; font-size:16px;"><a href="myblog/${sessionScope.loginId}">개인 블로그</a></td><td>&nbsp;</td>
				<td class="class_item3" style="color:white; font-size:16px;">${sessionScope.loginId}님 환영합니다.</td>
			</c:if>
		</tr>	
	</table>
	</div> <!-- navigation bar -->

<!-- 여기까지가 header 부분 -->

<!-- 책 상세내용 부분 시작-->
<table style="padding-top:10px;">

<tr>
	<td colspan="3" style="height:35px;"></td>
</tr>
<tr>
	<td rowspan="2" class="center"><img src="download?filename=${book.book_image}" style="object-fit:cover; width:200px; height:300px; vertical-align:top;"></td>
	<td rowspan="3" style="width:80px;"></td>
	<td class="center" style="width:600px; text-align:left;">
		<p style="font-size: 22px; font-weight:bold; color:#3A60DF; width:480px;">${book.book_title}</p>  
		<p style="font-size: 14px; font-weight:normal;">저자: ${book.book_author}&nbsp;<span style="font-size: 14px; font-weight:bold; color:#acacac;"><${book.book_public}></span></p>
		<p style="font-size: 14px; font-weight:normal; color:black;">${book.book_contents}</p>
	</td>
</tr>

<tr>
	<td class="center" style="width:600px; text-align:left;">
		<p style="width:150px; text-align:left; font-size: 14px;">별점: ${book.book_reward}</p>
		<p style="width:150px; text-align:left; font-size: 14px;">정가: <span style="font-size: 22px; font-weight:bold; color:#F84450"><fmt:formatNumber value="${book.book_price}" pattern="###,###" /></span>원</p>
		<p style="width:150px; text-align:left; font-size: 14px;">장바구니 &nbsp; |  &nbsp;위시리스트
			
			<a href="#" onclick="bt1Click(${book.book_isbn});" class="btn btn-primary">Add to Cart</a>
				<input type="hidden" id="book_isbn_param" value="${book.book_isbn}">
			<a href="#" onclick="bt2Click(${book.book_isbn});" class="btn btn-primary">위시리스트</a>

		</p>
	</td>
</tr>
<tr>
	<td colspan="2" style="height:30px;"></td>
</tr>

</table> <!-- 책 상세내용 끗-->



<!-- 댓글 자리 -->
	<form class="card" id="book_review_form" action="book_review" method="post"  onsubmit="return book_review_form()"> <!-- action은 controller의 value값과 일치 -->
		<div class="card-body"><textarea name="book_review_short" id="book_review_short" class="form-control" rows="1"></textarea></div> <!-- vo의 컬럼으로 name을 설정 -->
		<input type="hidden" name="book_isbn" value="${book_isbn}">
		<input type="submit" value="댓글등록" />
	</form>

	<!-- 댓글 리스트 -->
	<table>
		<tr>
			<td><p style="height: 18px;"></p></td>
		</tr>
		<tr>
			<td><p style="font-size: 15px; font-weight:bold;"> 댓글 리스트 </p></td>
		</tr>
		<c:forEach var="book_review" items="${ReviewList}"> <!-- items값은 controller에서 addAttribute의 "" 안에있는 값과 일치해야함 -->
		<tr>
			<td><p style="font-size: 14px; font-weight:normal;">${book_review.book_review_writer}</p></td>
			<td><p style="font-size: 13px; font-weight:normal;">${book_review.book_review_short}</p></td>
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
		
		<tr>
			<td><p style="height: 40px;"></p></td>
		</tr>
	</table>
	
</div><!-- box3 -->

<div class="card-footer">Footer</div>
</body>
</html>