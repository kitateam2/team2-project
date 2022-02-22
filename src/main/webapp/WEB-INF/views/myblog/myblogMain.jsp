<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
function message_window(){
	
	var w = window.open('../message/${sessionScope.loginId}/window', '메시지', 'top=200,left=500,width=1200,height=600');
}

<!-- 페이지 이동 스크립트  -->

function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}
</script>


<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<h2>개인블로그 메인페이지</h2>
<c:if test="${sessionScope.loginId == user_id}">
<div><!-- 개인정보 목록 한덩어리 -->
	<table>
		<tr><td colspan="2">이미지로 기본 사진</td></tr>
		<tr><td colspan="2">${user_id}님 안녕하세요 :)</td></tr>
		<tr><td colspan="2">${sessionScope.loginId}</td></tr>
		<tr><td>회원등급 이모티콘</td>
			<td>팔로우 수 가지고 오기</td></tr>
		<tr><td colspan="2">팔로우 버튼</td></tr>
		<tr><td colspan="2" ><button onclick="message_window()">쪽지로 이동</button></td></tr>
	</table>
</div>
</c:if>

<!-- 팔로우 -->
<c:if test="${sessionScope.loginId == null}">	
	<input type="button" value="로그인" onclick="location.href='${pageContext.request.contextPath}/login'">
</c:if>
<c:if test="${sessionScope.loginId != null}">
	<c:if test="${sessionScope.loginId eq user_id}">
		<input type="button" value="정보수정" onclick="location.href=''">
	</c:if>
	<c:if test="${sessionScope.loginId ne user_id}">
	<c:choose>
		<c:when test="${checkFollow != 1}">
			<form id="follow" action="${user_id}/follow" method="POST">
				<input class="following_btn" type="submit" value="팔로잉">
			</form>
		</c:when>
		<c:otherwise>
			<form id="follow" action="${user_id}/unfollow" method="POST">
				<input class="follower_btn" type="submit" value="언팔로잉">
			</form>
		</c:otherwise>		
	</c:choose>
	</c:if>
</c:if>

<table>
	<tr>
		<th>팔로잉(${countFollowing})</th>
		<th>팔로워(${countFollowed})</th>
	</tr>
	<tr>
		<td>
			<c:forEach var="follow" items="${followingList}">
				<div style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/myblog/${follow.follow_ed_id}'">${follow.follow_ed_id}</div>
			</c:forEach>
		</td>
		<td>
			<c:forEach var="follow" items="${followedList}">
				<div style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/myblog/${follow.follow_ing_id}'">${follow.follow_ing_id}</div>
			</c:forEach>
		</td>
	</tr>
</table>



<div><!-- 글 목록 한덩어리- 글목록 조회수  -->
전체 : ${navi.totalRecordsCount} <!-- 질문 -->
	<table border="1">
	
		<tr>
			<th colspan="4">게시글 목록</th>
			
		</tr>
	<!-- 참고한 주소 https://freehoon.tistory.com/106 -->
	<c:forEach var="postlist" items="${postlist}"> <!-- 리스트 저장한 거 가지고 오는 거  -->
		<tr>
			<td>게시글 번호 : ${postlist.post_no}</td>
			<td>
			<a href="${postlist.user_id}/one_post?post_no=${postlist.post_no}">
						게시글 제목 : ${postlist.post_title}</a>
			</td>
			<td>blank</td>
			<td>게시 시간 : ${postlist.post_uploaddate}</td>
		</tr>
		<tr>
			<td colspan="4">게시글 내용 : ${postlist.post_contents} 내용에 링크</td>
		</tr>
		<tr>
			<td colspan="4">조회수 : ${postlist.post_hits} 오른쪽 정렬로 보여주기 </td>
		</tr>
		
	</c:forEach>
	</table>
</div><!-- 글 목록 한덩어리- 글목록 조회수  -->

<div id="navigator">
<!-- 페이지 이동 부분 -->                      
	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>

<!-- /페이지 이동 끝 -->                      
</div>
<br><br>


<!-- 검색폼 -->
<form id="pagingForm" method="get" action="${user_id}"><!-- 질문 -->
	<input type="hidden" name="page" id="page" />
	제목 : <input type="text"  name="searchText" value="${searchText}" />
	<input type="button" onclick="pagingFormSubmit(1)" value="검색">
</form>
<!-- /검색폼 --> 





<div>
새글 작성하기 한덩어리
개인 정보 목록 아래 따로 버튼 형식으로 
<a href="newPost">글쓰기로 이동 --> 나중에 이름 그냥 글쓰기 버튼으로</a>
</div>

<div><!-- 친구목록 한덩어리  -->
친구 리스트 가지고 오기 
</div>

<div>
<!-- 카테고리 한덩어리(글 목록들을 보여줄지 카테고리로 이미지를 보여줄지) -->
</div>



</body>
</html>
