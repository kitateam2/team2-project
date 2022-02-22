<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket Chatting</title>
<script src="./resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/chat.css">
<script>
var url;
var sock;

$(document).ready(function() {
	openSession();
	$('.chat-submit').on('click', sendMessage);
	$('#chat-insert').on('keypress', textKeyPress);
});

//웹 소켓 오픈
function openSession() {
	url = 'ws://localhost:8888/team2/chat';
	sock = new WebSocket(url);
	sock.onopen = function() {
		alert('Open');
	}
	sock.onclose = function() {
		alert('Close');
	}
	sock.onmessage = receiveMessage;
	
}
//입력란에서 엔터쳤을 때 서버로 메시지 전송
function textKeyPress(event) {
	if (event.which == 13) {
		sendMessage();
	}
}
//버튼을 클릭하면 서버로 메시지 전송
function sendMessage() {
	var text = $('#chat-insert').val();
	sock.send(text);
	$('#chat-insert').val('');
}
//메시지를 받으면 화면에 출력
function receiveMessage(msg) {
	var message = msg.data;
	var messageArray = message.split(",");
	var id = messageArray[0];
	var content = messageArray[1];
	var LR = ("${sessionScope.loginId}" == id)? "me-chat" : "friend-chat";
	let today = new Date();   
 
	let hours = today.getHours(); // 시
	let minutes = today.getMinutes();  // 분
	hours = (hours > 12) ? "오후 " + (hours-12) : "오전 " + hours; 
	
	var appendMsg = '<div class="' + LR + '"><div class="' + LR + '-col"><div class="profile-name">' + id +
					'</div><div class="balloon">' + content + '</div></div>' + 
					'<time>' + hours + ':' + minutes + '</time></div>';
	$('.main-chat').append(appendMsg);
}

</script>
</head>
<body>
<p>${sessionScope.loginId}세션아이디</p>
<div id="chat-body">
	<main>
                <!-- 고정된 공지사항 영역 -->
                <div class="notice-bar">
                    <i class="icon-bullhorn"></i>
                    <span>멘트를 고정해놓는 곳입니다.</span>
                    <i class="icon-down-open-big"></i>
                </div>
                <!-- 채팅 내용 시작 -->
                <div class="chat-content">
                    <!-- 메시지 시작 날짜 -->
                    <div class="date-line">
                        <time datetime="2021-03-29">2021년 3월 29일 월요일</time>
                    </div>
                    <!-- 채팅 내용 -->
                    <div class="main-chat">
                        <div class="friend-chat">
                            <div class="friend-chat-col">
                                <div class="profile-name">사원</div>
                                <div class="balloon">대리님, 혹시 7시50분에 시간 괜찮으세요?</div>
                                <div class="balloon">저와 커피 한잔 해주실 수 있으실까요? ㅜㅜ</div>
                            </div>
                            <time datetime="07:30:00+09:00">오전 7:30</time>
                        </div>
                        <div class="me-chat">
                            <div class="me-chat-col">
                                <div class="balloon">ㅇㅋzz</div>
                            </div>
                            <time datetime="07:32:00+09:00">오전 7:32</time>
                        </div>
                        
                    </div>
                </div>
                <!-- 채팅 입력창 -->
                <div class="insert-content">
                    <form name="chatform" action="#" method="post">
						<textarea name="chat-insert" id="chat-insert" placeholder ="Type your message" rows="3"></textarea>
						<input type="button" class="chat-submit" value="전송">
                    </form>
                </div>
            </main>
	
</div>


</body>
</html>