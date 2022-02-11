<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
* {
    margin: 0;
    padding: 0;
  }
  body{
    background-color: white;
    background-size:auto
}
  body {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
  }
  form {
    background-color: ivory;
    padding: 20px;
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.8);
    width: 500px;
    height: 800px;
  }
  form h2 {
    margin-top: 20px;
    font-size: 2.5rem;
    color: black;
  }
  form input {
    border: none;
    background: none;
    text-align: center;
    outline: none;
    padding: 10px;
    margin: 20px;
    color: black;
    height: 30px;
    width: 70%;
    border-radius: 40px;
    transition: 0.2s ease-in;
  }
  form input[type="text"],
  form input[type="tel"],
  form input[type="password"] {
    border: solid 2px green;
  }
  form input[type="submit"] {
    border: solid 2px #ec3b3b;
    box-sizing: border-box;
    height: 50px;
    width: 50%;
    cursor: pointer;
  }
 
  
 
  
</style>
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
	
	<form action="join" method="post" onsubmit="return validationCheck();">
	<h2>[회원가입]</h2>
			<input type="text" placeholder="Enter Userid" id="id" name="user_id">
			<input type="password" placeholder="Enter password" id="password" name="user_pw">
			<input type="password" placeholder="Enter password" id="password-check">
			<input type="text" placeholder="Enter Username" id="name" name="user_name">
			<input type="text" placeholder="Enter Userbirth" id="birth" name="user_birth">
			<input type="text" placeholder="Enter Userphone" id="phone_number" name="user_phone">
			<input type="text" placeholder="Enter Useraddress" id="adress" name="user_address">
			<input type="text" placeholder="Enter Usergenre" id="genre" name="user_genre">
			<input type="submit" value="가입">
	</form>
	
</body>
</html>
