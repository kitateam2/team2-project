<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>채팅방 목록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="description" content="Kakao Talk Clone Friend List Page">
    <meta name="keywords" content="KakaoTalk, Clone, Friend">   
    <meta name="robotos" content="noindex, nofollow">
	<link rel="stylesheet" href="resources/css/chatlayout.css">
	<link rel="stylesheet" href="resources/css/chatroom.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	</head>
<body>
		<div id="content">
            <!-- 헤더: 제목, 친구 찾기 버튼, 친구 추가 버튼 -->
            <header>
                <h1>채팅</h1>
                <i class="icon-down-dir"></i>
                <span alt="새로운채팅버튼" title="새로운 채팅">&#xe80a</span>
                <span alt="오픈채팅버튼" title="오픈 채팅">&#xe809</span>
                <span><a href="chatinvite" class="button2">사용자 초대</a></span>
            </header>
            <!-- 친구창, 대화창, 설정창 등 이동 가능한 네비게이터 -->
            <nav>
                <div class="main-menu">
                    <a href="friend.html">
                        <i class="icon-adult" alt="친구메뉴" title="친구"></i>
                    </a>
                    <!-- <a href="chatting.html">
                        <i class="icon-chat" alt="채팅메뉴" title="채팅"></i>
                        <span class="alert-balloon" alt="알림수">3</span>
                    </a>
                    <a href="more_menu.html">
                        <i class="icon-ellipsis" alt="더보기버튼" title="더보기"></i>
                        <span class="alert-balloon" alt="알림수">N</span>
                    </a> -->
                </div>
                <div class="sub-menu">
                    <a href="temp.html" target="_blank">
                        <i class="icon-smile" alt="이모티콘샵바로가기" title="이모티콘샵"></i></a>
                    <i class="icon-bell" alt="알림버튼" title="알림"></i>
                    <i class="icon-cog" alt="설정버튼" title="설정"></i>
                </div>
            </nav>
            <!-- 메인: 채팅 리스트 화면 -->
            <main>
                <ul>
                    <c:forEach var="room" items="${roomlist}">
                    <li>
						<a onclick="window.open('chatting?roomid=${room.chatroom_id}','','width=500,height=600,top=200,left=1000,toolbar=no,menubar=no,scrollbars=1,resizable=1')" 
				style="text-decoration:none;" >
							<img src="resources/img/customer.png" class="profile-img" alt="k페이프로필사진">
                            <div class="talk">
                                <p class="friend-name">${room.chatroom_id}님의 채팅방</p>
                                <c:if test="${room.chatroom_lastid ne null}">
                                	<p class="chat-content">${room.chatroom_lastid}: ${room.chatroom_lastchat}</p>
                            	</c:if>
                            </div>
                            <div class="chat-status">
                                <time>${room.chatroom_lastchattime}</time>
                                <span class="chat-balloon">N</sapn>
                            </div>
						</a>
                    </li>
					</c:forEach>
                </ul>
            </main>
        </div>
</body>
</html>