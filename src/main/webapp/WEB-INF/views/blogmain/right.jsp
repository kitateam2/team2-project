<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#right {		
		background-color: pink;	
		float: left;
		width: calc(100% - 266px);					
		height: 100%;		
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
		width: 300px;
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
<div id="right">

<!-- 헤더 -->
	<div style="background-color:yellow;">
		<div style="float:right;">          
			<c:if test="${sessionScope.loginId == null}">
				<a href="condition">회원가입</a>
			</c:if>
			<c:if test="${sessionScope.loginId == null}">
				<a href="${pageContext.request.contextPath}/blogmain/login">로그인</a>					
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<span>${sessionScope.loginId}님 접속중</span>&nbsp;
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<a href="">내블로그</a>
			</c:if>	
			<c:if test="${sessionScope.loginId != null}">
				<a href="${pageContext.request.contextPath}/blogmain/logout">로그아웃</a>
			</c:if>		
		</div>
	</div>

<!-- 블로그 목록 -->
<div class="scroll" style="height:100%; overflow:auto">		
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	
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