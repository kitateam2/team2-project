<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>team2 도서 검색</title>
<link href="resources/css/bookPage.css" rel="stylesheet"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  
<script type="text/javascript">
$(document).ready(function () {
	$("#search").click(function () {
		$.ajax({
 	 		method: "GET",
  			url: "https://dapi.kakao.com/v3/search/book",
  			data: { query: $("#bookName").val() },
			headers: { Authorization: "KakaoAK 90e1d3216d963adfc7f754516725431f"}
		})
  			.done(function output(res) {
  				
  				var str = '<table>';
  			    $.each(res.documents, function(key, item){
  					str += '<tr>';
  					str += '<td class="tdThumbnail"><img src=' + item.thumbnail + '/></td>';
  					str += '<td class="tdTitle">' + item.title + '</td>';
  					str += '<td class="tdContents">' + item.contents + '</td>';
  					str += '<td class="tdAuthors">' + item.authors + '</td>';
  					str += '<td class="tdPublisher">' + item.publisher + '</td>';
  					str += '</tr>';
  			    });
  			    str += '</table>';
  				
  			    //목록 출력 영역에 내용 삽입
  			    $('#listDiv').html(str);
  			});
	});
});

</script>
</head>
<body>

<div class="box3">

<br>
	<header>
	<div><center>
				<input id="bookName" type="text" placeholder="검색어 입력">
				<button id="search">검색</button></center></div>
			
		
	</header>
	
	<!-- 목록 출력 영역 -->
	<div id="listDiv" class="box2">
	</div>

</div>
</body>
</html>
