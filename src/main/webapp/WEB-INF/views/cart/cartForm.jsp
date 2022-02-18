<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"></script>

</head>

<body>
<table  style="border:solid; 1px;">

	<tr>
		<th>번호</th>
		<th style="width:220px">날짜</th>
		<th>수량</th>
		<th>유저카트넘버</th>
		<th>가격</th>
	</tr>


		
	<c:forEach var="cart" items="${Cart_book1}">
		<form action="update" method="get">
		<tr>
			<th>${cart.cart_book_no}</th>
			<th>${cart.cart_book_inputdate}</th>                                
			<th>
				<input type="hidden" name="cart_book_no" value="${cart.cart_book_no}">
				<input type="number" name="cart_book_count" placeholder="${cart.cart_book_count} " id="count">
			</th>
			<th>${cart.user_cart_no}</th>
			<th>${cart.book_price}</th>
			<th><a href="delete?cart_book_no=${cart.cart_book_no}"  class="btn btn-primary">삭제</a></th> --%>
			<th><input type="submit" value="수정"></th>
		</tr> 
		</form>
	</c:forEach>
</table>
		
</body>