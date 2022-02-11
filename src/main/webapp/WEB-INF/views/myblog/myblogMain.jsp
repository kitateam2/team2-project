<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<h2>개인블로그 메인페이지</h2>


<div><!-- 글 목록 한덩어리- 글목록 조회수  -->
	<table border="1">
		<tr>
			<th colspan="4">게시글 목록</th>
		</tr>
	<!-- https://freehoon.tistory.com/106 -->
	<c:forEach var="postlist" items="${postlist}"> <!-- 리스트 저장한 거 가지고 오는 거  -->
		<tr>
			<td>게시글 번호 : ${postlist.post_no}</td>
			<td>
			<a href="one_post?post_no=${postlist.post_no}">
						게시글 제목 : ${postlist.post_title}</a>
			</td>
			<td>blank</td>
			<td>게시 시간 : ${postlist.post_uploaddate}</td>
		</tr>
		<tr>
			<td colspan="4">게시글 내용 : ${postlist.post_contents} 내용에 링크</td>
		</tr>
		<tr>
			<td colspan="4">조회수 : ${postlist.post_hits} 오른쪽 정렬로 보여주기 </td>
		</tr>
	</c:forEach>
	</table>


</div>

<div><!-- 개인정보 목록 한덩어리 -->
	<table>
		<tr><td colspan="2">이미지로 기본 사진</td></tr>
		<tr><td colspan="2">{이름정보}님 안녕하세요 :)</td></tr>
		<tr><td colspan="2">(아이디)</td></tr>
		<tr><td>회원등급 이모티콘</td>
			<td>팔로우 수 가지고 오기</td></tr>
		<tr><td colspan="2">팔로우 버튼</td></tr>
		<tr><td colspan="2"><a href="messageWindow">쪽지로 이동</a></td></tr>
	</table>
</div>

<div>
새글 작성하기 한덩어리
개인 정보 목록 아래 따로 버튼 형식으로 
<a href="newPost">글쓰기로 이동 --> 나중에 이름 그냥 글쓰기 버튼으로</a>
</div>

<div><!-- 친구목록 한덩어리  -->
친구 리스트 가지고 오기 
</div>

<div>
<!-- 카테고리 한덩어리(글 목록들을 보여줄지 카테고리로 이미지를 보여줄지) -->
</div>

<a href="test">임시 테스트</a>


</body>
</html>
