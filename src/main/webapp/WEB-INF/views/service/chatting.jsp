<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket Chatting</title>
<script src="./resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<link rel="stylesheet" href="resources/css/chat.css">
<script>
$(document).ready(  function() {
	//connectWS();
	//connectSockJS();
	connectStomp();
	
	$('.chat-submit').on('click', function(evt) {
        evt.preventDefault();
        if (!isStomp && socket.readyState !== 1) return;
        
        let msg = $('#chat-insert').val();
        console.log("mmmmmmmmmmmm>>", msg)
        $('#chat-insert').val('');
        if (isStomp)
        	//socket.send('/TTT', {}, JSON.stringify({roomid: 'message', id: 124, msg: msg}));
        	socket.send('/team2/TTT', {}, msg);
        else
            socket.send(msg);
    });
});

var socket = null;
var isStomp = false;

function connectStomp() {
	var sock = new SockJS("/team2/chatting"); // endpoint
    var client = Stomp.over(sock);
	isStomp = true;
	socket = client;
    
    client.connect({}, function () {
        console.log("Connected stompTest!");
        // Controller's MessageMapping, header, message(자유형식)
        client.send('/team2/TTT', {}, "msg: Haha~~~");

        // 해당 토픽을 구독한다!
        client.subscribe('/topic/message', function (event) {
            console.log("!!!!!!!!!!!!event>>", event)
        });
    });

}
/* var url;
var ws;
var socket = null;
var isStomp = false;

$(document).ready(function() {
	//openSession();
	//connectSockJS();
	connectStomp();
	$('.chat-submit').on('click', sendMessage);
	$('#chat-insert').on('keypress', textKeyPress);
});
	//sockjs 웹소켓
	function connectSockJS(){
		var sock = new SockJS('/team2/chatting');
		ws = sock;
		sock.onopen = function(){
			alert('sockjs Open');
		}
		sock.onclose = function(){
			alert('sockjs Close');
		}
		sock.onmessage = receiveMessage; 
	}
	
	//웹 소켓 오픈. 순수 웹소켓
	function openSession() {
		url = 'ws://localhost:8888/team2/chatting';
		ws = new WebSocket(url);
		ws.onopen = function() {
			alert('Open');
		}
		ws.onclose = function() {
			alert('Close');
		}
		ws.onmessage = receiveMessage;
		
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
		ws.send(text);
		$('#chat-insert').val('');
	}
	//메시지를 받으면 화면에 출력
	function receiveMessage(msg) {
		var message = msg.data;
		var messageArray = message.split(",");
		var id = messageArray[0];
		var content = messageArray[1];
		var LR = (${sessionScope.loginId} == id)? "me-chat" : "friend-chat";
		let today = new Date();   
	 
		let hours = today.getHours(); // 시
		let minutes = today.getMinutes();  // 분
		hours = (hours > 12) ? "오후 " + (hours-12) : "오전 " + hours; 
		
		var appendMsg = '<div class="' + LR + '"><div class="' + LR + '-col"><div class="profile-name">' + id +
						'</div><div class="balloon">' + content + '</div></div>' + 
						'<time>' + hours + ':' + minutes + '</time></div>';
		$('.main-chat').append(appendMsg);
	}  */

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