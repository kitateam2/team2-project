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
  
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>
//삭제하기
function bt_delete(post_no) {
	if (confirm('삭제하시겠습니까?')) {
		location.href = 'post_delete?post_no=${one_post.post_no}';
	}
}

//리플 쓰기 폼 체크
function post_comment_form() {
	var text = document.getElementById('post_comment_content');

	if (text.value.length < 3) {
		alert('댓글 내용을 3글자 이상 입력하세요.');
		text.focus();
		text.select();
		return false;
	}
	return true;			
}

</script>
	<title>게시글 상세보기</title>
</head>
<body>
<div class="container" >
<h1>
	Hello world!  
</h1>
	<table>
			<tr>
				<th>작성자</th>
				<td>
					${one_post.user_id}
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					${one_post.post_title}
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					${one_post.post_contents}
				</td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td>
					${one_post.post_uploaddate}
				</td>
			</tr>
			
			<!-- 나중에 이미지도 들어가게 해야해 -->
	</table>
<!-- 	https://chobopark.tistory.com/159 -->
		<button onclick="location.href='main';">목록으로 돌아가기</button>

<c:if test="${sessionScope.loginId == one_post.user_id}">
<tr>
	<th colspan="2" style="height:50px;">
		<input id="btUpdate" type="button" value="수정">
			<a href="javascript:bt_delete(${one_post.post_no})">삭제</a>
		
	</th>
</tr>
</c:if>
<br><br>

<!-- 댓글 자리 -->
<form class="card" id="post_comment_form" action="post_comment" method="post"  onsubmit="return post_comment_form()">
	<input type="hidden" name="post_no" value="${one_post.post_no}"/>
	<div class="card-body"><textarea name="post_comment_content" id="post_comment_content" class="form-control" rows="1"></textarea></div>
	<input type="submit" value="댓글등록" />
</form>
	
	<br>
	
	<!-- 댓글 리스트 -->
	<table>
		<tr><th> 댓글 리스트 </th></tr>
		<c:forEach var=post_comment items="">
		<ul>
			
			<li>
			  	<div>댓글 내용 오는 곳</div>
			  	<div >
				  	<div>작성자 : {이렇게 해서 글 쓴 사람}  </div>
				  	<button class="badge">삭제</button>
			  	</div>
		  	</li>
		  	
		</ul>
		</c:forEach>
</table>
</body>
</html>