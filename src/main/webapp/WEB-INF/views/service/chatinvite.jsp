<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 초대</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta name="description" content="Kakao Talk Clone Friend List Page">
<meta name="keywords" content="KakaoTalk, Clone, Friend">
<meta name="robotos" content="noindex, nofollow">
<link rel="stylesheet" href="resources/css/chatlayout.css">
<link rel="stylesheet" href="resources/css/friend.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script>
$(document).ready(  function() {
	$('.create').on('click', function() {
		var checkid = []; // key 값을 담을 배열
		//체크된 아이디 가져온다
		$('.idcheckbox:checked').each(function(){
			checkid.push($(this).val());
		});
		console.log(checkid);
		console.log(JSON.stringify(checkid));
		
		$.ajax({
			url : "createroom",
			type : "POST", 
			traditional : true,
			data : {"checkId":JSON.stringify(checkid)}, 
			//dataType: "json",
			
			success: function(data){
				location.href="/team2/createroom?ids="+data;	
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
		    }
		 });	
	});
});
</script>
</head>
	<body>	
		<c:if test="${error eq 1}">
			<div class="alert alert-warning" role="alert">채팅방을 다시 만들어주세요</div>
		</c:if>
		<input type="button" class="create" value="방생성" style="position: fixed; bottom: 0.5rem; right: 0.5rem;">
        <div id="content">
            <!-- 헤더: 제목, 친구 찾기 버튼, 친구 추가 버튼 -->
            <header> 
                <form action="chatinvite" method="POST">
					<input name="searchId" type="text">
					<input type="submit" value="검색">
	                <input type="button" onclick="location.href='chatmain';" class="back" value="취소">
				</form>
            </header>
            <!-- 친구창, 대화창, 설정창 등 이동 가능한 네비게이터 -->
            <nav>
                <div class="main-menu">
                    <a href="friend.html">
                        <i class="icon-adult" alt="친구메뉴" title="친구"></i>
                    </a>
                    <a href="chatting.html">
                        <i class="icon-chat" alt="채팅메뉴" title="채팅"></i>
                        <span class="alert-balloon" alt="알림수">3</span>
                    </a>
                    <a href="more_menu.html">
                        <i class="icon-ellipsis" alt="더보기버튼" title="더보기"></i>
                        <span class="alert-balloon" alt="알림수">N</span>
                    </a>
                </div>
                <div class="sub-menu">
                    <a href="temp.html" target="_blank">
                        <i class="icon-smile" alt="이모티콘샵바로가기" title="이모티콘샵"></i></a>
                    <i class="icon-bell" alt="알림버튼" title="알림"></i>
                    <i class="icon-cog" alt="설정버튼" title="설정"></i>
                </div>
            </nav>
            <!-- 메인: 친구창 메인 내용 -->
            <main>
            <br>
                <!-- 나의 프로필 -->
                <div>
                    <ul>
                        <li>
                            <img src="resources/img/default.png" alt="나의프로필사진">
                            <div class="profile">
                                <p>${sessionScope.loginId}</p>
                                <p>상태메시지 영역</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- 즐겨찾기 프로필 모음-->
                <div>
                    <div class="profile-title">
                        <h2>모든 사용자</h2>
                    </div>
                    <ul>
                        <!-- <li>
                            <img src="resources/img/profile/profile1.jpg" alt="친구1프로필사진">
                            <div class="profile">
                                <p>친구1</p>
                                <p></p>
                            </div>
                        </li> -->
                        
                        <c:forEach var="idl" items="${idlist}" varStatus="status">
							<li>
								<img src="resources/img/profile/profile${status.count}.jpg" alt="친구2프로필사진">
								<div class="profile">
								<input type="checkbox" class="idcheckbox" value="${idl.user_id}">${idl.user_id}
								</div>
							</li>
						</c:forEach>						
                    </ul>
                </div>
            </main>
        </div>
    </body>
</html>