<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책벌레</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script>
var url = null;
var echosocket = null;

$(document).ready(function() {
	openSession();
});

//웹 소켓 오픈
function openSession() {
	url = 'ws://localhost:8888/team2/footer';
	var sock = new WebSocket(url);
	echosocket = sock;
	echosocket.onopen = function() {
		console.log('에코 Open');
	}
	echosocket.onclose = function() {
		console.log('에코 Close');
	}
	echosocket.onmessage = receiveMessage;
	
}
//메시지를 받으면 화면에 출력
function receiveMessage(msg) {
	console.log("footerEcho message recieved: ",msg.data);
	let $socketAlert = $('div#socketAlert');
	$socketAlert.html(msg.data);
	$socketAlert.css('display','block');
	setTimeout( function(){
		$socketAlert.css('display','none');
	}, 4000);
	
}

</script>
</head>
<body>
</body>
</html>