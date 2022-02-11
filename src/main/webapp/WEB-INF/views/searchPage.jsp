<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>team2 도서 검색</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
<script type="text/javascript">
$(document).ready(function () {
	$("#search").click(function () {
		$.ajax({
 	 		method: "GET",
  			url: "https://dapi.kakao.com/v3/search/book",
  			data: { query: $("#bookName").val() },
			headers: { Authorization: "KakaoAK 90e1d3216d963adfc7f754516725431f"}
		})
  			.done(function(res) {
  				$("coverimg").append("<img src='" + res.documents[0].thumbnail + "'/>");
  	    		$("h5").append(res.documents[0].title);
  				$(".card-text").append(res.documents[0].contents);
  				$(".card-author").append(res.documents[0].authors);
  				$(".card-publisher").append(res.documents[0].publisher);

  			});
	});
});
</script>

</head>
<body>
<br>
		<h1>도서 검색 실습</h1>

		<input id="bookName" type="text">
		<button id="search">검색</button>

		<div style="height:50px;"></div>
		
	<!-- 결과값 담는 곳 -->
	<div class="card mb-3" style="max-width: 60%; border: none;">
	<div class="row g-0">
	<div class="col-md-4" id="coverimg"></div>
	<div class="col-md-8">
		<div class="card-body">
		<h5 class="card-title"></h5>
		<p class="card-author"></p>
		<p class="card-publisher"></p>
		<p class="card-text"></p>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
