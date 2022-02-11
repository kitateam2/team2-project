<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 도서 검색</title>

<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function () {
	$("#search").click(function () {
		$.ajax({
 	 		method: "GET",
  			url: "https://dapi.kakao.com/v3/search/book",
  			data: { query:$("#bookName").val() },
			headers: {Authorization: "KakaoAK {90e1d3216d963adfc7f754516725431f}"}
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
</body>
</html>
