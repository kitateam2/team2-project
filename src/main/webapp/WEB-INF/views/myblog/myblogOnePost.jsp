<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
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
					${onepost.post_title}
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					${onepost.post_contents}
				</td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td>
					${onepost.post_uploaddate}
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

포스트 전체 페이지
</body>
</html>