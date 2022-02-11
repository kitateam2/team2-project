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
<h2>개인 글쓰는 페이지</h2>

메인에 있는 좌측 (
개인정보 덩어리
친구목록 덩어리 
카테고리 덩어리는 그대로 가지고 와야하나? 아니면 그냥 글쓰기만 ?
아니면 글 쓸 때 쓰는 툴들 이미지로?)

글쓰기 폼 덩어리
<div>
	<form>
		<div>
			<label> 글 제목</label>
			<input type="text" name="post_title" placeholder="제목을 입력하세요">
		</div>
		<div>
		<label> 내용</label>
		<textarea rows="10" cols="10" name="post_contents" placeholder="내용을 입력하세요"></textarea>
		</div>
		<button id="post_save">글 저장하기</button>
	</form>
</div>
</body>
</html>
