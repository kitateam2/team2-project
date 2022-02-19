<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
주문이 완료되었습니다
<c:forEach var="cart" items="${Cart_book1}">
${cart.cart_book_no}
</c:forEach>
</body>
</html>