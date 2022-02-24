<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script>
$(document).ready(  function() {
	$('.create').on('click', function() {
		var checkid = []; // key 값을 담을 배열
		//체크된 아이디 가져온다
		$('.idcheckbox:checked').each(function(){
			checkid.push($(this).val());
		});
		console.log(checkid);
		console.log(JSON.stringify(checkid));
		
		$.ajax({
			url : "createroom",
			type : "POST", 
			traditional : true,
			data : {"checkId":JSON.stringify(checkid)}, 
			//dataType: "json",
			
			success: function(data){
				location.href="/team2/createroom?ids="+data;	
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
		    }
		 });	
	});
});
</script>
</head>
<body>
<c:if test="${error eq 1}">
	<div class="alert alert-warning" role="alert">채팅방을 다시 만들어주세요</div>
</c:if>
<form action="chatinvite" method="POST">
	<input name="searchId" type="text">
	<input type="submit" value="검색">
</form>

	<c:forEach var="idl" items="${idlist}">
		<p><label><input type="checkbox" class="idcheckbox" value="${idl.user_id}">${idl.user_id}</label></p>
	</c:forEach>
	<input type="button" class="create" value="방생성">

</body>
</html>