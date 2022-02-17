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

		function message_new(login_id){

			var div = document.getElementById("message_new_form");

			var str = '<div>'
			
				str += '쪽지 보내기'
				str += '<form id="message_new" action="new" method="post" onsubmit="return message_new_formCheck()">'
				str += '<table  border="1">'
				str += '<tr>'
				str += '<td>'
				str += '<table  border="1">'
				str += '<tr>'
				str += '<td>발신인  </td>'
				str += '<td colspan="2">${sessionScope.loginId}</td>'
				str += '</tr>'
				str += '<tr>'
				str += '<td>수신인  </td>'
				str += '<td><input type="text" name="message_recv_id" id="message_recv_id" placeholder="받는 분 아이디"/>'
				str += '</td>'
				str += '<td><%= sf2.format(nowTime) %></td>'
				str += '</tr>'
				str += '</table>'
				str += '</td>'
				str += '</tr>'
				str += '<tr>'
				str += '<td><textarea name="message_contents" id="message_contents" rows="20"></textarea></td>'
				str += '</tr>'
				str += '<tr><td><input type="submit" value="보내기"></td></tr>'
				str += '</table>'
				str += '</form><!-- 쪽지 보내기 폼 -->'
				str += '</div>'
				div.innerHTML = str;
			}
	</script>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world! 
	${sessionScope.loginId} 님 오늘도 친구들과 즐거운 소통하세요~ 
</h1>

쪽지 메인페이지

<div class="container-fluid row">
	<div class="col-sm-4" style="background-color:lavender;"> 
	쪽지 리스트(받은 목록)
	
			<table  border="1">
			<c:forEach var="message_list" items="${message_list}">
				<tr><td>보낸사람:  ${message_list.message_sent_id}</td></tr>
				<tr><td><a href="window?message_no=${message_list.message_no}">
				내용: 나중에절삭  ${message_list.message_contents}</a></td>
				</tr>
				<tr><td>조회수:  ${message_list.message_hits}</td></tr>
			</c:forEach>
			</table>
			<a href="javascript:message_new()">새글 쓰기</a>
	</div> 
	
	
	<div id="message_new_form" class="col-sm-8" style="background-color:lavenderblush;"> 
	
			<div>
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
													<td colspan="2">${message.message_sent_id}</td>
												</tr>
												<tr>
													<td>수신인 : </td>
													<td>${one_message.message_recv_id}</td>
													<td></td>
												</tr>
												<tr>
													<td>내용 : </td>
													<td>${one_message.message_contents}</td>
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
			
			
			</div><!-- 쪽지 읽기 div -->
	</div><!-- 페이지 좌우로 나누기 위한 값주는 div -->
</div>
</body>
</html>
