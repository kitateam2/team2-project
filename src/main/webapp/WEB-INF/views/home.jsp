<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>책 리스트</title>
	<link href="resources/css/header.css" rel="stylesheet"/>
	<link href="resources/css/bookInfo.css" rel="stylesheet"/>
	<link href="resources/css/slide.css" rel="stylesheet"/>
	<link href="resources/css/slide2.css" rel="stylesheet"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
.container {
height: 600;
}
</style>
<script>

//bt1 버튼 클릭했을때 실행될 함수
function bt1Click(n){
	
	alert('장바구니 이동');
	$.ajax({
		url:'ajaxcart',
		type:'post',
		data: {book_isbn: n},
		dataType:'text',
		success: function() { alert('장바구니에 담았습니다.'); },
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    }
	});
}

function bt2Click(n){
	
	alert('위시리스트이동');
	$.ajax({
		url:'ajaxwishlist',
		type:'post',
		data: {book_isbn: n},
		dataType:'text',
		success: function() { alert('위시리스트에 담았습니다.'); },
		error: function() { alert('이미 추가된 상품입니다'); }
	});
}


//검색 페이지 이동 
function bookPage() {
	var searchText = document.getElementById("searchInput").value;
	location.href = 'list?searchText='+searchText;
}
</script>
<body>
    
<!-- header부분 -->
<div class="box3">
<br>
<!--  <h1><center>
	<p style="type"><a href="/team2">Book Store</a>&nbsp; &nbsp;
		<input id="bookName" type="text" placeholder="검색어 입력" >
		<button id="search" onclick="bookPage();" value="검색">검색</button>	</p></center>
	</h1>	-->
	
		<!-- 검색폼 -->
	<h1><center>
	<p style="type"><a href="/team2" style="color:black; font-size:35px; font-weight:bold;">Book Store</a> &nbsp; &nbsp;
	<form id="bookName" method="get" action="list">
		<input type="hidden" name="page" id="page" />
		<input type="text" placeholder="검색어 입력" id="searchInput" name="searchText" value="${searchText}" onkeypress="if(event.keyCode == 13){ bookPage(); }"/>
		<input type="button" id="search" onclick="javascript:bookPage();" value="검색">
	</form></p></center></h1>
	<!-- /검색폼 --> 
	
	
	<br>
	<div class="navigation_bar">
	<table class="gnb_main add_1">
		<tr colspan="5" id="blank"></tr>
		<tr style="font-size: 13px;" > 
				<td class="class_item"><a href="url" class="text" style="color:white; font-size:16px;">국내도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="url" class="text" style="color:white; font-size:16px;">외국도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="bookInfo" class="text" style="color:white; font-size:16px;">책 상세정보</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="blogmain" class="text" style="color:white; font-size:16px;">블로그 메인</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="userService" class="text" style="color:white; font-size:16px;">고객센터</a></td><td>&nbsp;</td>
		</tr>	
	</table>
	
		<c:if test="${sessionScope.loginId == null}">
				<td><a href="condition" style="color:white; position: relative; top: 10px; font-size:16px;" class="fa fa-user-plus fa-2x"></a></td><td>&nbsp;</td>
				<td><a href="login" style="color:white; position: relative; top: 10px; font-size:16px;" class="fa fa-user fa-2x"></a></td><td>&nbsp;</td>
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<a href="logout" style="color:white;position: relative; top: 10px; font-size:16px;">로그아웃</a></td><td>&nbsp;</td>
				<a href="updatemember" style="color:white; position: relative; top: 10px; font-size:16px;">회원정보수정</a></td><td>&nbsp;</td>
				<a href="cart" style="color:white; position: relative; top: 10px; font-size:16px;" class="fa fa-shopping-cart fa-2x"></a></td><td>&nbsp;</td>
				<a href="wish" style="color:white; position: relative; top: 10px; font-size:16px;" class="fa fa-heart fa-2x"></a></td><td>&nbsp;</td>
				<a href="myblog/${sessionScope.loginId}" style="color:white; position: relative; top: 10px; font-size:16px;">개인 블로그</a></td><td>&nbsp;</td>
				<a style="position: relative; top: 10px; font-size:16px;">${sessionScope.loginId}님 환영합니다.</a>
			</c:if>
			
	</div> <!-- navigation bar -->
<div class="container">

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="resources/img/aaa.PNG" alt="Los Angeles" style="width:100%;">
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src="resources/img/aaa.PNG" alt="Chicago" style="width:100%;">
        <div class="carousel-caption">
        </div>
      </div>
    
      <div class="item">
        <img src="resources/img/aaa.PNG" alt="New York" style="width:100%;">
        <div class="carousel-caption">
        </div>
      </div>
 
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

        <section class="product" id="product">
            <h1>신간도서</h1>
            <div class="product-slider">
                <div class="wrapper">
                    <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                      
                    </div>
                    <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" onclick="bt1Click(1111);" class="btn btn-primary">Add to Cart</a>
                    </div>
                    <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                       
                    </div>
                    
                       <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                       
                    </div>
                    
                       <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    
                    </div>
                    
                       <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        
                    </div>
                    
                    
                </div>
                
                
            </div><br><br>
            <section class="aa" id="aa">
            <h1>신간도서</h1>
             <div class="product-slider">
                <div class="wrapper">
                    <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    
                       <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    
                       <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    
                       <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    
                    
                </div>
                </div>
                </section>
        
        <section class="bb" id="bb">
        <h1>인기도서</h1>
             <div class="product-slider">
                <div class="wrapper">
                    <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    
                       <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    
                       <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    
                       <div class="box">
                        <img src="resources/img/898392067x_3.jpg" alt="">
                        <h3>Read Best Book</h3>
                        <div class="price">$99</div>
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                    
                    
                </div>
        </div>
        </section>

</div> <!-- box3 -->


<div class="card-footer">Footer</div>
            
 <%--            <c:forEach var="cart" items="${Cart_book1}">  
            <a href="#" onclick="bt1Click(${cart.book_isbn});" class="btn btn-primary">Add to Cart</a>
            </c:forEach>
            
		<c:forEach var="wishlist" items="${wishCart_book1}">
		<a href="#" onclick="bt2Click(${wishlist.book_isbn});" class="btn btn-primary">위시리스트</a>
		</c:forEach>    --%>        

</body>
</html>
