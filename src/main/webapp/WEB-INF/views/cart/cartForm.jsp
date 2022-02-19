<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<style>

body
{
  margin:0 auto;
  padding:0;
  background-color:#EFE8E2;
  font-family:tahoma;
}
.paid
{
 display:none;
  width:300px;
  margin:0 auto;
    background-color:#fff;
  text-align:center;
  padding-top:25px;
  border-radius:0px 0px 10px 10px;
  padding-bottom:25px; 
  color:#00773D;
  line-height:30px;
}
.paid p
{
  background-image:url("http://dc455.4shared.com/download/VILITso0/tsid20130720-183900-9216b81f/check.png");
  background-repeat:no-repeat;
  background-position:left center;
  padding-left:30px;
  width:190px;
  margin:0 auto;
}
.container
{
  width:700px;
  margin:50px auto;
}
.tab
{
  width:500px;
  margin:0 auto;
  height:10px;
  background-color:#2B2929;
  border-radius:50px
}
.receipt
{
   background-color:#FAFAF9;
  padding-top:20px;
    width:700px;
  height:300px;
  margin:-5px auto;
  border-radius:5px 5px 50px 50px;
  -moz-box-shadow: 0 10px 30px rgba(0,0,0,0.3);
-webkit-box-shadow: 0 10px 30px rgba(0,0,0,0.3);
box-shadow: 0 10px 30px rgba(0,0,0,0.3);
}
.paper
{ 
  border-top:1px dashed #ccc;
  width:96%;
  margin:0 auto;
}
.title
{
  color:#00773D;
  margin-top:20px;
  margin-left:10px;
  font-weight:bold;
  float:left;
  font-size:16px;
  line-height:30px;
}
.date
{
  color:#00773D;
  margin-top:20px;
  margin-right:10px;
  font-weight:lighter;
  float:right;
  font-size:12px;
    line-height:30px;
}
table
{
  clear:both;
  width:95%;
  margin:0 auto;
  color:#5B5B5B;
  font-size:12px;
  padding-top:10px;
  padding-bottom:20px;
  border-bottom:1px dashed #ccc;
}
.right
{
  text-align:right;
}
.center
{
  text-align:center;
  padding-top:20px;
}
input[type=button]
{
  background-color:#00874C;
  outlie:none;
  border:1px solid #ccc;
  padding:10px;
  border-radius:5px;
  font-weight:bold;
  color:#fff;
  padding-left:30px;
  background-image:url("http://dc707.4shared.com/img/zr6_o80l/s3/13ffd4de138/cart.png");
  background-repeat:no-repeat;
  background-position:5px center;
}
input[type=button]:hover
{
  -moz-box-shadow: 0 10px 30px rgba(0,0,0,0.3);
-webkit-box-shadow: 0 10px 30px rgba(0,0,0,0.3);
box-shadow: 0 10px 30px rgba(0,0,0,0.3);
  cursor:pointer;
  color:#f0f0f0;
}
.barcode
{
    height: 10px;
  width: 0;
  box-shadow:1px 0 0 1px #343434, 5px 0 0 1px #343434, 10px 0 0 1px #343434, 11px 0 0 1px #343434, 15px 0 0 1px #343434, 18px 0 0 1px #343434, 22px 0 0 1px #343434, 23px 0 0 1px #343434, 26px 0 0 1px #343434, 30px 0 0 1px #343434, 35px 0 0 1px #343434, 37px 0 0 1px #343434, 41px 0 0 1px #343434, 44px 0 0 1px #343434, 47px 0 0 1px #343434, 51px 0 0 1px #343434, 56px 0 0 1px #343434, 59px 0 0 1px #343434, 64px 0 0 1px #343434, 68px 0 0 1px #343434, 72px 0 0 1px #343434, 74px 0 0 1px #343434, 77px 0 0 1px #343434, 81px 0 0 1px #343434;
  display:inline-block;
  margin-right:85px;
}
.sign
{
text-align:center;
}
.thankyou
{
  line-height:14px;
  font-size:10px;
  margin-top:5px;
  color:#5B5B5B;
  width:100%;
}

</style>

</head>

<body>

 <div class="container">
        <div class="tab"></div>
        <div class="paid"><p>Receipt Paid successfully</p></div>
        <div class="receipt">
        <div class="paper">
          <div class="title">장바구니</div>
          <div class="date">Date: 20/07/2013</div>    
          <table>
            <tbody>
            <tr>
		<th>번호</th>
		<th>책제목</th>
		<th style="width:220px">날짜</th>
		<th>수량</th>
		<th>유저카트넘버</th>
		<th>가격</th> 
	</tr>
              <c:forEach var="cart" items="${Cart_book1}">
		<form action="update" method="get">
		<tr>
			<th>${cart.cart_book_no}</th>
			<th>${cart.book_title}</th>
			<th>${cart.cart_book_inputdate}</th>                                
			<th>
				<input type="hidden" id=cart_book_no name="cart_book_no" value="${cart.cart_book_no}">
				<input type="number" name="cart_book_count" placeholder="${cart.cart_book_count} " id="count" style="width:50px">
			</th>
			<th>${cart.user_cart_no}</th>
			<th>${cart.book_price}</th>
			<th><a href="delete?cart_book_no=${cart.cart_book_no}"  class="btn btn-primary">삭제</a></th>
			<th><input type="submit" value="수정"></th>
		</tr> 
		</form>
		</c:forEach>
		
      
          </tbody>
          </table>
          <form action="checkout" method="get">
          <table>
          <tr>
          <td colspan="2" class="center"><input type="submit" value="Pay Now"></td>
          </tr>
           </table>
          </form>
         
          
          </div>
          </div>
          <div class="sign center">
            <div class="barcode"></div>
            <br/>
            0123456789
            <br/>
            <div class="thankyou">
            Thank you for your business
            </div>
          </div>
        </div>
        
        <div>
      </div>


<%-- <table  style="border:solid; 1px;">

	<tr>
		<th>번호</th>
		<th>책제목</th>
		<th style="width:220px">날짜</th>
		<th>수량</th>
		<th>유저카트넘버</th>
		<th>가격</th> 
	</tr>


		
	<c:forEach var="cart" items="${Cart_book1}">
		<form action="update" method="get">
		<tr>
			<th>${cart.cart_book_no}</th>
			<th>${cart.book_title}</th>
			<th>${cart.cart_book_inputdate}</th>                                
			<th>
				<input type="hidden" id=cart_book_no name="cart_book_no" value="${cart.cart_book_no}">
				<input type="number" name="cart_book_count" placeholder="${cart.cart_book_count} " id="count">
			</th>
			<th>${cart.user_cart_no}</th>
			<th>${cart.book_price}</th>
			<th><a href="delete?cart_book_no=${cart.cart_book_no}"  class="btn btn-primary">삭제</a></th>
			<th><input type="submit" value="수정"></th>
		</tr> 
		</form>
	</c:forEach>
</table>
	합계${cart_total}원 --%>
</body>