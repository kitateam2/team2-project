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
	#left {		
		background-color: rgb(230, 230, 250);		
		float: left;		
		width: 250px;
		height: 100%;
	}
	
	.mainlink {
		height: 35px;
		text-align:center;
		margin: 10px;		
	}
	
	.btn {		
		background-Color: white;		
		width: 100px; height: 30px;
		border-radius: 10px;			
		border: 2px solid rgb(210, 210, 230);
		box-shadow:1px 2px 3px 0px;
		cursor: pointer;		
	}	
	
	.btn:active {
		transform: translateY(1px);
		border-radius: 10px;
		
	}
	
	.searchtext {
		border: 1px solid rgb(210, 210, 230);		
	}
		
	.idlist {
		margin: auto;		
		width: 170px;
		text-align: center;
		border: 4px solid rgb(210, 210, 230);
		border-collapse: collapse;		
  		border-radius: 10px;  		
	}
	
	.footer {
		position: absolute;
		bottom: 20px;
		left: 20px;
		height: 30px;
		cursor: pointer;	
	}
</style>
<script>
	function pagingFormSubmit(currentPage) {
		var form = document.getElementById('pagingForm');
		var page = document.getElementById('page');
		page.value = currentPage;
		form.submit();
	}
</script>
</head>
<body>
<div id="left">

	<div class="mainlink">
		<input class="btn" type="button" onclick="location.href='/team2'" value="HOME"> &nbsp;
		<input class="btn" type="button" onclick="location.href='/team2/blogmain'" value="BLOG">
	</div>
	
<!-- 검색 -->
<br><br>
	<div style="text-align:center;">
		<form id="pagingForm" method="get" action="${pageContext.request.contextPath}/blogmain">
			<input type="hidden" name="page" id="page">
			<input class="searchtext" type="text" name="searchText" value="${searchText}" onkeypress="if( event.keyCode == 13 ){pagingFormSubmit(1);}" style="width: 50%; display: inline-block;" placeholder="Search">
			<input type="button" onclick="pagingFormSubmit(1)" value="검색">				
		</form>
	</div>

<!-- 블로그 글 조회수 합계순위 -->
<br><br>
	<div>
		<table class="idlist">	
				<tr style="background-color:rgb(210, 210, 230);">
					<td colspan="2">
						<div title="블로그 포스트 조회수의 합이 높은 순서로 보여줍니다." style="cursor:help;">
							<div style="display:inling-block;">추천 블로그</div>						
						</div>				
					</td>
				</tr>
			<c:forEach var="rank" items="${ranklist}" varStatus="status">
				<tr style="border: 2px solid rgb(210, 210, 230); cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/myblog/${rank.user_id}'">
					<td width="35px;" style="font-weight:bold;">${status.count}</td>
					<td>${rank.user_id}</td>				
				</tr>	
			</c:forEach>
		</table>
	</div>
	
<!-- 푸터 -->
	<div class="footer" onclick="location.href='${pageContext.request.contextPath}/userService'" title="고객센터">		
		<img src="resources/img/customer.png" width="30px" height="30px">
	</div>
	
</div>
</body>
</html>