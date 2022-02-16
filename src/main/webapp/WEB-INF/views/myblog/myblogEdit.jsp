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
	function post_formCheck(){
		var title = document.getElementById('post_title');
		var contents = document.getElementById('post_contents');
	
		if(title.value.length < 3){
			alert("제목을 입력하세요.");
			title.focus();
			title.select();
			return false;
			}
		if(contents.value.length < 3){
			alert("내용을 입력하세요.");
			contents.focus();
			contents.select();
			return false;
			}
		return true;
	}
	</script>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  수정하기
</h1>
<h2>새로 글 수정하기</h2>

<!--  메인에 있는 좌측 (
개인정보 덩어리
친구목록 덩어리 
카테고리 덩어리는 그대로 가지고 와야하나? 아니면 그냥 글쓰기만 ?
아니면 글 쓸 때 쓰는 툴들 이미지로?)

글쓰기 폼 덩어리-->
<div>
	<form id="post_write" action="post_edit" method="post" onsubmit="return post_formCheck()">
		<input type="hidden" name="post_no" value="${blogpost.post_no}">
		<div>
			<label for="post_title"> 글 제목</label>
			<input type="text" name="post_title" id="post_title" placeholder="제목을 입력하세요">
		</div>
		<div>
		<label for="post_contents"> 내용</label>
		<textarea rows="10" cols="10" class="summernote" id="post_contents" name="post_contents" ></textarea>
		</div>
		<button type="submit" id="post_save">글 저장하기</button>
	<!-- 나중에 ajex로 쓸 수 있겠지만 일단은 페이지가 바뀌는 것으로 하자 -->
	</form>
		<button onclick="location.href='main';">목록으로 돌아가기</button>
</div>
	<script>
      $('.summernote').summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 2,
        height: 300
      });
    </script>
</body>
</html>