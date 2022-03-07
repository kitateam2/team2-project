<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function selectId(id) {
	opener.document.getElementById('id').value = id;
	this.close();}
</script>
<style>

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
    width: 332px;
    height: 50px;
  }
  
  h1 {
   align-items: center;
  }

form input[type="submit"] {
    border: solid 1px;
    box-sizing: border-box;
    height: 50px;
    width: 12%;
    cursor: pointer;
    position: relative;
    top:-37px;
    left:153px;
    padding: 0;
}

 form input {
    border: solid 1px;
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



</style>
</head>
<body>
<div class="centerdiv">


<form action="idcheck" method="post">
ID 중복 확인 <input type="text" name="searchId" id="searchId">
		<input type="submit" value="검색">
</form>

<!-- 검색 후에만 출력 -->
<c:if test="${searchId != null}">
	<!-- 검색 결과가 없는 경우에만 출력 -->
	<c:if test="${member == null}">
		<p>${searchId} : 사용할 수 있는 ID입니다.</p>
		<p><input style="border: solid 1px; background: none; text-align: center; outline: none; border-radius: 40px;"type="button" value="ID사용하기" onclick="selectId('${searchId}')"></p>
	</c:if>
	<!-- 검색 결과가 있는 경우에만 출력 -->
	<c:if test="${member != null}">
		<p>${searchId} : 이미 사용중인 ID입니다.</p>
	</c:if>
</c:if>

</div>
</body>
</html>