<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>
<head>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

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
					${BlogPost.post_id}
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					${BlogPost.post_title}
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					${BlogPost.post_contents}
				</td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td>
					${BlogPost.post_uploaddate}
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