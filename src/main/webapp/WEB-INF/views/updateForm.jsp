<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    height: 600px;
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
    margin: 5px;
    color: black;
    height: 10px;
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
</head>
<body>

<form action="updatemember" method="POST" onsubmit="return formCheck()">
비밀번호<input type="password" name="user_pw" id="password">
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


</form>
</body>
</html>