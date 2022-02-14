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
function deleteBoard() {
	if (confirm('삭제하시겠습니까?')) {
		location.href = 'post_delete?post_no=${BlogPost.post_no}';
	}
}
//수정하기
function updateBoard() {
	location.href = 'post_update?post_no=${BlogPost.post_no}';
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
					${one_post.post_id}
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
	</table>
<!-- 	https://chobopark.tistory.com/159 -->
		<button onclick="location.href='main';">목록으로 돌아가기</button>

<c:if test="${sessionScope.loginId == BlogPost.post_id}">
<tr>
<th colspan="2" style="height:50px;">
	<input id="btUpdate" type="button" value="수정">
	<input id="btDelete" type="button" value="삭제">
</th>
</tr>
</c:if>
<br><br>
댓글 자리

	<div class="card">
		<div class="card-body"><textarea class="form-control" rows="1"></textarea></div>
		<div class="card-footer"><button>댓글등록</button></div>
	</div>
	
	<br>
	<div class="card">
		<div class="card-header">댓글 리스트</div>
		<ul class="list-group">
			<li class="list-group-item d-flex justify-content-between">
			  	<div>댓글 내용 오는 곳</div>
			  	<div class="d-flex">
				  	<div>작성자 : {이렇게 해서 글 쓴 사라}  </div>
				  	<button class="badge">삭제</button>
			  	</div>
		  	</li>
		</ul>
	</div>
포스트 전체 페이지
</div>
</body>
</html>