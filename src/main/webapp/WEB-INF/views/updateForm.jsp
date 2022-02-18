<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="updatemember" method="POST" onsubmit="return formCheck()">
비밀번호<input type="password" name="user_pw" id="password">
		<br>
비밀번호확인<input type="password2" name="user_pw" id="password2">
		<br>
이름		<input type="text" name="user_name" id="user_name" value="${member.user_name}">
		<br>
생일		<input type="text" name="user_birth" id="user_birth" value="${member.user_birth}">
		<br>		
전화번호	<input type="text" name="user_phone" value="${member.user_phone}">
		<br>
주소		<input type="text" name="user_address" value="${member.user_address}">
		<br>
장르	<input type="text" name="user_genre" id="genre"value="${member.user_genre}">
		<br>
<input type="submit" value="수정">
<input type="reset" value="다시쓰기">

</form>
</body>
</html>