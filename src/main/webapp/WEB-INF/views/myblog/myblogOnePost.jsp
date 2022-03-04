<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
			 <!-- Title -->
			    <title>글 상세보기</title>
			
			    <!-- Required Meta Tags Always Come First -->
			    <meta charset="utf-8">
			    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			
			    <!-- Favicon -->
			    <link rel="shortcut icon" href="../../resources/assets/img/favicon.png">
			
			    <!-- Font -->
			    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">
			
			    <!-- CSS Implementing Plugins -->
			    <link rel="stylesheet" href="../../resources/assets/vendor/font-awesome/css/fontawesome-all.min.css">
			    <link rel="stylesheet" href="../../resources/assets/vendor/flaticon/font/flaticon.css">
			    <link rel="stylesheet" href="../../resources/assets/vendor/animate.css/animate.css">
			    <link rel="stylesheet" href="../../resources/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
			    <link rel="stylesheet" href="../../resources/assets/vendor/slick-carousel/slick/slick.css"/>
			    <link rel="stylesheet" href="../../resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
			
			    <!-- CSS Bookworm Template -->
			    <link rel="stylesheet" href="../../resources/assets/css/theme.css">
			    
			    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../../resources/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="../../resources/assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
    <script src="../../resources/assets/vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="../../resources/assets/vendor/bootstrap/bootstrap.min.js"></script>
    <script src="../../resources/assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="../../resources/assets/vendor/slick-carousel/slick/slick.min.js"></script>
    <script src="../../resources/assets/vendor/multilevel-sliding-mobile-menu/dist/jquery.zeynep.js"></script>
    <script src="../../resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>


    <!-- JS HS Components -->
    <script src="../../resources/assets/js/hs.core.js"></script>
    <script src="../../resources/assets/js/components/hs.unfold.js"></script>
    <script src="../../resources/assets/js/components/hs.malihu-scrollbar.js"></script>
    <script src="../../resources/assets/js/components/hs.header.js"></script>
    <script src="../../resources/assets/js/components/hs.slick-carousel.js"></script>
    <script src="../../resources/assets/js/components/hs.selectpicker.js"></script>
    <script src="../../resources/assets/js/components/hs.show-animation.js"></script>

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
//게시글 삭제하기
function bt_delete(post_no) {
	if (confirm('삭제하시겠습니까?')) {
		location.href = '../post_delete?post_no=${one_post.post_no}';
	}
}

//게시글 수정하기
function bt_edit(){
	if (confirm('수정하시겠습니까?'))
		location.href = '../post_edit?post_no=${one_post.post_no}';
}

//댓글 쓰기 폼 체크
function post_comment_form() {
	var text = document.getElementById('post_comment_content');
	if ($("#posttextarea").val().length < 3) {
		alert('댓글 내용을 3글자 이상 입력하세요.');
		text.focus();
		text.select();
		return false;
	}
	
	if(echosocket){
 		console.log("echosocket 댓글 send하기직전")
 		echosocket.send("reply/${sessionScope.loginId}/${user_id}/${one_post.post_no}");
 	}
	
	return true;			
}

//댓글 삭제하기
function post_comment_delete(post_comment_no, post_no, user_id){
	if (confirm('댓글을 삭제하시겠습니까?')){
		location.href='../post_comment_delete?post_comment_no=' + post_comment_no + '&post_no=' + post_no ;
		}
}

//댓글 도움이 되었어요 
function post_comment_like(post_comment_no, post_no){
	location.href='../post_comment_like?post_comment_no=' + post_comment_no + '&post_no=' + post_no;
	alert('해당 댓글이 도움이 되었다니 기뻐요 :)');
}

//댓글 수정 
function post_comment_edit(post_comment_no, post_no, descriptionTextarea){

		var div = document.getElementById("div"+post_comment_no);
	<!-- 댓글 자리 -->
	
	var str = '<form class="card" name="post_comment_form'+ post_comment_no +'" action="../post_comment_edit?user_id=${one_post.user_id}" method="post"  onsubmit="return post_comment_form()">';
		str += '<input type="hidden" name="post_no" value="'+ post_no +'"/>';
		str += '<input type="hidden" name="post_comment_no" value="'+ post_comment_no +'"/>';
		str += '<div class="card-body"><textarea name="post_comment_content" value="'+ descriptionTextarea +'" class="form-control" rows="1"></textarea></div>';
		str += '<a href="javascript:replyEdit(document.post_comment_form' + post_comment_no + ')">저장하기</a>';
		str += '<a href="javascript:replyEditCancle(document.getElementById(\'div' + post_comment_no + '\'))">취소하기</a>';
		str += '</form>';
		div.innerHTML = str;
}

//리플 수정 정보 저장
function replyEdit(form) {
	if (confirm('수정된 내용을 저장하시겠습니까?')) {
		form.submit();
	}
}

//리플 수정 취소
function replyEditCancle(div) {
	div.innerHTML = '';
}

</script>

</head>
<body>
<!-- ====== MAIN CONTENT ===== -->
<%@ include file="../header.jsp" %>
    <main id="content" role="main">
        <div class="mb-5 mb-lg-8 pb-xl-1">
            <div class="mb-5 mb-lg-8 pb-xl-1">
                <div class="page-header border-bottom">
                    <div class="container">
                        <div class="d-md-flex justify-content-between align-items-center py-4">
                            <h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">Blog Single</h1>
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
                <div>
                    <c:if test="${sessionScope.loginId == user_id}">
                     <button  class="btn btn-dark rounded-0 transition-3d-hover" onclick="location.href='../${one_post.user_id}';">목록
                     </button>
                     <a class="btn btn-dark  rounded-0 transition-3d-hover" href="javascript:bt_edit(${one_post.post_no})">수정</a>
                        <a class="btn btn-dark  rounded-0 transition-3d-hover" href="javascript:bt_delete(${one_post.post_no})">삭제</a>
                    </c:if>
                    <c:if test="${sessionScope.loginId != user_id}">
                     <button  class="btn btn-dark btn-wide rounded-0 transition-3d-hover" onclick="location.href='../${one_post.user_id}';">목록
                     </button>
                    </c:if>

                    <div class="max-width-940 mx-auto bg-white position-relative">
                        <div class=" mt-n10 mt-md-n13 pt-5 pt-lg-7 px-3 px-md-5 pl-xl-10 pr-xl-8">
                            <div class="ml-xl-4">
                                <div class="mb-5 mb-lg-7">
                                    <div class="mb-2">
                                        <span class="font-size-2 text-primary">${one_post.user_id}</span>
                                    </div>
                                    <h6 class="font-size-10 crop-text-2 font-weight-medium text-lh-1dot4">
                                        ${one_post.post_title}
                                    </h6>
                                    <div class="font-size-2 text-secondary-gray-700">
                                        <span>작성일 : ${one_post.post_uploaddate}</span>
                                        <span class="ml-3">조회수 : ${one_post.post_hits}</span>
                                    </div>
                                </div>

                                <c:if test="${one_post.post_originalfile != null}">
                                    <!-- Images Carousel 이미지를 위에다 넣고 싶어 -->
                                    <div class="js-slick-carousel u-slick u-slick--gutters-3 my-5 my-lg-8">
                                
                                    <img src="../${one_post.user_id}/show_file?post_no=${one_post.post_no}">
                                  
                                    </div>
                                </c:if>		
                                 <!-- End Images Carousel -->
                                <c:if test="${one_post.post_book_title != null}">
                                            <p class="font-weight-medium">${one_post.post_book_title}
                                            </p>
                                </c:if>
                                <p class="font-size-2 text-lh-1dot72 mb-4">${one_post.post_contents}</p>
                             </div>
                        </div>
                    </div>
                    


                    <div class="col-lg-9 mx-auto">
                        <div class="px-3 px-md-5 pl-xl-10 pr-xl-4">
                            <div class="ml-xl-4">
                        
                                
                            <!-- 리뷰자리 -->
                                <br>
                                <hr>
                                <h4 class="font-size-3 mb-5 mb-md-8 font-weight-medium">Reviews</h4>
                                <ul class="list-unstyled mb-5 mb-md-8">

                                 <c:forEach var="post_comment" items="${post_comment_list}">
                                    <li class="mb-4 pb-5 border-bottom">
                                        <div class="d-md-flex align-items-center mb-3">
                                        </div>
                                        <p class="mb-4 text-lh-md">${post_comment.post_comment_content}</p>
                                        <div class="text-gray-600 mb-4">${post_comment.post_comment_writter},${post_comment.post_comment_date}</div>
                                        <ul class="nav">
                                            <li class="mr-5 mr-md-7">
                                                <c:if test="${loginId != post_comment.post_comment_writter}">
	                                                <a onclick="javascript:post_comment_like(${post_comment.post_comment_no}, ${post_comment.post_no})">
	                                                    <i  class="text-dark font-size-5 flaticon-like-1"></i>
	                                                </a>
	                                                    <span class="ml-2">${post_comment.post_comment_like}</span>
                                                 </c:if>
                                             </li>
                                             <li class="mr-5 mr-md-7">
                                              
                                                <c:if test="${loginId == post_comment.post_comment_writter}">
                                                    [<a href="javascript:post_comment_edit(${post_comment.post_comment_no}, ${post_comment.post_no}, '${post_comment.post_comment_content}')">수정</a>]
                                                </c:if>
                                                <c:if test="${loginId == post_comment.post_comment_writter}">
                                                    [<a href="javascript:post_comment_delete(${post_comment.post_comment_no}, ${post_comment.post_no})">삭제</a>]
                                                </c:if>
                                                <div id="div${post_comment.post_comment_no}"></div>
                                            </li>
                                        </ul>
                                    </li>
                                </c:forEach>

                                </ul>
                                
           
                                <h4 class="font-size-3 mb-4">Write a Review</h4>
                                <form  id="post_comment_form" action="../post_comment?user_id=${one_post.user_id}" method="post"  onsubmit="return post_comment_form();">
                                    <div class="js-form-message form-group mb-4">
                                        <input type="hidden" name="post_no" value="${one_post.post_no}"/>
                                        <label for="descriptionTextarea" class="form-label text-dark h6 mb-3">Details please! Your review helps other shoppers.</label>
                                        <textarea id="posttextarea" class="form-control rounded-0 p-4" name="post_comment_content" rows="7" id="descriptionTextarea" placeholder="What did you like or dislike? What should other shoppers know before buying?" required="" data-msg="Please enter your message." data-error-class="u-has-error" data-success-class="u-has-success"></textarea>
                                    </div>
                                    
                                    <div class="d-flex">
                                        <button type="submit" class="btn btn-dark rounded-0 transition-3d-hover">Submit Review</button>
                                    </div>
                                </form>

                                <br>
                                <hr>

                            </div>
                        </div>
                    </div>

                    
                </div>
            </div>
        </div>
    </main>
    <!-- ====== END MAIN CONTENT ===== -->
    <%@ include file="../footer.jsp" %>
</body>
</html>
