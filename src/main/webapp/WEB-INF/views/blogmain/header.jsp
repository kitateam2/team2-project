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
	#header {
		background-color: white;
		position: absolute;
		left: 258px;
		height: 100px;
		width: calc(100vw - 282.8px);
		margin-bottom: 10px;
	}	
		
	.headerbtn {
		background-Color: white;
		border-radius: 5px;			
		border: 2px solid rgb(210, 210, 230);
		font-size: 20px;
		padding: 10px;
		cursor: pointer;		
	}
	
	.gold {
		background: conic-gradient(#edc800, #e3b600, #f3cf00, #ffe800,
			#edc800, #e3b600, #f3cf00, #ffe800,
			#edc800, #e3b600, #f3cf00, #ffe800,
			#edc800, #e3b600, #f3cf00, #ffe800);
		border-radius: 5px;
		cursor: help;
		font-size: 18px;
		font-weight: bold;		
	}

	.silver {
		background: conic-gradient(#d7d7d7, #c3c3c3, #cccccc, #c6c6c6,
			#d7d7d7, #c3c3c3, #cccccc, #c6c6c6,
			#d7d7d7, #c3c3c3, #cccccc, #c6c6c6,
			#d7d7d7, #c3c3c3, #cccccc, #c6c6c6);
		border-radius: 5px;	
		cursor: help;
		font-size: 18px;
		font-weight: bold;	
	}

	.bronze {
		background: conic-gradient(#d95641, #b14439, #b2453a, #d25645, 
			#d95641, #b14439, #b2453a, #d25645,
			#d95641, #b14439, #b2453a, #d25645,
			#d95641, #b14439, #b2453a, #d25645);
		border-radius: 5px;	
		cursor: help;
		font-size: 18px;
		font-weight: bold;		
	}
</style>
</head>
<body>
<div id="header">
	<div style="text-align: right; margin: 10px;">          
		<c:if test="${sessionScope.loginId == null}">
			<input class="headerbtn" type="button" onclick="location.href='condition'" value="회원가입">				
		</c:if>
		<c:if test="${sessionScope.loginId == null}">
			<input class="headerbtn" type="button" onclick="location.href='${pageContext.request.contextPath}/blogmain/login'" value="로그인">									
		</c:if>
		<c:if test="${sessionScope.loginId != null}">
			<c:choose>
				<c:when test="${grade >= 500000}">
					<span class="gold" title="최근 1년간 구매기록 기준으로 10만원 이상 구매시 우수, 50만원 이상 구매시 최우수로 회원등급이 올라갑니다.">최우수</span>
				</c:when>
				<c:when test="${grade < 500000 && grade >= 100000}">
					<span class="silver" title="최근 1년간 구매기록 기준으로 10만원 이상 구매시 우수, 50만원 이상 구매시 최우수로 회원등급이 올라갑니다.">우수</span>
				</c:when>
				<c:otherwise>
					<span class="bronze" title="최근 1년간 구매기록 기준으로 10만원 이상 구매시 우수, 50만원 이상 구매시 최우수로 회원등급이 올라갑니다.">일반</span>
				</c:otherwise>
			</c:choose>				
		</c:if>
			
		<c:if test="${sessionScope.loginId != null}">
			<span style="font-size: 18px; font-weight: bold;">${sessionScope.loginId}님 접속중</span>&nbsp;&nbsp;&nbsp;
		</c:if>
		<c:if test="${sessionScope.loginId != null}">
			<input class="headerbtn" type="button" onclick="location.href='${pageContext.request.contextPath}/myblog/${sessionScope.loginId}'" value="내블로그">				
		</c:if>	
		<c:if test="${sessionScope.loginId != null}">
			<input class="headerbtn" type="button" onclick="location.href='${pageContext.request.contextPath}/blogmain/logout'" value="로그아웃">				
		</c:if>		
	</div>
</div>
</body>
</html>