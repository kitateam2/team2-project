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
	<link href="resources/css/header.css" rel="stylesheet"/>
	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<script type="text/javascript">
$(document).ready(function () {
	$("#search").click(function () {
		$.ajax({
 	 		method: "GET",
  			url: "https://dapi.kakao.com/v3/search/book",
  			data: { query: $("#bookName").val(), size:50 },
			headers: { Authorization: "KakaoAK 90e1d3216d963adfc7f754516725431f"}
		})
  			.done(function (res) {
  				//output(res);
  				insert(res);
   			});
	});
});

	function insert(res) {
		//리스트 ()
		let list = res.documents;
		
		$.each(list, function(key, item) {
			
			let book = {"book_title": item.title, "book_isbn": item.isbn, "book_author": item.authors[0], "book_public": item.publisher, 
			"book_price": item.price, "book_image": item.thumbnail, "book_contents": item.contents, "book_inputdate": item.datetime};
			console.log(JSON.stringify(book));
			
			$.ajax({
				url: 'insert_db',
				type: 'POST',
				data: book,
				success: function() {
					console.log('저장됨 -> ' + item.title);
				},
				error: function(e) {
					console.log(JSON.stringify(e));
					return false;
				}
			});
		});
	}
		
		/* $.each(list, function(key, item) {
			console.log('----------------------------------');
			console.log(item.authors);
			console.log(item.contents);
			console.log(item.datetime);
			console.log(item.isbn);
			console.log(item.price);
			console.log(item.publisher);
			console.log(item.thumbnail);
			console.log(item.title);
			}); */
	
	function output(res) {
		console.log(JSON.stringify(res.documents));
			var str = '<table>';
		    $.each(res.documents, function(key, item){
				str += '<tr>';
				str += '<td class="">'
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
	}



</script>
</head>
<body>


<div class="box3">

<br>
	<h1><center>
	<p>Book Store &nbsp; &nbsp;
		<input id="bookName" type="text" placeholder="검색어 입력">
		<button id="search">검색</button>	</p></center>
	</h1>
	<br>
	<div class="navigation_bar" data-ga-category="교보문고_공통_pc" data-ga-action="GNB">
	<table class="gnb_main add_1">
		<tr colspan="5" id="blank"></tr>
		<tr style= "color: white;"> 
			<td class="class_item"><a href="url" class="text">국내도서</a></td><td>&nbsp;</td>
			<td class="class_item"><a href="url" class="text">외국도서</a></td><td>&nbsp;</td>
			<td class="class_item"><a href="url" class="text">e-book</a></td><td>&nbsp;</td>
			<td class="class_item"><a href="url" class="text">만화</a></td><td>&nbsp;</td>
			<td class="class_item"><a href="url" class="text">블로그</a></td><td>&nbsp;</td>
		</tr>
	</table>
	</div>
	
	<!-- 목록 출력 영역 -->
	<div id="listDiv" class="box2"></div>

</div>

<div class="card-footer">Footer</div>
</body>
</html>
