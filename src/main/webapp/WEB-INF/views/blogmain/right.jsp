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
		background-color: white;	
		float: left;
		width: calc(100% - 266px);							
		height: 100%;		
	}
	
	.header {
		background-color: white;
		margin-top: 10px;
		margin-right: 10px;			
	}
	
	.headerbtn {
		background-Color: white;
		border-radius: 5px;			
		border: 2px solid rgb(210, 210, 230);
		font-size: 20px;
		padding: 10px;
		cursor: pointer;		
	}
		
	.postlist {
		margin: 0 auto;
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
		border: 2px solid rgb(210, 210, 230);
		padding: 0;
		word-break: break-all;		
		margin: 0;	
	}
	
	.ellipsis {
		width: 300px;
		overflow: hidden;
		text-overflow: ellipsis;		
  		display: -webkit-box;
  		-webkit-line-clamp: 3;
  		-webkit-box-orient: vertical;
	}
		
	.img {		
		width: 300px;
		height: 250px;  				
	}	
</style>
</head>
<body>
<div id="right">

<!-- 헤더 -->
	<div class="header">
		<div style="float:right;">          
			<c:if test="${sessionScope.loginId == null}">
				<input class="headerbtn" type="button" onclick="location.href='condition'" value="회원가입">				
			</c:if>
			<c:if test="${sessionScope.loginId == null}">
				<input class="headerbtn" type="button" onclick="location.href='${pageContext.request.contextPath}/blogmain/login'" value="로그인">									
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<span style="font-size: 18px; font-weight: bold;">${sessionScope.loginId}님 접속중</span>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<input class="headerbtn" type="button" onclick="location.href=''" value="내블로그">				
			</c:if>	
			<c:if test="${sessionScope.loginId != null}">
				<input class="headerbtn" type="button" onclick="location.href='${pageContext.request.contextPath}/blogmain/logout'" value="로그아웃">				
			</c:if>		
		</div>
	</div>

<!-- 블로그 목록 -->
<div class="scroll" style="height:100%; overflow:auto">		
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	
		<table class="postlist">
			<c:choose>
				<c:when test="${list != null && fn:length(list) > 0}">
					<c:forEach var="blog" items="${list}">
						<c:if test="{i%j == 0}">
							<tr>
						</c:if>
								<td class="td" onClick="location.href='${pageContext.request.contextPath}/board/read?boardnum=${blog.post_no}'">
							 		<div style="height:250px;"><img class="img" alt="" src="resources/img/background.png"></div><br> <!-- ${blog.post_savedfile} -->					
									<div style="color:rgb(117, 117,117);">@${blog.user_id}</div><br>
									<div class="ellipsis">${blog.post_contents}</div><br><br>
									<div style="float:left; color:rgb(117, 117,117); font-size:12px;">조회수: ${blog.post_hits}</div>
									<div style="float:right; color:rgb(117, 117,117); font-size:12px;">${blog.post_uploaddate}</div>									
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