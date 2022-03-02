<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
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
    
  	<script src="../resources/js/summernote/summernote-lite.js"></script>
	<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>

	<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css">

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
	function post_formCheck(){
		var title = document.getElementById('post_title');
		var contents = document.getElementById('post_contents');
	
		if(title.value.length < 3){
			alert("제목을 입력하세요.");
			title.focus();
			title.select();
			return false;
			}
		if(contents.value.length < 3){
			alert("내용을 입력하세요.");
			contents.focus();
			contents.select();
			return false;
			}
		return true;
	}
	</script>
	
	<script>
	function auto_book_complete(){
		let text = $("#post_book_title").val();
		if(text.length <2) return;

		$( "#post_book_title" ).autocomplete({
			autoFocus: true,
			//source:["aaaaaa", "bbbbbb", "cccccc", "dddddd", "kkkkkk", "hhhhhh", "kkkfff"]
			source: function(request, response){
						$.ajax({
							url:"json_auto_book",
							type:'get',
							data:{'text': text},
							dataType:"json",

							success: function(data){
								response(
									data		
								)
								},//success
							erorr: function(){
								alert("없는 정보 입니다.");
								}//error
							});
				}//function(request, response)

			});
		}
	</script>
		<script>
	      $('.summernote').summernote({
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        lang: "ko-KR",
	        height: 300
	      });
	    </script>
	
	
	
	<!-- 한글오류나는거..  https://zzznara2.tistory.com/94 -->
	<title>글 수정하기</title>
</head>
<body>
 <%@ include file="../header.jsp" %>
<main id="content">
			<div class="mb-5 mb-lg-8 pb-xl-1">
                <div class="page-header border-bottom">
                    <div class="container">
                        <div class="d-md-flex justify-content-between align-items-center py-4">
                            <h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">Post Edit</h1>
                            <nav class="woocommerce-breadcrumb font-size-2">
				                    <a href="/team2/blogmain" class="h-primary">Blog Main</a>
				                 <span> > </span>
				                    <a href="${sessionScope.loginId}" class="h-primary">Blog List(${sessionScope.loginId})</a>
				                </nav>
                        </div>
                    </div>
                </div>
            </div>
        <div class="container">
            <div class="space-bottom-1 space-bottom-lg-2 space-bottom-xl-3">
                <div class="pb-lg-4">
                    <div class="py-4 py-lg-5 py-xl-8">
                        <h6 class="font-weight-medium font-size-7 font-size-xs-25 text-center">Post Edit</h6>
                    </div>

                    <form id="post_write" action="post_write" method="post"
			enctype="multipart/form-data" onsubmit="return post_formCheck()">
					<input type="hidden" name="post_no" value="${blogpost.post_no}">
                    <div class="mb-5 mb-lg-8">
                        <h6 class="font-weight-medium font-size-4 mb-4 pb-1">Title</h6>
                        <input class="list-unstyled mb-0" type="text" name="post_title" id="post_title" placeholder="제목을 입력하세요">
                        
                    </div>
                    <div class="mb-5 mb-lg-9">
                        <h6 class="font-weight-medium font-size-4 mb-4 pb-1">Contents</h6>
                        <textarea rows="10" cols="10" class="summernote" id="post_contents" name="post_contents" style="width:100%"></textarea>
                    </div>
                    <div class="mb-5 mb-lg-10">
                        <h6 class="font-weight-medium font-size-4 mb-4 pb-1">File</h6>
                        <input type="file" name="upload" size="30">
                    </div>
                    <div class="mb-5 mb-lg-10">
                        <h6 class="font-weight-medium font-size-4 mb-4 pb-1">About Book</h6>
                        <input type="text" onkeyup="javascript:auto_book_complete();" name="post_book_title" id="post_book_title" placeholder="영감을 준 책 제목">

                    </div>
                        <button class="btn btn-dark btn-wide rounded-0 transition-3d-hover" type="submit" id="post_save">글 저장하기</button>
                    </form>
                        <button class="btn btn-dark btn-wide rounded-0 transition-3d-hover" onclick="location.href='${sessionScope.loginId}';">목록으로 돌아가기</button>

                </div>
            </div>
        </div>
    </main>
    <%@ include file="../footer.jsp" %>
</body>
</html>
