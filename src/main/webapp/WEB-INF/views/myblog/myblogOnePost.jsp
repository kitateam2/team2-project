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
//게시글 삭제하기
function bt_delete(post_no) {
	if (confirm('삭제하시겠습니까?')) {
		location.href = '../post_delete?post_no=${one_post.post_no}';
	}
}

//게시글 수정하기
function bt_edit(){
	if (confirm('수정하시겠습니까?'))
		location.href = '../post_edit?post_no=${one_post.post_no}';
}

//댓글 쓰기 폼 체크
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

//댓글 삭제하기
function post_comment_delete(post_comment_no, post_no){
	if (confirm('댓글을 삭제하시겠습니까?')){
		location.href='../post_comment_delete?post_comment_no=' + post_comment_no + '&post_no=' + post_no;
		}
}

function post_comment_like(post_comment_no, post_no){
	location.href='../post_comment_like?post_comment_no=' + post_comment_no + '& post_no=' + post_no;
	alert('해당 댓글이 도움이 되었다니 기뻐요 :)');
}

function post_comment_edit(post_comment_no, post_no, retext){

		var div = document.getElementById("div"+replynum);
	<!-- 댓글 자리 -->
	
	var str = '<form class="card" id="post_comment_form" action="post_comment" method="post"  onsubmit="return post_comment_form()">';
		str += '<input type="hidden" name="post_no" value="${one_post.post_no}"/>';
		str += '<div class="card-body"><textarea name="post_comment_content" id="retext" class="form-control" rows="1"></textarea></div>';
		str += '<input type="submit" value="댓글등록" />';
		str += '</form>';
		div.innerHTML = str;
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
			<c:if test="${one_post.post_originalfile != null}">
			<tr>
				<th>첨부파일</th>
				<td>
						<img src="../${one_post.user_id}/show_file?post_no=${one_post.post_no}">
				</td>
			</tr>
			</c:if>
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
		<button onclick="location.href='../${one_post.user_id}';">목록으로 돌아가기</button>

<c:if test="${sessionScope.loginId == one_post.user_id}">
<tr>
	<th colspan="2" style="height:50px;">
			<a href="javascript:bt_edit(${one_post.post_no})">수정</a>
			<a href="javascript:bt_delete(${one_post.post_no})">삭제</a>
		
	</th>
</tr>
</c:if>
<br><br>

<!-- 댓글 자리 -->
<form class="card" id="post_comment_form" action="../post_comment" method="post"  onsubmit="return post_comment_form()">
	<input type="hidden" name="post_no" value="${one_post.post_no}"/>
	<div class="card-body"><textarea name="post_comment_content" id="retext" class="form-control" rows="1"></textarea></div>
	<input type="submit" value="댓글등록" />

</form>
	
	<br>
	
	<!-- 댓글 리스트 -->
	<table>
		<tr><th> 댓글 리스트 </th></tr>
		<c:forEach var="post_comment" items="${post_comment_list}">
		<tr>
			<td>
				${post_comment.post_comment_writter}
			</td>
			<td>
				${post_comment.post_comment_content}
			</td>
			<td>
				<c:if test="${loginId == post_comment.post_comment_writter}">
					[<a href="javascript:post_comment_edit(${post_comment.post_comment_no}, ${post_comment.post_no}, '${post_comment.post_comment_content}')">수정</a>]
				</c:if>
			</td>
			<td>
				<c:if test="${loginId == post_comment.post_comment_writter}">
					[<a href="javascript:post_comment_delete(${post_comment.post_comment_no}, ${post_comment.post_no})">삭제</a>]
				</c:if>
			</td>
			<c:if test="${loginId != post_comment.post_comment_writter}">
				<td><input type="button" value="도움이 되었어요" onclick="javascript:post_comment_like(${post_comment.post_comment_no}, ${post_comment.post_no})"></td>
			</c:if>
		</tr>	
		<!-- 리플 수정 폼이 나타날 위치  -->
		<td><div id="div${post_comment.post_comment_no}"></div></td>
		<tr><td></td></tr>
		</c:forEach>
	
</table>
</div>
</body>
</html>