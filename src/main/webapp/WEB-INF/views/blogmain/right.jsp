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
		position: absolute;
		left: 258px;
		top: 118px;
		height: calc(100vh - 118px);;
		width: calc(100vw - 282.8px);		
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
		vertical-align: top;	
	}
	
	.ellipsis {
		width: 300px;
		height: 55.2px;
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
								<td class="td" onClick="location.href='${pageContext.request.contextPath}/myblog/one_post?post_no=${blog.post_no}'">
							 		<div style="height:250px;"><img class="img" onerror="this.style.display='none'" src="${pageContext.request.contextPath}/myblog/${blog.user_id}/show_file?post_no=${blog.post_no}"></div><br>					
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