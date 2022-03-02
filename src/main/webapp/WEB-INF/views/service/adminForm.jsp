<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<p>관리자 채팅 리스트</p>
<div>
	<c:forEach var="adminroom" items="${adminroomlist}">
		<a href="chatadmin?roomid1=${adminroom.chatroom_id}">${adminroom.chatroom_id}</a><br>
	</c:forEach>
</div>
<%@ include file="../footerEcho.jsp" %>
</body>
</html>