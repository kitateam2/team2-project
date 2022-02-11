<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	function validationCheck() {
		var id = document.getElementById('id');
		var pw = document.getElementById('password');
		var pwCheck = document.getElementById('password-check');
	
		if (id.value.length < 3 || id.value.length > 10) {
			alert('아이디는 3~10 글자를 입력하세요');
			return false;
		}
		if (pw.value.length < 3 || pw.value.length > 10) {
			alert('비밀번호는 3~10 글자를 입력하세요');
			return false;
		}
		
		if (pw.value != pwCheck.value) {
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}
		return true;
	}
	</script>
</head>
<body>
	<h1 align="center">[회원가입]</h1>
	<form action="join" method="post" onsubmit="return validationCheck();">
	<table border="1" align="center">
		<tbody>
			<tr>
				<td>아이디</td><td><input type="text" id="id" name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td><td ><input type="password" id="password" name="user_pw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td><td><input type="password" id="password-check"></td>
			</tr>
			<tr>
				<td>이름</td><td><input type="text" id="name" name="user_name"></td>
			</tr>
			
			<tr>
				<td>생년월일</td><td><input type="text" id="birth" name="user_birth"></td>
			</tr>
			<tr>
				<td>휴대폰번호</td><td><input type="tel" id="phone_number" name="user_phone"></td>
			</tr>
			
			<tr>
				<td>주소</td><td><input type="text" id="adress" name="user_address"></td>
			</tr>
			<tr>
				<td>선호장르</td><td><input type="text" id="genre" name="user_genre"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="가입">
				<input type="button" value="취소" onclick="javascript:location.href='./'"></td>
			</tr>
		</tbody>
	</table>
	
	</form>
	
</body>
</html>
