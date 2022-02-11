<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<html>
<head>
    <script type="text/javascript">
   $(document).ready(function(){
		$("search").click(function(){
	$.ajex({
		method: "GET",
			url:"https://dapi.kakao.com/v3/search/book",
			data :{ query:$("#bookName").val() },
			headers: {Authorization: "KakaoAK {90e1d3216d963adfc7f754516725431f}"}
			
		})
		.done(function(res){
			$("h5").append(res.documents[0].title);
			$(".card-author").append(res.documents[0].authors);
			});
		});
	});
	</script>

	<title>Home</title>
</head>
<body>

<input id="bookName" type="text">
<button id="search">검색</button>

결과 담는 곳

<div>
<h5 class="card-title"></h5>
<p class="card-author"></p>
</div>

</form>
</body>
</html>