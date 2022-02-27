<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh시 mm분 ss초");
	SimpleDateFormat sf2 = new SimpleDateFormat("yyyy/ MM/ dd hh:mm:ss a");
%>
<html>
<head>
	<script src=""></script>
	<link rel="stylesheet"
			href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- 	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
 -->  
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	
	<script>
		function message_new_formCheck(){
			var message_recv_id = document.getElementById('message_recv_id');
			var message_contents = document.getElementById('message_contents');
			
			if (message_recv_id.value == '') {
				alert("받으시는 분 아이디를 입력하세요.");
				message_recv_id.focus();
				message_recv_id.select();
				return false;
			}
			if (message_recv_id.value.length < 3) {
				alert("ID는 3자 이상 일 것 같아요, 확인 후 다시 입력하세요.");
				message_recv_id.focus();
				message_recv_id.select();
				return false;
			}
			if (message_contents.value == '') {
				alert("내용을 입력하세요.");
				message_contents.focus();
				message_contents.select();
				return false;
			}

			alert("<%= sf.format(nowTime) %>에 님께 쪽지를 전송합니다.");
			return true;
		}

		function auto_recv_complete() {
			let text = $("#message_recv_id").val();
			if (text.length < 2) return;
			
			$("#message_recv_id").autocomplete({
						//source:["aaa", "bbb", "ccc", "ddd", "kkkkkk", "hhhhhh", "kkkfff"]
				autoFocus: true,
			
				source: function(request, response){
							$.ajax({
								url:"json_auto",
								type:'get',
								data: {'text': text},
								dataType:"json",
								
								success: function(data){//배열로 받아야 할 것 같은데
									//alert(JSON.stringify(date));
									 response(data
											 
/* 							                    $.map(data, function(item) {
							                        return {
							                            label: item.data,
							                            value: item.data
							                        };
							                    })
 */							                   )//response
										},//success
								error: function(){
									alert("없는 정보 입니다.");
									}//error
							});
						}//function(request, response)
				
 			});
		}
		</script>
		
		
		<script>
		/* 새글 작성하기 */
		function message_new(login_id){

			var div = document.getElementById("message_new_form");

			var str = '<div>';
			
				str += '쪽지 보내기';
				str += '<form id="message_new" action="new" method="post" onsubmit="return message_new_formCheck()">';
				str += '<table  border="1">';
				str += '<tr>';
				str += '<td>';
				str += '<table  border="1">';
				str += '<tr>';
				str += '<td>발신인  </td>';
				str += '<td colspan="2">${sessionScope.loginId}</td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td><label for = "message_recv_id">수신인</label> </td>';
				str += '<td><input type="text" onkeyup="javascript:auto_recv_complete();" name="message_recv_id" id="message_recv_id" placeholder="받는 분 아이디"/>';
				str += '</td>';
				str += '<td><%= sf2.format(nowTime) %></td>';
				str += '</tr>';
				str += '</table>';
				str += '</td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td><textarea name="message_contents" id="message_contents" rows="20"></textarea></td>';
				str += '</tr>';
				str += '<tr><td><input type="submit" value="보내기"></td></tr>';
				str += '</table>';
				str += '</form><!-- 쪽지 보내기 폼 -->';
				str += '</div>';
				div.innerHTML = str;
			}

		<!-- 페이지 이동 스크립트  -->
		function pagingFormSubmit(currentPage) {
			var form = document.getElementById('pagingForm');
			var page = document.getElementById('page');
			page.value = currentPage;
			form.submit();
		}
	</script>
	

	 <!-- 처음 화면 들어갔을 떄 -->
	<script>
		$(document).ready(function(){
			$('.mail_sent').show();
			$('.mail_recv').hide();
			$('.mail_unopened').hide();
			$('.mail_fav').hide();
			});
	 </script> 
	 
	 <!-- 보낸메시지 받을 때 -->
	 <script>
	 $(document).ready(function(){
		$('.mail_recv_btn').click(function(){
				$('.mail_sent').hide();
				$('.mail_recv').show();
				$('.mail_unopened').hide();
				$('.mail_fav').hide();
				}
			)}
		 )
	 </script>
	 
	 <!-- 받은메시지 누를 때 -->
	 <script>
	 $(document).ready(function(){
		$('.mail_sent_btn').click(function(){
				$('.mail_sent').show();
				$('.mail_recv').hide();
				$('.mail_unopened').hide();
				$('.mail_fav').hide();
			}
		)}
		)
	 </script>
	 
	 <!-- 안읽은 누를 때 -->
	 <script>
	 $(document).ready(function(){
		$('.mail_unopened_btn').click(function(){
				$('.mail_sent').hide();
				$('.mail_recv').hide();
				$('.mail_unopened').show();
				$('.mail_fav').hide();
			}
		)}
		)
	 </script>
	 
	 <!-- 많이 읽은 누를 때 -->
	 <script>
	 $(document).ready(function(){
		$('.mail_fav_btn').click(function(){
				$('.mail_sent').hide();
				$('.mail_recv').hide();
				$('.mail_unopened').hide();
				$('.mail_fav').show();
			}
		)}
		)
	 </script>
	 
	<title>Home</title>
</head>
<body>
<h1>
	Hello world! 
	${sessionScope.loginId} 님 오늘도 친구들과 즐거운 소통하세요~ 
</h1>

쪽지 메인페이지

<div class="btn-group">
  <button type="button" class="btn btn-primary mail_sent_btn">받은 메일</button>
  <button type="button" class="btn btn-primary mail_recv_btn">보낸 메일</button>
  <button type="button" class="btn btn-primary mail_unopened_btn">읽지 않은 메일</button>
  <button type="button" class="btn btn-primary mail_fav_btn">자주 읽은 메일</button>
</div>


<!-- 검색, 목록별, 수신인 자동완성 -->

	<h4>쪽지 리스트(받은 목록)</h4><br>
	
	
	<div class="container-fluid row">
	
	<!-- 받은메일 -->
	<div class="col-sm-4 mail_sent" style="background-color:lavender; "> 
			메시지 개수 : ${navi_recv.totalRecordsCount}
			<table  border="1">
				<c:forEach var="message_list_recv" items="${message_list_recv}">
					<tr>
						<td>보낸사람: </td>
						<td>${message_list_recv.message_sent_id}</td>
					</tr>
					<tr>
						<td>제목: </td>
						<td><a href="window?message_no=${message_list_recv.message_no}">
							${message_list_recv.message_title}</a>
						</td>
					</tr>
					<%-- <tr>
						<td>내용: </td>
						<td><a href="window?message_no=${message_list_recv.message_no}">
							${message_list_recv.message_contents}</a>
						</td>
					</tr> --%>
					<tr>
						<td>조회수: </td>
						<td> ${message_list_recv.message_hits}</td>
					</tr>
				</c:forEach>
			</table>
		<a href="javascript:message_new()">새글 쓰기</a>
			
			<div id="navigator"><!-- 페이지 이동 부분 -->  
				<a href="javascript:pagingFormSubmit(${navi_recv.currentPage - navi_recv.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_recv.currentPage - 1})">◀</a> &nbsp;&nbsp;
			
				<c:forEach var="counter" begin="${navi_recv.startPageGroup}" end="${navi_recv.endPageGroup}"> 
					<c:if test="${counter == navi_recv.currentPage}"></c:if>
						<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
					<c:if test="${counter == navi_recv.currentPage}"></c:if>
				</c:forEach>
				&nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_recv.currentPage + 1})">▶</a> &nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_recv.currentPage + navi_recv.pagePerGroup})">▷▷</a>
			</div><!-- /페이지 이동 끝 --> 
			
			<!-- 검색폼 -->
			<form id="pagingForm" method="get" action="../${user_id}/window"><!-- 질문 -->
				<input type="hidden" name="page" id="page" />
				내용 : <input type="text"  name="searchText" value="${searchText}" />
				<input type="button" onclick="pagingFormSubmit(1)" value="검색">
			</form><!-- /검색폼 --> 
	</div> <!-- 받은메일 -->
	
	
	<!-- 보낸메일 -->
	<div class="col-sm-4 mail_recv" style="background-color:aliceblue;"> 
			메시지 개수 : ${navi_sent.totalRecordsCount}
			<table  border="1">
				<c:forEach var="message_list_sent" items="${message_list_sent}">
					<tr>
						<td>받는사람: </td>
						<td> ${message_list_sent.message_recv_id}</td>
					</tr>
					<tr>
						<td>제목: </td>
						<td><a href="window?message_no=${message_list_sent.message_no}">
							${message_list_sent.message_title}</a>
						</td>
					</tr>
					<%-- <tr>
						<td>내용: </td>
						<td><a href="window?message_no=${message_list_sent.message_no}">
						 	${message_list_sent.message_contents}</a>
						 </td>
					</tr> --%>
					<tr>
						<td>조회수: </td>
						<td> ${message_list_sent.message_hits}</td>
					</tr>
				</c:forEach>
			</table>
			
		<a href="javascript:message_new()">새글 쓰기</a>
			
			<div id="navigator"><!-- 페이지 이동 부분 -->  
				<a href="javascript:pagingFormSubmit(${navi_sent.currentPage - navi_sent.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_sent.currentPage - 1})">◀</a> &nbsp;&nbsp;
			
					<c:forEach var="counter" begin="${navi_sent.startPageGroup}" end="${navi_sent.endPageGroup}"> 
						<c:if test="${counter == navi_sent.currentPage}"></c:if>
							<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
						<c:if test="${counter == navi_sent.currentPage}"></c:if>
					</c:forEach>
					&nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_sent.currentPage + 1})">▶</a> &nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_sent.currentPage + navi_sent.pagePerGroup})">▷▷</a>
			</div><!-- /페이지 이동 끝 --> 
			
			<!-- 검색폼 -->
			<form id="pagingForm" method="get" action="../${user_id}/window"><!-- 질문 -->
				<input type="hidden" name="page" id="page" />
				내용 : <input type="text"  name="searchText" value="${searchText}" />
				<input type="button" onclick="pagingFormSubmit(1)" value="검색">
			</form><!-- /검색폼 --> 
	</div> <!-- 보낸메일 -->
	
	<!-- 읽지 않은 메일 -->
	<div class="col-sm-4 mail_unopened" style="background-color:thistle;"> 
				메시지 개수 : ${navi_unopened.totalRecordsCount}
			<table  border="1">
				<c:forEach var="message_list_unopened" items="${message_list_unopened}">
					<tr>
						<td>보낸사람: </td>
						<td>${message_list_unopened.message_sent_id}</td>
					</tr>
					<tr>
						<td>제목: </td>
						<td><a href="window?message_no=${message_list_unopened.message_no}">
							${message_list_unopened.message_title}</a>
						</td>
					</tr>
					<%-- <tr>
						<td>내용: </td>
						<td><a href="window?message_no=${message_list_unopened.message_no}">
							${message_list_unopened.message_contents}</a>
						</td>
					</tr> --%>
					<tr>
						<td>조회수: </td>
						<td> ${message_list_unopened.message_hits}</td>
					</tr>
				</c:forEach>
			</table>
		<a href="javascript:message_new()">새글 쓰기</a>
			
			<div id="navigator"><!-- 페이지 이동 부분 -->  
				<a href="javascript:pagingFormSubmit(${navi_unopened.currentPage - navi_unopened.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_unopened.currentPage - 1})">◀</a> &nbsp;&nbsp;
			
				<c:forEach var="counter" begin="${navi_unopened.startPageGroup}" end="${navi_unopened.endPageGroup}"> 
					<c:if test="${counter == navi_unopened.currentPage}"></c:if>
						<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
					<c:if test="${counter == navi_unopened.currentPage}"></c:if>
				</c:forEach>
				&nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_unopened.currentPage + 1})">▶</a> &nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_unopened.currentPage + navi_unopened.pagePerGroup})">▷▷</a>
			</div><!-- /페이지 이동 끝 --> 
			
			<!-- 검색폼 -->
			<form id="pagingForm" method="get" action="../${user_id}/window">
				<input type="hidden" name="page" id="page" />
				내용 : <input type="text"  name="searchText" value="${searchText}" />
				<input type="button" onclick="pagingFormSubmit(1)" value="검색">
			</form><!-- /검색폼 --> 
	</div> <!-- _unopened -->
	
	
	<!-- 읽지 않은 메일 -->
	<div class="col-sm-4 mail_fav" style="background-color:thistle;"> 
				메시지 개수 : ${navi_fav.totalRecordsCount}
			<table  border="1">
				<c:forEach var="message_list_fav" items="${message_list_fav}">
					<tr>
						<td>보낸사람: </td>
						<td>${message_list_fav.message_sent_id}</td>
					</tr>
					<tr>
						<td>제목: </td>
						<td><a href="window?message_no=${message_list_fav.message_no}">
							${message_list_fav.message_title}</a>
						</td>
					</tr>
					<%-- <tr>
						<td>내용: </td>
						<td><a href="window?message_no=${message_list_fav.message_no}">
							${message_list_fav.message_contents}</a>
						</td>
					</tr> --%>
					<tr>
						<td>조회수: </td>
						<td> ${message_list_fav.message_hits}</td>
					</tr>
				</c:forEach>
			</table>
		<a href="javascript:message_new()">새글 쓰기</a>
			
			<div id="navigator"><!-- 페이지 이동 부분 -->  
				<a href="javascript:pagingFormSubmit(${navi_fav.currentPage - navi_fav.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_fav.currentPage - 1})">◀</a> &nbsp;&nbsp;
			
				<c:forEach var="counter" begin="${navi_fav.startPageGroup}" end="${navi_fav.endPageGroup}"> 
					<c:if test="${counter == navi_fav.currentPage}"></c:if>
						<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
					<c:if test="${counter == navi_fav.currentPage}"></c:if>
				</c:forEach>
				&nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_fav.currentPage + 1})">▶</a> &nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi_fav.currentPage + navi_fav.pagePerGroup})">▷▷</a>
			</div><!-- /페이지 이동 끝 --> 
			
			<!-- 검색폼 -->
			<form id="pagingForm" method="get" action="../${user_id}/window">
				<input type="hidden" name="page" id="page" />
				내용 : <input type="text"  name="searchText" value="${searchText}" />
				<input type="button" onclick="pagingFormSubmit(1)" value="검색">
			</form><!-- /검색폼 --> 
	</div> <!-- _unopened -->
	
	
	
	
	
	
	<!-- 새 메시지 작성하기 -->
	<div id="message_new_form" class="col-sm-8" style="background-color:lavenderblush;"> 
	
			<div>
					<table  border="1">
					
						<tr>
							<td colspan="2">
											<table  border="1">
												<!-- <tr>
													<td>제목 : </td>
													<td colspan="2">제목 받아오기</td>
												</tr> -->
												<tr>
													<td>발신인 : </td>
													<td colspan="2">${message.message_sent_id}</td>
												</tr>
												<tr>
													<td>수신인 : </td>
													<td>${one_message.message_recv_id}</td>
													<td></td>
												</tr>
												<tr>
													<td>내용 : </td>
													<td>${one_message.message_contents}</td>
													<td></td>
												</tr>
											</table>
							
							</td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<!-- <tr>
							<td>첨부파일 : </td>
							<td>파일목록불러오기</td>
						</tr> -->
					
					</table>
			
			
			</div><!-- 쪽지 읽기 div -->
			
			
	</div><!-- 페이지 좌우로 나누기 위한 값주는 div -->
	
	
	
</div> <!-- class="container-fluid row" -->


  
</body>
</html>
