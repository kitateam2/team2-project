<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link href="resources/css/header.css" rel="stylesheet"/>
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
footer {
position: absolute;
bottom: 0;
color: red;

}
</style>
<script>
$(document).ready(function() {
	
});   

//bt1 버튼 클릭했을때 실행될 함수
function bt1Click(n){
	
	alert('장바구니 이동');
	$.ajax({
		url:'ajaxcart',
		type:'post',
		data: {book_isbn: n},
		dataType:'text',
		success: function() { alert('장바구니에 담았습니다.'); },
		error: function() { alert('로그인을 해주세요'); }
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
		error: function() { alert('로그인을 해주세요'); }
	});
}



function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}
</script>
<body>
    
<!-- header부분 -->
<div class="box3">

<br>
	<h1><center>
	<p style="type">Book Store &nbsp; &nbsp;
	<!-- 검색폼 -->
		<input id="bookName" type="text" placeholder="검색어 입력" value="${searchText}">
		<button id="search" onclick="pagingFormSubmit" value="검색">검색</button>	</p></center>
	</h1>
	<br>
	<div class="navigation_bar">
	<table class="gnb_main add_1">
		<tr colspan="5" id="blank"></tr>
		<tr style="font-size: 13px;" > 
				<td class="class_item"><a href="url" class="text" style="color:white;">국내도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="url" class="text" style="color:white;">외국도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="bookInfo" class="text" style="color:white;">책 상세정보</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="blogmain" class="text" style="color:white;">블로그 메인</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="userService" class="text" style="color:white;">고객센터</a></td><td>&nbsp;</td>
		</tr>	
	</table>
	<div class="logbar" id="logbar" style="float:right; font-size:13;">
		<c:if test="${sessionScope.loginId == null}">
				<a href="condition" style="color:white;" class="fa fa-user-plus fa-2x"></a></td><td>&nbsp;</td>
				<a href="login" style="color:white;" class="fa fa-user fa-2x"></a></td><td>&nbsp;</td>
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<a href="logout" style="color:white;">로그아웃</a></td><td>&nbsp;</td>
				<a href="updatemember" style="color:white;">회원정보수정</a></td><td>&nbsp;</td>
				<a href="cart" style="color:white;" class="fa fa-shopping-cart fa-2x"></a></td><td>&nbsp;</td>
				<a href="myblog/${sessionScope.loginId}" style="color:white;">개인 블로그</a></td><td>&nbsp;</td>
				${sessionScope.loginId}님 환영합니다.
			</c:if>
			</div>
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
          <h3>Los Angeles</h3>
          <p>LA is always so much fun!</p>
        </div>
      </div>

      <div class="item">
        <img src="chicago.jpg" alt="Chicago" style="width:100%;">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p>Thank you, Chicago!</p>
        </div>
      </div>
    
      <div class="item">
        <img src="ny.jpg" alt="New York" style="width:100%;">
        <div class="carousel-caption">
          <h3>New York</h3>
          <p>We love the Big Apple!</p>
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
</div><br><br><br><br>

        <section class="product" id="product">
            <h1 class="heading">신간<span>도서</span></h1>
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
            </div><br><br>
            
            <section class="featured" id="featured">
            <h1 class="heading">인기<span>도서</span></h1>
            <div class="box-container">
                <div class="box">
                    <img src="image/3.png" alt="">
                    <h3>Best and cool</h3>
                    <a href="#" class="btn">read more</a>
                </div>
                <div class="box">
                    <img src="image/4.png" alt="">
                    <h3>Free Delivery</h3>
                 
                    <a href="#" class="btn">read more</a>
                </div>
                <div class="box">
                    <img src="image/5.png" alt="">
                    <h3>Fast Payment</h3>
                
                    <a href="#" class="btn">read more</a>
                </div>
                
                 <div class="box">
                    <img src="image/5.png" alt="">
                    <h3>Fast Payment</h3>
                 
                    <a href="#" class="btn">read more</a>
                </div>
                
                 <div class="box">
                    <img src="image/5.png" alt="">
                    <h3>Fast Payment</h3>
   
                    <a href="#" class="btn">read more</a>
                </div>
            </div>
        </section>
        
        
        

</div> <!-- box3 -->

       <c:forEach var="cart" items="${Cart_book1}">
		<a href="#" onclick="bt1Click(${cart.book_isbn});" class="btn btn-primary">Add to Cart</a>
		</c:forEach>
		
		<c:forEach var="wishlist" items="${wishCart_book1}">
		<a href="#" onclick="bt2Click(${wishlist.book_isbn});" class="btn btn-primary">위시리스트</a>
		</c:forEach> 

<div class="footer">풋터풋터풋터풋터</div>
            
          



</body>
</html>
