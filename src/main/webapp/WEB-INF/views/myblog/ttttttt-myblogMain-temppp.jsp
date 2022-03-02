<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
			 <!-- Title -->
			    <title>${user_id} 블로그</title>
			
			    <!-- Required Meta Tags Always Come First -->
			    <meta charset="utf-8">
			    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			
			    <!-- Favicon -->
			    <link rel="shortcut icon" href="../../resources/assets/img/favicon.png">
			
			    <!-- Font -->
			    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">
			
			    <!-- CSS Implementing Plugins -->
			    <link rel="stylesheet" href="../resources/assets/vendor/font-awesome/css/fontawesome-all.min.css">
			    <link rel="stylesheet" href="../resources/assets/vendor/flaticon/font/flaticon.css">
			    <link rel="stylesheet" href="../resources/assets/vendor/animate.css/animate.css">
			    <link rel="stylesheet" href="../resources/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
			    <link rel="stylesheet" href="../resources/assets/vendor/slick-carousel/slick/slick.css"/>
			    <link rel="stylesheet" href="../resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
			
			    <!-- CSS Bookworm Template -->
			    <link rel="stylesheet" href="../resources/assets/css/theme.css">
			    
			    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../resources/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="../resources/assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
    <script src="../resources/assets/vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="../resources/assets/vendor/bootstrap/bootstrap.min.js"></script>
    <script src="../resources/assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="../resources/assets/vendor/slick-carousel/slick/slick.min.js"></script>
    <script src="../resources/assets/vendor/multilevel-sliding-mobile-menu/dist/jquery.zeynep.js"></script>
    <script src="../resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>


    <!-- JS HS Components -->
    <script src="../resources/assets/js/hs.core.js"></script>
    <script src="../resources/assets/js/components/hs.unfold.js"></script>
    <script src="../resources/assets/js/components/hs.malihu-scrollbar.js"></script>
    <script src="../resources/assets/js/components/hs.header.js"></script>
    <script src="../resources/assets/js/components/hs.slick-carousel.js"></script>
    <script src="../resources/assets/js/components/hs.selectpicker.js"></script>
    <script src="../resources/assets/js/components/hs.show-animation.js"></script>

    <!-- JS Bookworm -->
    <!-- <script src="../resources/assets/js/bookworm.js"></script> -->
    <script>
        $(document).on('ready', function () {
            // initialization of unfold component
            $.HSCore.components.HSUnfold.init($('[data-unfold-target]'));

            // initialization of slick carousel
            $.HSCore.components.HSSlickCarousel.init('.js-slick-carousel');

            // initialization of header
            $.HSCore.components.HSHeader.init($('#header'));

            // initialization of malihu scrollbar
            $.HSCore.components.HSMalihuScrollBar.init($('.js-scrollbar'));

            // initialization of show animations
            $.HSCore.components.HSShowAnimation.init('.js-animation-link');
 
            // init zeynepjs
            var zeynep = $('.zeynep').zeynep({
                onClosed: function () {
                    // enable main wrapper element clicks on any its children element
                    $("body main").attr("style", "");

                    console.log('the side menu is closed.');
                },
                onOpened: function () {
                    // disable main wrapper element clicks on any its children element
                    $("body main").attr("style", "pointer-events: none;");

                    console.log('the side menu is opened.');
                }
            }); 

            // handle zeynep overlay click
            $(".zeynep-overlay").click(function () {
                zeynep.close();
            });

            // open side menu if the button is clicked
            $(".cat-menu").click(function () {
                if ($("html").hasClass("zeynep-opened")) {
                    zeynep.close();
                } else {
                    zeynep.open();
                }
            });
        });
    </script>



			    
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


</head>
<body>
<%-- <%@ include file="../header.jsp" %> --%>

    <!-- ====== MAIN CONTENT ===== -->
    <main id="content">
        <div class="mb-5 mb-lg-8 pb-xl-1">
            <div class="mb-5 mb-lg-8 pb-xl-1">
                <div class="page-header border-bottom" >
                    <div class="container">
                        <div class="d-md-flex justify-content-between align-items-center py-4">
                            <h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">Blog List</h1>
                         		<nav class="woocommerce-breadcrumb font-size-2">
				                    <a href="/team2/blogmain" class="h-primary">Blog Main</a>
				                 <span> > </span>
				                    <a href="${user_id}" class="h-primary">Blog List(${user_id})</a>
				                </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row mb-lg-5 mb-xl-0">
                
                    <div class="col-lg-4 col-xl-3">
                        <div id="SidebarAccordion">
									
                            
                            <!-- 카테고리부분을 00님 블로그 그거로 만들자 -->
                            <!-- 내 블로그 카테고리 -->
                            <c:if test="${sessionScope.loginId == user_id}">
                            
	                            <div id="Categories" class="widget p-4 border">
	                                <div id="Heading21">
	                                    <a class="d-flex align-items-center justify-content-between collapse-link text-dark" href="#"
	                                        data-toggle="collapse"
	                                        data-target="#Collapse22"
	                                        aria-expanded="false"
	                                        aria-controls="Collapse22">
	
	                                        <h3 class="title mb-0 font-weight-medium font-size-3">my blog:)</h3>
	                                        
	                                        <svg class="mins" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
	                                       		 <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
	                                    	</svg>
	                                        <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
	                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
	                                        </svg>
	                                    </a>
	                                </div>
	
	                                <div id="Collapse21" class="mt-4 collapse"
	                                    aria-labelledby="Heading21"
	                                    data-parent="#SidebarAccordion">
	                                       
	                                    <!-- 내 블로그 일때 -->
	                                        <a class="form-group d-flex align-items-center justify-content-between font-size-2 text-lh-md mb-3" >
	                                            <span class="text-dark">${sessionScope.loginId}</span>
	                                        </a>
	
	                                        <a class="form-group d-flex align-items-center justify-content-between font-size-2 text-lh-md mb-3" href="javascript:message_window()">
	                                            <span class="text-dark">쪽지로 이동하기</span>
	                                        </a>
	                                        
	                                        <a class="form-group d-flex align-items-center justify-content-between font-size-2 text-lh-md mb-3" href="#">
	                                            <span class="text-dark">정보수정하기</span>
	                                        </a>
	                                        
	                                        <a class="form-group d-flex align-items-center justify-content-between font-size-2 text-lh-md mb-3" href="newPost">
	                                            <span class="text-dark">새글쓰기</span>
	                                        </a>
	                                </div>
	                            </div>
                            </c:if> <!--내블로그 카테고리 -->

							<!-- 다른 사람 카테고리 -->
							<c:if test="${sessionScope.loginId != user_id}">
                            <div id="Categories" class="widget p-4 border">
                                <div id="Heading22">
                                    <a class="d-flex align-items-center justify-content-between collapse-link text-dark" href="#"
                                        data-toggle="collapse"
                                        data-target="#Collapse22"
                                        aria-expanded="false"
                                        aria-controls="Collapse22">

                                        <h3 class="title mb-0 font-weight-medium font-size-3">${user_id}님의 블로그</h3>
										<svg class="mins" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
	                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
	                                    </svg>
                                        <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                        </svg>
                                    </a>
                                </div>

                                <div id="Collapse22" class="mt-4 collapse"
                                    aria-labelledby="Heading22"
                                    data-parent="#SidebarAccordion">
                                       
                                    <c:if test="${sessionScope.loginId != null}">
									
										<c:if test="${sessionScope.loginId ne user_id}">
										<c:choose>
											<c:when test="${checkFollow != 1}">
												<form id="follow" action="${user_id}/follow" method="POST">
													<input class="btn btn-dark btn-wide rounded-0 transition-3d-hover" class="following_btn" type="submit" value="팔로우하기">
												</form>
											</c:when>
											<c:otherwise>
												<form id="follow" action="${user_id}/unfollow" method="POST">
													<input class="btn btn-dark btn-wide rounded-0 transition-3d-hover" class="follower_btn" type="submit" value="언팔로우하기">
												</form>
											</c:otherwise>		
										</c:choose>
										</c:if>
									</c:if>

                                </div>
                            </div> 
                            </c:if><!-- 카테고리 -->

                            <!-- 검색 -->
                            <div id="Search" class="widget p-4 border">
                                <div id="Heading21">
                                    <a class="d-flex align-items-center justify-content-between collapse-link text-dark" href="#"
                                        data-toggle="collapse"
                                        data-target="#Collapse21"
                                        aria-expanded="true"
                                        aria-controls="Collapse21">

                                        <h3 class="title mb-0 font-weight-medium font-size-3">Search</h3>
										<svg class="mins" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
	                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
	                                    </svg>
                                        <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                        </svg>
                                    </a>
                                </div>

                                <div id="Collapse21" class="mt-4 collapse show"
                                    aria-labelledby="Heading21"
                                    data-parent="#SidebarAccordion">
                                    <form class="form-inline my-2 my-xl-0 overflow-hidden">
                                        <div class="input-group flex-nowrap w-100">
                                            <div class="input-group-prepend">
                                                <i class="glph-icon flaticon-loupe py-2d75 bg-white-100 border-white-100 text-dark pl-3 pr-0 rounded-0"></i>
                                            </div>
                                            <input class="form-control bg-white-100 py-2d75 height-4 border-white-100 rounded-0" type="search" placeholder="Search" aria-label="Search">
                                        </div>
                                        <button class="btn btn-outline-success my-2 my-sm-0 sr-only" type="submit">Search</button>
                                    </form>
                                </div>
                            </div>
                            
                           <!-- 팔로우 자리 팔로우ing-->
                            <div id="RecentPosts" class="widget p-4 border">
                                <div id="Heading23">
                                    <a class="d-flex align-items-center justify-content-between collapse-link text-dark" href="#"
                                        data-toggle="collapse"
                                        data-target="#Collapse23"
                                        aria-expanded="false"
                                        aria-controls="Collapse23">

                                        <h3 class="title font-weight-medium font-size-3 mb-0">Following(${countFollowing})</h3>

                                        <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                        </svg>
                                    </a>
                                </div>

                                <div id="Collapse23" class="mt-4 collapse"
                                    aria-labelledby="Heading23"
                                    data-parent="#SidebarAccordion">

                                   		<c:forEach var="follow" items="${followingList}">
                                        <div class="d-flex mb-5">
                                            <div class="ml-3" onclick="location.href='${pageContext.request.contextPath}/myblog/${follow.follow_ed_id}'">
                                                <h6 class="font-size-2 mb-1">
                                                    <a href="${pageContext.request.contextPath}/myblog/${follow.follow_ed_id}">${follow.follow_ed_id}</a>
                                                </h6>
                                            </div>
                                        </div>
                                       </c:forEach>
                                        </div>
                                </div><!-- following -->
                                
                                <!-- 팔로우 자리 팔로우ed-->
                            <div id="RecentPosts" class="widget p-4 border">
                                <div id="Heading23">
                                    <a class="d-flex align-items-center justify-content-between collapse-link text-dark" href="#"
                                        data-toggle="collapse"
                                        data-target="#Collapse23"
                                        aria-expanded="false"
                                        aria-controls="Collapse23">

                                        <h3 class="title font-weight-medium font-size-3 mb-0">Followed(${countFollowed})</h3>

										<svg class="mins" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
	                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
	                                    </svg>
                                        <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                        </svg>
                                    </a>
                                </div>

                                <div id="Collapse23" class="mt-4 collapse"
                                    aria-labelledby="Heading23"
                                    data-parent="#SidebarAccordion">

                                   		<c:forEach var="follow" items="${followedList}">
                                        <div class="d-flex mb-5">
                                            <div class="ml-3" onclick="location.href='${pageContext.request.contextPath}/myblog/${follow.follow_ing_id}'">
                                                <h6 class="font-size-2 mb-1">
                                                    <a href="${pageContext.request.contextPath}/myblog/${follow.follow_ing_id}">${follow.follow_ing_id}</a>
                                                </h6>
                                            </div>
                                        </div>
                                       </c:forEach>
                                        </div>
                                </div><!-- following -->
                                
                            </div> <!-- sidebar -->

                        </div>
                    </div>
                    
                    
                    <!-- 메인자리 -->
                    <div class="col-lg-8 col-xl-9">
                    전체 : ${navi.totalRecordsCount} 
                    <hr>
                    <br>
                       <c:forEach var="postlist" items="${postlist}"> <!-- 리스트 저장한 거 가지고 오는 거  -->
	                        <div class="d-md-flex align-items-center mb-5">
		                            <div class="ml-md-8">
		                                <div class="mb-2">
		                                    <a class="font-size-2" href="../blog/blog-single.html">No. ${postlist.post_no}</a>
		                                </div>
		                                <h6 class="font-size-7 crop-text-2 font-weight-medium text-lh-1dot4">
		                                    <a href="${postlist.user_id}/one_post?post_no=${postlist.post_no}">${postlist.post_title}</a>
		                                </h6>
		                                <p class="font-size-2 text-secondary-gray-700">${postlist.post_contents}</p>
		                                <div class="font-size-2 text-secondary-gray-700">
		                                    <span>작성일 :  ${postlist.post_uploaddate}</span>
		                                    <span class="ml-3">조회수 : ${postlist.post_hits}</span>
		                                </div>
		                            </div>
	                        </div>
                       </c:forEach>
                        
                    </div>
                </div>
                
                <div id="navigator">
	                <nav aria-label="Page navigation example">
	                    <ul class="pagination pagination__custom justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble mb-0">
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">Previous</a></li>
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a></li>
	                        
	                        <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
								<c:if test="${counter == navi.currentPage}"></c:if>
									<li class="flex-shrink-0 flex-md-shrink-1 page-item active" aria-current="page"><a class="page-link" href="javascript:pagingFormSubmit(${counter})">${counter}</a></li>
								<c:if test="${counter == navi.currentPage}"></c:if>
							</c:forEach>
	                        
	                        
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a></li>
	                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">Next</a></li>
	                    </ul>
	                </nav>
                </div>
            </div>
        </div>
    </main>
    <!-- ====== END MAIN CONTENT ===== -->





<div class ="container">

	
	<!-- 개인블로그 이미지 -->
	<div class="col-md-12" style="padding:0.3em 0em"><img src="../resources/img/myblogimg.jpeg" style="width:100%; opacity: 0.4;"></div>

	<!-- left -->
	<div class="row" style=" --bs-gutter-x:0rem">
	<div class="col-md-2" style="background-color:rgb(230, 230, 250)">
	
			<!-- 내 블로그에서 -->
			<c:if test="${sessionScope.loginId == user_id}">
				<div><!-- 개인정보 목록 한덩어리 -->
					<table>
						<tr><td colspan="2"><img src="../resources/img/myblogimg2.png" style="width:50%;"></td></tr>
						<tr><td colspan="2">${user_id}님 안녕하세요 :)</td></tr>
						<tr><td colspan="2">${sessionScope.loginId}</td></tr>
						<tr><td colspan="2" ><button onclick="message_window()">쪽지로 이동</button></td></tr>
					</table>
				</div>
			</c:if>
			
			<!-- 다른 사람의 블로그에서 -->
			<c:if test="${sessionScope.loginId != user_id}">
				<div><!-- 개인정보 목록 한덩어리 -->
					<table>
						<tr><td colspan="2"><img src="../resources/img/myblogimg2.png" style="width:50%;"></td></tr>
						<tr><td colspan="2">${user_id}님의 블로그</td></tr>
						<c:if test="${sessionScope.loginId != null}">
						<tr><td colspan="2" ><button onclick="message_window()"> 내 쪽지로 이동</button></td></tr> <!-- 로그인 없으면 오류나는거 해결하기 -->
						</c:if>
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
							<input class="following_btn" type="submit" value="팔로우하기">
						</form>
					</c:when>
					<c:otherwise>
						<form id="follow" action="${user_id}/unfollow" method="POST">
							<input class="follower_btn" type="submit" value="언팔로우하기">
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
			
			
			<div><!-- 친구목록 한덩어리  -->
			친구 리스트 가지고 오기 
			</div>
			
			<div>
			<!-- 카테고리 한덩어리(글 목록들을 보여줄지 카테고리로 이미지를 보여줄지) -->
			</div>
			
			</div> <!-- left -->
			
			<!-- right -->
			<div class="col-md-10" style="background-color:#F8D7DA">
			
				<div class="row" style="padding: 0rem 1rem;">
					<div class="col-md-1">전체 : ${navi.totalRecordsCount} </div>
					<div class="offset-md-10 col-md-1">
						<input onclick="location.href='newPost'" type="button" class="btn btn-outline-primary" value="글쓰기">
					</div>
				</div>
				<hr class="my-4" />
				<br>
				<c:forEach var="postlist" items="${postlist}"> 
				  <!--  <!-- Post preview-->
				  <div class="row" style="padding: 0rem 2rem; ">
				  	<div class="col-md-1">No. ${postlist.post_no}</div>
				  	<div class="offset-md-9 col-md-2" style="text-align:right;">조회수 : ${postlist.post_hits}</div>
				  </div>
                    <div class="post-preview" style="padding: 0rem 1rem; ">
                        <a href="${postlist.user_id}/one_post?post_no=${postlist.post_no}">
                            <h2 class="post-title">${postlist.post_title}</h2>
                            <h3 class="post-subtitle">${postlist.post_contents}</h3>
                        </a>
                        <p class="post-meta">
                          date. ${postlist.post_uploaddate}
                        </p>
                    </div>
                    <hr class="my-4" />
                    </c:forEach>
				
				<div><!-- 글 목록 한덩어리- 글목록 조회수  -->
				전체 : ${navi.totalRecordsCount} <!-- 질문 -->
					<table border="1" style="width:90%">
					<c:forEach var="postlist" items="${postlist}"> <!-- 리스트 저장한 거 가지고 오는 거  -->
						<tr>
							<td>No. ${postlist.post_no}</td>
						</tr>
						<tr>
							<td>
							<a href="${postlist.user_id}/one_post?post_no=${postlist.post_no}">
								<p class="post-title h3">${postlist.post_title}</p>
								</a>
							</td>
						</tr>
						<tr>
							<td colspan="4"><p class="post-subtitle">${postlist.post_contents}</p></td>
						</tr>
						<tr>
							<td>date. ${postlist.post_uploaddate}</td>
						</tr>
						<tr>
							<td colspan="4">조회수 : ${postlist.post_hits}</td>
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
					내용 : <input type="text"  name="searchText" value="${searchText}" />
					<input type="button" onclick="pagingFormSubmit(1)" value="검색">
				</form>
				<!-- /검색폼 --> 
				
			
			</div><!-- right -->
			
			
			
	</div> <!-- row -->
</div> <!-- container -->

</body>
</html>
