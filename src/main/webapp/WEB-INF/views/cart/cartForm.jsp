<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<table>

<tr>
	<th>번호</th>
	<th style="width:220px">제목</th>
	<th>작성자</th>
	<th>조회수</th>
	<th>등록일</th>
</tr>

<c:forEach var="cart_book1" items="${Cart_book}">

	<td class="center">${Cart_book.book_isbn}</td>
	

</c:forEach>        
<!-- 반복 끝 -->
</table>