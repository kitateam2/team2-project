<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<a href="chatinvite">사용자 초대</a><br>
<p>${data}</p>

<c:forEach var="room" items="${roomlist}">
		<p><label><a href="chatting?roomid=${room.chatroom_id}">${room.chatroom_id}</a></label></p>
</c:forEach>
</body>
</html>