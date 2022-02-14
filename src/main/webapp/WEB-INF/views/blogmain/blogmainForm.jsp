<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그</title>
<style>
	* {		
		font-family: 나눔스퀘어;				
	}
	
	#contents {		
		position: relative;
		margin-left: 100px;
		top: 50px;
		width: 986px;
		height: 725px;
		background-color: skyblue;		
	}
	
	table {
		margin: auto;
		border-spacing: 20px;	
	}	
	
	.scroll {
		-ms-overflow-style: none; /* IE and Edge */
		scrollbar-width: none; /* Firefox */
	}
	
	.scroll::-webkit-scrollbar {
		display: none; /* Chrome, Safari, Opera*/
	}
	
	.td {
		cursor: pointer;		
	}
	
	.ellipsis {
		width: 200px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
		
	.img {		
		width:300px;
		height:250px;			
  		border-radius:5%;		
	}
</style>
</head>
<body>
<%@include file="header.jsp"%>

<!-- contents -->
<div id=contents>
<c:set var="i" value="0" />
<c:set var="j" value="3" />
<div class="scroll" style="height:100%; overflow:auto">
	<table>
		<c:choose>
			<c:when test="${list != null && fn:length(list) > 0}">
				<c:forEach var="blog" items="${list}">
					<c:if test="{i%j == 0}">
						<tr>
					</c:if>
							<td class="td" onClick="location.href='${pageContext.request.contextPath}/board/read?boardnum=${blog.post_no}'">
						 		<div><img class="img" alt="" src="resources/img/background.png"></div><br> <!-- ${blog.post_savedfile} -->					
								<div><span>${blog.post_uploaddate}</span>&nbsp;<span>${blog.user_id}</span></div><br>
								<div class="ellipsis">${blog.post_title}</div><br><br>
							</td>
					<c:if test="${i%j == j-1}">					
						</tr>
					</c:if>
<c:set var="i" value="${i+1}" />
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
</div>
</div>

</body>
</html>