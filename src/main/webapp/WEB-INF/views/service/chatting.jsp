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
var socket = null;
var isStomp = false;
var roomid = "${roomid}";

$(document).ready(  function() {
	connectStomp();
	$('.chat-submit').on('click', sendMessage);
	$('#chat-insert').on('keypress', textKeyPress);
	
	$("html").scrollTop($(document).height());
});

//입력란에서 엔터쳤을 때 서버로 메시지 전송
function textKeyPress(event) {
	if (event.which == 13) {
		sendMessage(event);
	}
}
function sendMessage(evt) {
	 evt.preventDefault();
     if (!isStomp && socket.readyState !== 1) return;
     let today = new Date();   
	 let hours = today.getHours(); // 시
	 let minutes = today.getMinutes();  // 분
	 hours = (hours > 12) ? "오후 " + (hours-12) : "오전 " + hours; 
	 let time = hours + ':' + minutes;
	 
     let msg = $('#chat-insert').val();
     console.log("mmmmmmmmmmmm>>", msg)
     $('#chat-insert').val('');
     if (isStomp)
     	socket.send('/TTT/'+roomid, {}, JSON.stringify(
     			{nname: "${sessionScope.loginId}", content: msg, datetime: time}));
     	//socket.send('/TTT', {}, msg);
     else
         socket.send(msg);
     
     $("html").scrollTop($(document).height());
}

function connectStomp() {
	var sock = new SockJS("/team2/chatting"); // endpoint
    var client = Stomp.over(sock);
	isStomp = true;
	socket = client;
    
    client.connect({}, function () {
        //console.log("Connected stompTest!");
        // Controller's MessageMapping, header, message(자유형식)
        //client.send('/TTT', {}, "msg: Haha~~~");

        // 해당 토픽을 구독한다. 메세지 받는곳
        client.subscribe('/topic/message/'+roomid, function (message) {
        	var message_body = JSON.parse(message.body);
        	var id = message_body.nname;
        	var new_chat = message_body.content;
        	var time = message_body.datetime;
            console.log("!!!!!!!!!!!!event>>", message_body)
            var LR = ("${sessionScope.loginId}" == id)? "me-chat" : "friend-chat";
            var appendMsg = '<div class="' + LR + '"><div class="' + LR + '-col"><div class="profile-name">' + id +
			'</div><div class="balloon">' + new_chat + '</div></div>' + 
			'<time>' + time + '</time></div>';
			
			$('.main-chat').append(appendMsg);
			
			var insertchat = id + '/' + new_chat + '/' + time + '/' + roomid;
			$.ajax({
				url : "insertchat",
				type : "POST", 
				data : {"insertchat":insertchat}, 			
				success: function(){
					console.log(insertchat); 
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			    }
			 });	
			
			$("html").scrollTop($(document).height());
        });
    });

}
</script>
</head>
<body>
<div id="chat-body">
	<main>
                <!-- 고정된 공지사항 영역 -->
                <div class="notice-bar">
                    <i class="icon-bullhorn"></i>
                    <span>채팅 참여자: ${roomid}</span>
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
                                <div class="balloon">ㅇㅋzz${roomid}</div>
                            </div>
                            <time datetime="07:32:00+09:00">오전 7:32</time>
                        </div>
                        
                        <c:forEach var="chat" items="${chatlist}">
                        	<c:if test="${sessionScope.loginId eq chat.user_id}">
	 							<div class="me-chat">
	                            <div class="me-chat-col">
								
	                            <div class="profile-name">${chat.user_id}</div>
	                                <div class="balloon">${chat.chat_message}</div>
	                            </div>
	                            <time>${chat.chat_time}</time>
	                       		</div>
							</c:if>
							<c:if test="${sessionScope.loginId ne chat.user_id}">
	 							<div class="friend-chat">
	                            <div class="friend-chat-col">
								
	                            <div class="profile-name">${chat.user_id}</div>
	                                <div class="balloon">${chat.chat_message}</div>
	                            </div>
	                            <time>${chat.chat_time}</time>
	                       		</div>
							</c:if>
						</c:forEach>
						
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