<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <table>
            <tbody>
            <tr>
		<th>책제목</th>
		<th>책isbn</th>
		<th>가격</th>
		<th>오더넘버</th>
	</tr>
<h1>오더</h1>
 <c:forEach var="order" items="${orderlistcart}">
 <tr>
 <th>${order.book_title}</th>
 <th>${order.book_isbn}</th>
 <th>${order.book_price}</th>
 <th>${order.order_no}</th>
 
 </c:forEach>
 </tbody>
          </table>
 <input type="button" value="Pay Now" onClick="location.href='http://localhost:8888/team2/checkout'"/>
</body>
</html>