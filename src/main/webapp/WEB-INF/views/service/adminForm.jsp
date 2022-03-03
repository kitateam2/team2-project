<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<style>
nav ul{height:200px; width:18%;}
nav ul{overflow:hidden; overflow-y:scroll;}
</style>
</head>
<body>
<h1>관리자 페이지</h1>
<a href="search">DB에 책 추가</a>
<p>관리자 채팅 리스트</p>
<nav>
	<ul>
        <c:forEach var="adminroom" items="${adminroomlist}">
			<li><a onclick="window.open('${pageContext.request.contextPath}/chatadmin?roomid1=${adminroom.chatroom_id}','','width=448,height=540,top=200,left=800,toolbar=no,menubar=no,scrollbars=1,resizable=1')" 
				style="text-decoration:none;">${adminroom.chatroom_id}</a></li><br>
		</c:forEach>       
	</ul>
</nav>


<%@ include file="../footerEcho.jsp" %>
</body>
</html>