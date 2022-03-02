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

			var str = '<div class="message-box">';
			
				str += '<form id="message_new" action="new" method="post" onsubmit="return message_new_formCheck()">';
				str += '<table>';
				str += '<tr>';
				str += '<td>';
				str += '<table>';
				str += '<tr>';
				str += '<td><p class="ppp">발신인</p></td>';
				str += '<td colspan="2"><p class="ppp"> : ${sessionScope.loginId}</p></td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td><label for = "message_recv_id"><p class="ppp">수신인</p></label> </td>';
				str += '<td><input type="text" onkeyup="javascript:auto_recv_complete();" name="message_recv_id" id="message_recv_id" placeholder="받는 분 아이디"/>';
				str += '</td>';
				str += '<td><%= sf2.format(nowTime) %></td>';
				str += '</tr>';
				str += '</table>';
				str += '</td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td><textarea name="message_contents" id="message_contents" rows="15" style="width:100%"></textarea></td>';
				str += '</tr>';
				str += '<tr><td><div style="text-align:center;"><input type="submit" class="btn btn-dark btn-wide rounded-0 transition-3d-hover" value="보내기"></div></td></tr>';
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
	 
	<title>메세지</title>
	
	<style type="text/css">
	
	.page-item.active .page-link {
	background-color: black;
    border-color: black;
	}
	
	a{
	color: black;
	}
	
	a.page-link{
	color: black;
	}
	
	p.ppp{
	font-weight : bold;
	}
	
	div.message-box{
	height: 400px;
	padding: 15px;
	}
	
	ul{
		list-style: none;
	}
	</style>
</head>
<body>

                <div class="page-header border-bottom">
                    <div class="container">
                        <div class="d-md-flex justify-content-between align-items-center py-3">
                            <h4 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">MESSAGE</h4>
                             <nav class="woocommerce-breadcrumb font-size-2">
				                    <a href="/team2/blogmain" class="h-primary">Blog Main</a>
				                    <a href="${sessionScope.loginId}" class="h-primary">/ My Blog</a>
				             </nav>
                        </div>
                    </div>
                </div>

<div class="container-fluid row">
<div class="btn-group col-sm-6">
  	<button type="button" class="btn btn-dark btn-wide rounded-0 transition-3d-hover mail_sent_btn">받은 메일(${navi_recv.totalRecordsCount})</button>
  	<button type="button"  class="btn btn-dark btn-wide rounded-0 transition-3d-hover mail_recv_btn">보낸 메일(${navi_sent.totalRecordsCount})</button>
 	 <button type="button"  class="btn btn-dark btn-wide rounded-0 transition-3d-hover mail_unopened_btn">읽지 않은 메일(${navi_unopened.totalRecordsCount})</button>
 	 <button type="button"  class="btn btn-dark btn-wide rounded-0 transition-3d-hover mail_fav_btn">자주 읽은 메일(${navi_fav.totalRecordsCount})</button>
</div>
<div class="btn-group offset-sm-4  col-sm-2">
	<a class="btn btn-dark rounded-0 transition-3d-hover" href="javascript:message_new()">새글 쓰기</a>
</div>
</div>

<!-- 검색, 목록별, 수신인 자동완성 -->

	<div class="container-fluid row">
	
	<!-- 받은메일 -->
	<div class="col-sm-6 mail_sent" style="background-color:lavender; "> 
		<div class="message-box">
			<table  border="1">
				<c:forEach var="message_list_recv" items="${message_list_recv}">
				<%-- 	<tr>
						<td>보낸사람: </td>
						<td>${message_list_recv.message_sent_id}</td>
					</tr>
					<tr>
						<td>제목: </td>
						<td><a href="window?message_no=${message_list_recv.message_no}">
							${message_list_recv.message_title}</a>
						</td>
					</tr>
				
					<tr>
						<td>조회수: </td>
						<td> ${message_list_recv.message_hits}</td>
					</tr> --%>
					
					<ul>
						<li><p class="ppp">보낸이: ${message_list_recv.message_sent_id}</p></li>
						<li><a href="window?message_no=${message_list_recv.message_no}">
							-> ${message_list_recv.message_title}</a></li>
							<hr>
					</ul>
					
				</c:forEach>
			</table>
		</div>
			<!-- 검색폼 -->
			<div style="text-align:center;">
			<form id="pagingForm" method="get" action="../${user_id}/window"><!-- 질문 -->
				<input type="hidden" name="page" id="page" />
				내용 : <input type="text"  name="searchText" value="${searchText}" />
				<input type="button" class="btn btn-dark btn-wide rounded-0 transition-3d-hover onclick="pagingFormSubmit(1)" value="검색">
			</form><!-- /검색폼 --> 
			</div>
			
			<!-- 페이지 이동부분 -->
			<div id="navigator">
	                <nav aria-label="Page navigation example">
	                    <ul class="pagination pagination__custom justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble mb-0">
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_recv.currentPage - navi_recv.pagePerGroup})">Pre</a></li>
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_recv.currentPage - 1})">◀</a></li>
	                        
	                        <c:forEach var="counter" begin="${navi_recv.startPageGroup}" end="${navi_recv.endPageGroup}"> 
								<c:if test="${counter == navi_recv.currentPage}"></c:if>
									<li class="flex-shrink-0 flex-md-shrink-1 page-item active" aria-current="page"><a class="page-link" href="javascript:pagingFormSubmit(${counter})">${counter}</a></li>
								<c:if test="${counter == navi_recv.currentPage}"></c:if>
							</c:forEach>
	                        
	                        
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_recv.currentPage + 1})">▶</a></li>
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_recv.currentPage + navi_recv.pagePerGroup})">Next</a></li>
	                    </ul>
	                </nav>
                </div><!-- 페이지 이동부분 끝-->
			
	</div> <!-- 받은메일 -->
	
	
	<!-- 보낸메일 -->
	<div class="col-sm-6 mail_recv" style="background-color:aliceblue;"> 
		<div class="message-box">
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
		</div>
			<!-- <검색폼> -->
			<div style="text-align:center;">
				<form id="pagingForm" method="get" action="../${user_id}/window"><!-- 질문 -->
					<input type="hidden" name="page" id="page" />
					내용 : <input type="text"  name="searchText" value="${searchText}" />
					<input type="button" class="btn btn-dark btn-wide rounded-0 transition-3d-hover onclick="pagingFormSubmit(1)" value="검색">
				</form>
			</div><!-- /검색폼 --> 
			
			<!-- 페이지 이동부분 -->
			<div id="navigator">
	                <nav aria-label="Page navigation example">
	                    <ul class="pagination pagination__custom justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble mb-0">
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_sent.currentPage - navi_sent.pagePerGroup})">Pre</a></li>
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_sent.currentPage - 1})">◀</a></li>
	                        
	                        <c:forEach var="counter" begin="${navi_sent.startPageGroup}" end="${navi_sent.endPageGroup}"> 
								<c:if test="${counter == navi_sent.currentPage}"></c:if>
									<li class="flex-shrink-0 flex-md-shrink-1 page-item active" aria-current="page"><a class="page-link" href="javascript:pagingFormSubmit(${counter})">${counter}</a></li>
								<c:if test="${counter == navi_sent.currentPage}"></c:if>
							</c:forEach>
	                        
	                        
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_sent.currentPage + 1})">▶</a></li>
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_sent.currentPage + navi_sent.pagePerGroup})">Next</a></li>
	                    </ul>
	                </nav>
                </div><!-- 페이지 이동부분 끝-->
			
	</div> <!-- 보낸메일 -->
	
	<!-- 읽지 않은 메일 -->
	<div class="col-sm-6 mail_unopened" style="background-color:thistle;"> 
		<div class="message-box">
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
		</div>	
			<!-- 검색폼 -->
			<div style="text-align:center;">
				<form id="pagingForm" method="get" action="../${user_id}/window">
					<input type="hidden" name="page" id="page" />
					내용 : <input type="text"  name="searchText" value="${searchText}" />
					<input type="button" class="btn btn-dark btn-wide rounded-0 transition-3d-hover onclick="pagingFormSubmit(1)" value="검색">
				</form>
			</div><!-- /검색폼 --> 
			
			<!-- 페이지 이동부분 -->
			<div id="navigator">
	                <nav aria-label="Page navigation example">
	                    <ul class="pagination pagination__custom justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble mb-0">
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_unopened.currentPage - navi_unopened.pagePerGroup})">Pre</a></li>
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_unopened.currentPage - 1})">◀</a></li>
	                        
	                        <c:forEach var="counter" begin="${navi_unopened.startPageGroup}" end="${navi_unopened.endPageGroup}"> 
								<c:if test="${counter == navi_unopened.currentPage}"></c:if>
									<li class="flex-shrink-0 flex-md-shrink-1 page-item active" aria-current="page"><a class="page-link" href="javascript:pagingFormSubmit(${counter})">${counter}</a></li>
								<c:if test="${counter == navi_unopened.currentPage}"></c:if>
							</c:forEach>
	                        
	                        
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_unopened.currentPage + 1})">▶</a></li>
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_unopened.currentPage + navi_unopened.pagePerGroup})">Next</a></li>
	                    </ul>
	                </nav>
                </div><!-- 페이지 이동부분 끝-->
			
			
	</div> <!-- _unopened -->
	
	
	<!-- 읽지 않은 메일 -->
	<div class="col-sm-6 mail_fav" style="background-color:thistle;"> 
		<div class="message-box">
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
		</div>
			<!-- 검색폼 -->
			<div style="text-align:center;">
				<form id="pagingForm" method="get" action="../${user_id}/window">
					<input type="hidden" name="page" id="page" />
					내용 : <input type="text"  name="searchText" value="${searchText}" />
					<input type="button" class="btn btn-dark btn-wide rounded-0 transition-3d-hover onclick="pagingFormSubmit(1)" value="검색">
				</form>
			</div><!-- /검색폼 --> 
			
			<!-- 페이지 이동부분 -->
			<div id="navigator">
	                <nav aria-label="Page navigation example">
	                    <ul class="pagination pagination__custom justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble mb-0">
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_fav.currentPage - navi_fav.pagePerGroup})">Pre</a></li>
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_fav.currentPage - 1})">◀</a></li>
	                        
	                        <c:forEach var="counter" begin="${navi_fav.startPageGroup}" end="${navi_fav.endPageGroup}"> 
								<c:if test="${counter == navi_fav.currentPage}"></c:if>
									<li class="flex-shrink-0 flex-md-shrink-1 page-item active" aria-current="page"><a class="page-link" href="javascript:pagingFormSubmit(${counter})">${counter}</a></li>
								<c:if test="${counter == navi_fav.currentPage}"></c:if>
							</c:forEach>
	                        
	                        
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_fav.currentPage + 1})">▶</a></li>
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi_fav.currentPage + navi_fav.pagePerGroup})">Next</a></li>
	                    </ul>
	                </nav>
                </div><!-- 페이지 이동부분 끝-->
			
			
	</div> <!-- _unopened -->
	
	
	
	
	
	
	<!-- 새 메시지 작성하기 -->
	<div id="message_new_form" class="col-sm-6" style="background-color:lavenderblush;"> 
	
			<div class="message-box">
					<table >
					
						<tr>
							<td colspan="2">
											<table>
												<!-- <tr>
													<td>제목 : </td>
													<td colspan="2">제목 받아오기</td>
												</tr> -->
												<tr>
													<td><p class="ppp">발신인</p></td>
													<td colspan="2"><p>: ${message.message_sent_id}</p></td>
												</tr>
												
												<tr>
													<td><p class="ppp">수신인</p></td>
													<td><p>: ${one_message.message_recv_id}</p></td>
													<td></td>
												</tr>
												<tr>
													<td><p class="ppp">내용</p></td>
													<td><p>: ${one_message.message_contents}</p></td>
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
