<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
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
					${onepost.post_id}
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

포스트 전체 페이지
</body>
</html>