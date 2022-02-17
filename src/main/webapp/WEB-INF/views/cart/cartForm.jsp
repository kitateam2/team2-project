<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>

<script>
$(document).ready(function() {
	
}); 
function btClick(n){
	
	alert('삭제');
	$.ajax({
		url:'delete',
		type:'get',
		data: {cart_book_no: n},
		dataType:'text',
		success: function() { alert('삭제되었습니다.'); },
		error: function() { alert('실패하였습니다'); }
	});
}
</script>
</head>

<body>
<table  style="border:solid; 1px;">

<tr>
	<th>번호</th>
	<th style="width:220px">날짜</th>
	<th>수량</th>
	<th>유저카트넘버</th>
</tr>


		
		     <c:forEach var="cart" items="${Cart_book1}">
		<tr>
			<th>${cart.cart_book_no}</th>
			<th>${cart.cart_book_inputdate}</th>                                
			<th>
				<input type="number" value="${cart.cart_book_count}">
			</th>
			<th>${cart.user_cart_no}</th>
			<th><a href="delete?cart_book_no=${cart.cart_book_no}"  class="btn btn-primary">삭제</a></th>
			<th><a href="delete?cart_book_no=${cart.cart_book_no}&cart_book_count=${cart.cart_book_count}"  class="btn btn-primary">수정</a></th>
		</c:forEach>
		</table>
</body>