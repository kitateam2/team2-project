<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>document.getElementsByTagName("html")[0].className += " js";</script>
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link href="resources/css/header.css" rel="stylesheet"/>
  <link rel="stylesheet" href="resources/css/faq.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="resources/assets/vendor/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="resources/assets/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/assets/vendor/animate.css/animate.min.css">
    <link rel="stylesheet" href="resources/assets/vendor/hs-megamenu/src/hs.megamenu.css">
    <link rel="stylesheet" href="resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="resources/assets/vendor/fancybox/jquery.fancybox.css">
    <link rel="stylesheet" href="resources/assets/vendor/slick-carousel/slick/slick.css">
    <link rel="stylesheet" href="resources/assets/documentation/assets/vendor/jquery-ui/themes/base/jquery-ui.min.css">
    <link rel="stylesheet" href="resources/assets/documentation/assets/vendor/prism/prism.css">

    <!-- JS Front -->
    <link rel="stylesheet" href="resources/assets/vendor/animate.css/animate.css">


        <!-- CSS MyTravel Template -->
        <link rel="stylesheet" href="resources/assets/css/theme.css">

        <!-- CSS MyTravel Doc -->
        <link rel="stylesheet" href="resources/assets/documentation/assets/css/starter.css">
  <title>자주 묻는 질문</title>
</head>
<body>
<%@ include file="../header.jsp" %>
	

<section class="cd-faq js-cd-faq container max-width-md margin-top-lg margin-bottom-lg">
	<ul class="cd-faq__categories">
		<li><a class="cd-faq__category cd-faq__category-selected truncate" href="#basics">관리자 문의</a></li>
		<li><a class="cd-faq__category truncate" href="#account">삭제</a></li>
		<!-- <li><a class="cd-faq__category truncate" href="#payments">결제</a></li>
		<li><a class="cd-faq__category truncate" href="#privacy">구매</a></li>
		<li><a class="cd-faq__category truncate" href="#delivery">블로그</a></li> -->
	</ul> <!-- cd-faq__categories -->

	<div class="cd-faq__items">
		<ul id="basics" class="cd-faq__group">
			<li class="cd-faq__title"><h2>관리자 1:1 문의</h2></li>
			
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>1:1문의한 채팅 리스트</span></a>
			  <div class="cd-faq__content">
		          <div class="text-component">
		          	<ul>
		            <c:forEach var="adminroom" items="${adminroomlist}">
						<li>
						<a onclick="window.open('${pageContext.request.contextPath}/chatadmin?roomid1=${adminroom.chatroom_id}','',
						'width=448,height=540,top=200,left=800,toolbar=no,menubar=no,scrollbars=1,resizable=1')">${adminroom.chatroom_id}</a>
						</li><br>
					</c:forEach>
					</ul>
				  </div>
			  </div>
		   </li>
			
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>책 API DB에저장</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <a href="search">DB에 책 추가</a>
            </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->


		<ul id="account" class="cd-faq__group">
			<li class="cd-faq__title"><h2>DB 삭제</h2></li>
				<li class="cd-faq__item">
					<a class="cd-faq__trigger" href="#0"><span>회원 삭제</span></a>
					<div class="cd-faq__content">
			          <div class="text-component">
			            <ul>
				            <c:forEach var="ids" items="${idList}">
								<li> 
									<span>${ids.user_id}</span> <button onclick="location.href='deleteuser?deleteid=${ids.user_id}'">삭제</button>
								</li><br>
							</c:forEach>
						</ul>
			          </div>
					</div> <!-- cd-faq__content -->
				</li>

				<li class="cd-faq__item">
					<a class="cd-faq__trigger" href="#0"><span>책 삭제</span></a>
					<div class="cd-faq__content">
			          <div class="text-component">
			            <ul>
				            <c:forEach var="books" items="${bookList}">
								<li> 
									<span>${books.book_title}</span>
									<span>(${books.book_isbn})</span>
									<button onclick="location.href='deletebook?deletebook=${books.book_isbn}'">삭제</button>
								</li><br>
							</c:forEach>
						</ul>
			          </div>
					</div> <!-- cd-faq__content -->
				</li>
				
				<li class="cd-faq__item">
					<a class="cd-faq__trigger" href="#0"><span>게시글 삭제</span></a>
					<div class="cd-faq__content">
			          <div class="text-component">
			            <ul>
				            <c:forEach var="posts" items="${postList}">
								<li> 
									<span>${posts.post_title}</span>
									<span>(${posts.post_no})</span>
									<button onclick="location.href='deletepost?deletepost=${posts.post_no}'">삭제</button>
								</li><br>
							</c:forEach>
						</ul>
			          </div>
					</div> <!-- cd-faq__content -->
				</li>
				
				<li class="cd-faq__item">
					<a class="cd-faq__trigger" href="#0"><span>댓글 삭제</span></a>
					<div class="cd-faq__content">
			          <div class="text-component">
			            <ul>
				            <c:forEach var="comments" items="${commentList}">
								<li> 
									<span>${comments.post_comment_content}</span>
									<span>(${comments.post_comment_no})</span>
									<button onclick="location.href='deletecomment?deletecomment=${comments.post_comment_no}'">삭제</button>
								</li><br>
							</c:forEach>
						</ul>
			          </div>
					</div> <!-- cd-faq__content -->
				</li>

		</ul> <!-- cd-faq__group -->

		<!-- <ul id="payments" class="cd-faq__group">
			<li class="cd-faq__title"><h2>결제</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Can I have an invoice for my subscription?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Why did my credit card or PayPal payment fail?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur accusantium dolorem vel, ad, nostrum natus eos, nemo placeat quos nisi architecto rem dolorum amet consectetur molestiae reprehenderit cum harum commodi beatae necessitatibus. Mollitia a nostrum enim earum minima doloribus illum autem, provident vero et, aspernatur quae sunt illo dolorem. Corporis blanditiis, unde, neque, adipisci debitis quas ullam accusantium repudiandae eum nostrum quis! Velit esse harum qui, modi ratione debitis alias laboriosam minus eaque, quod, itaque labore illo totam aut quia fuga nemo. Perferendis ipsa laborum atque assumenda tempore aspernatur a eos harum non id commodi excepturi quaerat ullam, explicabo, incidunt ipsam, accusantium quo magni ut! Ratione, magnam. Delectus nesciunt impedit praesentium sed, aliquam architecto dolores quae, distinctio consectetur obcaecati esse, consequuntur vel sit quis blanditiis possimus dolorum. Eaque architecto doloremque aliquid quae cumque, vitae perferendis enim, iure fugiat, soluta aut!</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Why does my bank statement show multiple charges for one upgrade?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>
		</ul> cd-faq__group

		<ul id="privacy" class="cd-faq__group">
			<li class="cd-faq__title"><h2>Privacy</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Can I specify my own private key?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> cd-faq__content
			</li>

			
		</ul> cd-faq__group

		<ul id="delivery" class="cd-faq__group">
			<li class="cd-faq__title"><h2>Delivery</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>What should I do if my order hasn't been delivered yet?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How can I find your international delivery information?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>

		</ul> cd-faq__group -->
	</div> <!-- cd-faq__items -->

	<a href="#0" class="cd-faq__close-panel text-replace">Close</a>
  
  <div class="cd-faq__overlay" aria-hidden="true"></div>
</section> <!-- cd-faq -->
<%@ include file="../footer.jsp" %>
<script src="resources/js/faqutil.js"></script> <!-- util functions included in the CodyHouse framework -->
	<script src="resources/js/faqmain.js"></script> 

<!-- JS Global Compulsory -->
        <script src="resources/assets/vendor/jquery/dist/jquery.min.js"></script>
        <script src="resources/assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
        <script src="resources/assets/vendor/popper.js/dist/umd/popper.min.js"></script>
        <script src="resources/assets/vendor/bootstrap/bootstrap.min.js"></script>

        <!-- JS Implementing Plugins -->
        <script src="resources/assets/vendor/appear.js"></script>
        <script src="resources/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
        <script src="resources/assets/vendor/fancybox/jquery.fancybox.min.js"></script>
        <script src="resources/assets/documentation/assets/vendor/jquery-ui/jquery-ui.core.min.js"></script>
        <script src="resources/assets/documentation/assets/vendor/jquery-ui/ui/widgets/menu.js"></script>
        <script src="resources/assets/documentation/assets/vendor/jquery-ui/ui/widgets/mouse.js"></script>
        <script src="resources/assets/documentation/assets/vendor/jquery-ui/ui/widgets/autocomplete.js"></script>
        <script src="resources/assets/documentation/assets/vendor/prism/prism.js"></script>
        <script src="resources/assets/vendor/slick-carousel/slick/slick.js"></script>

        <!-- JS Bookworm -->
        <script src="resources/assets/js/hs.core.js"></script>
        <script src="resources/assets/js/components/hs.header.js"></script>
        <script src="resources/assets/js/components/hs.unfold.js"></script>
        <script src="resources/assets/js/components/hs.fancybox.js"></script>
        <script src="resources/assets/js/components/hs.slick-carousel.js"></script>
        <script src="resources/assets/documentation/assets/js/components/hs.autocomplete-local-search.js"></script>
        <script src="resources/assets/js/components/hs.malihu-scrollbar.js"></script>
        <script src="resources/assets/js/components/hs.selectpicker.js"></script>
        <script src="resources/assets/js/components/hs.show-animation.js"></script>

        <!-- JS Plugins Init. -->
        <script>

            $(document).on('ready', function () {

                // initialization of header
                $.HSCore.components.HSHeader.init($('#header'));

                // initialization of unfold component
                $.HSCore.components.HSUnfold.init($('[data-unfold-target]'));

                

                // initialization of slick carousel
                $.HSCore.components.HSSlickCarousel.init('.js-slick-carousel');

                // initialization of go to
                

                // initialization of autocomplet
                $.HSCore.components.HSLocalSearchAutocomplete.init('.js-hs-docs-search');

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
</body>
</html>