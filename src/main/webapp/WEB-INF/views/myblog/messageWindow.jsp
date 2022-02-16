<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh시 mm분 ss초");
	SimpleDateFormat sf2 = new SimpleDateFormat("yyyy/ MM/ dd hh:mm:ss a");
%>
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
			var message_recv_id = document.getElementById('message_recv_id');
			var message_contents = document.getElementById('message_contents');
			
			if (message_recv_id.value == '') {
				alert("받으시는 분 아이디를 입력하세요.");
				message_recv_id.focus();
				message_recv_id.select();
				return false;
			}
			if (message_recv_id.value.length < 3) {
				alert("ID는 3자 이상 일 것 같아요, 확인 후 다시 입력하세요.");
				message_recv_id.focus();
				message_recv_id.select();
				return false;
			}
			if (message_contents.value == '') {
				alert("내용을 입력하세요.");
				message_contents.focus();
				message_contents.select();
				return false;
			}

			alert("<%= sf.format(nowTime) %>에 님께 쪽지를 전송합니다.");
			return true;
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
<c:forEach var="message_list" items="${message_list}">
<div >
<tr><td>보낸사람:  ${message_list.message_sent_id}</td>
</tr>
<tr><td>내용:  ${message_list.message_contents}</td>
</tr>
</div>
</c:forEach>
</table>


</div><!-- 쪽지 리스트 div -->
<div class="col-sm-8" style="background-color:lavenderblush;">

<table  border="1">
쪽지 보이기 


	<tr>
		<td colspan="2">
						<table  border="1">
							<tr>
								<td>제목 : </td>
								<td colspan="2">제목 받아오기</td>
							</tr>
							<tr>
								<td>발신인 : </td>
								<td colspan="2"></td>
							</tr>
							<tr>
								<td>수신인 : </td>
								<td></td>
								<td></td>
							</tr>
						</table>
		
		</td>
	</tr>
	<tr>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td>첨부파일 : </td>
		<td>파일목록불러오기</td>
	</tr>

</table>


</div>쪽지 읽기 div

<div>
 -->
쪽지 보내기
<form id="message_new" action="new" method="post" onsubmit="return message_new_formCheck()">
<table  border="1">
	<tr>
		<td>
						<table  border="1">
							<tr>
								<td>발신인  </td>
								<td colspan="2">${sessionScope.loginId}</td>
							</tr>
							<tr>
								<td>수신인  </td>
								<td><input type="text" name="message_recv_id" id="message_recv_id" placeholder="받는 분 아이디"/>
									</td>
								<td><%= sf2.format(nowTime) %></td>
							</tr>
						</table>
		
		</td>
	</tr>
	<tr>
		<td><textarea name="message_contents" id="message_contents" rows="20"></textarea></td>
	</tr>
	<tr><td><input type="submit" value="보내기"></td></tr>
</table>
</form><!-- 쪽지 보내기 폼 -->

</div><!-- 쪽지보내기 div -->

</div><!-- 페이지 좌우로 나누기 위한 값주는 div -->
</body>
</html>
