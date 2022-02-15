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
		function message_new_formCheck(){

			}
	</script>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

쪽지 메인페이지
-- 쪽지 확인? 기능 나중에 추가

왼쪽에 쪽지 리스트
오른쪽에 쪽지 보이고
아래쪽에 새로운 쪽지 쓰기 -?? 쪽지 내용이 보이던 곳이 글쓰는 곳으로 바뀌는게 어떻게 되지?


또하나의 윈도우 인가?
<div class="container-fluid row">
<div class="col-sm-4" style="background-color:lavender;">
쪽지 리스트

<table  border="1">
<tr><td> 메시지 목록</td></tr>
<tr><td> 메시지 목록</td></tr>
<tr><td> 메시지 목록</td></tr>
<tr><td> 메시지 목록</td></tr>
<tr><td> 메시지 목록</td></tr>
<tr><td> 메시지 목록</td></tr>
<tr><td> 메시지 목록</td></tr>
<tr><td> 메시지 목록</td></tr>
<tr><td> 메시지 목록</td></tr>
<tr><td> 메시지 목록</td></tr>
</table>


</div><!-- 쪽지 리스트 div -->
<div class="col-sm-8" style="background-color:lavenderblush;">
쪽지 보이기 

<table  border="1">
	<tr>
		<td colspan="2">
						<table  border="1">
							<tr>
								<td>제목 : </td>
								<td colspan="2">제목 받아오기</td>
							</tr>
							<tr>
								<td>발신인 : </td>
								<td colspan="2">로그인 아이디 고정하기</td>
							</tr>
							<tr>
								<td>수신인 : </td>
								<td>수신인 아이디 받아오기</td>
								<td>시간 sys로</td>
							</tr>
						</table>
		
		</td>
	</tr>
	<tr>
		<td colspan="2">내용 받아오기 높이 사이즈 고정하게</td>
	</tr>
	<tr>
		<td>첨부파일 : </td>
		<td>파일목록불러오기</td>
	</tr>
</table>


</div><!-- 쪽지 읽기 div -->

<div>

쪽지 보내기
<form id="message_new" action="message/new" metod="post" onsubmit="message_new_formCheck()">
<table  border="1">
	<tr>
		<td colspan="2">
						<table  border="1">
							<tr>
								<td>제목 : </td>
								<td colspan="2"><input type="text" id=""/>어떤 내용의 앞부분 조금만 가지고 올 수 없나 제목 받아오기</td>
							</tr>
							<tr>
								<td>발신인 : </td>
								<td colspan="2">로그인 아이디 고정하기</td>
							</tr>
							<tr>
								<td>수신인 : </td>
								<td>수신인 아이디 받아오기</td>
								<td>시간 sys로</td>
							</tr>
						</table>
		
		</td>
	</tr>
	<tr>
		<td colspan="2">내용 받아오기 높이 사이즈 고정하게</td>
	</tr>
	<tr>
		<td>첨부파일 : </td>
		<td>인풋으로 파일 받아오기</td>
	</tr>
</table>
</form><!-- 쪽지 보내기 폼 -->

</div><!-- 쪽지보내기 div -->

</div><!-- 페이지 좌우로 나누기 위한 값주는 div -->
</body>
</html>
