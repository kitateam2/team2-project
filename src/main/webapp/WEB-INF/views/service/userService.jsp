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
  
    <link href="resources/css/header.css" rel="stylesheet"/>
  <link rel="stylesheet" href="resources/css/faq.css"/>
  <title>자주 묻는 질문</title>
</head>
<body>
<!-- header부분 -->
<div class="box3">

<br>
	<h2>
	<center>
	<p style="type">Book Store &nbsp; &nbsp;
		<input id="bookName" type="text" placeholder="검색어 입력" value="${searchText}">
		<button id="search" onclick="pagingFormSubmit" value="검색">검색</button>	
	</p>
	</center>
	</h2>
	<br>
	<div class="navigation_bar">
	<table class="gnb_main add_1">
		<tr> 
				<td class="class_item"><a href="url" class="text">국내도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="url" class="text">외국도서</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="bookInfo" class="text">책 상세정보</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="blogmain" class="text">블로그 메인</a></td><td>&nbsp;</td>
				<td class="class_item"><a href="userService" class="text">고객센터</a></td><td>&nbsp;</td>
			<c:if test="${sessionScope.loginId == null}">
				<td class="class_item2"><a href="condition">회원가입</a></td><td>&nbsp;</td>
				<td class="class_item2"><a href="login">로그인</a></td><td>&nbsp;</td>
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<td class="class_item2"><a href="logout">로그아웃</a></td><td>&nbsp;</td>
				<td class="class_item2"><a href="cart">장바구니</a></td><td>&nbsp;</td>
				<td class="class_item2"><a href="myblog/${sessionScope.loginId}" style="color:white;">개인 블로그</a></td><td>&nbsp;</td>
				<td class="class_item3">${sessionScope.loginId}님 환영합니다.</td>
			</c:if>
		</tr>	
	</table>
	</div> <!-- navigation bar -->
	</div>
	
	<div class="box5">

<section class="cd-faq js-cd-faq container max-width-md margin-top-lg margin-bottom-lg">
	<ul class="cd-faq__categories">
		<li><a class="cd-faq__category cd-faq__category-selected truncate" href="#basics">기본</a></li>
		<li><a class="cd-faq__category truncate" href="#account">계정</a></li>
		<li><a class="cd-faq__category truncate" href="#payments">결제</a></li>
		<li><a class="cd-faq__category truncate" href="#privacy">구매</a></li>
		<li><a class="cd-faq__category truncate" href="#delivery">블로그</a></li>
		
	</ul> <!-- cd-faq__categories -->

	<div class="cd-faq__items">
		<ul id="basics" class="cd-faq__group">
			<li class="cd-faq__title"><h2>기본</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>회원 가입은 어떻게 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>1</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>로그인은 어떻게 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>2</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>관리자와의 채팅으로 연결해주세요</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <a href="chatView">관리자 1:1문의</a><br>
            <!-- <a href="chatting">다른채팅</a><br> -->
            <a href="chatmain">채팅메인페이지</a><br>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->


		<ul id="account" class="cd-faq__group">
			<li class="cd-faq__title"><h2>계정</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>비밀번호는 어떻게 바꾸나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>1</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>계정을 삭제하고 싶어요</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>2</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>회원 정보는 어떻게 수정하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>3</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>비밀번호를 잊어버렸어요. 어떻게 찾을 수 있나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>4</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="payments" class="cd-faq__group">
			<li class="cd-faq__title"><h2>결제</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Can I have an invoice for my subscription?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Why did my credit card or PayPal payment fail?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur accusantium dolorem vel, ad, nostrum natus eos, nemo placeat quos nisi architecto rem dolorum amet consectetur molestiae reprehenderit cum harum commodi beatae necessitatibus. Mollitia a nostrum enim earum minima doloribus illum autem, provident vero et, aspernatur quae sunt illo dolorem. Corporis blanditiis, unde, neque, adipisci debitis quas ullam accusantium repudiandae eum nostrum quis! Velit esse harum qui, modi ratione debitis alias laboriosam minus eaque, quod, itaque labore illo totam aut quia fuga nemo. Perferendis ipsa laborum atque assumenda tempore aspernatur a eos harum non id commodi excepturi quaerat ullam, explicabo, incidunt ipsam, accusantium quo magni ut! Ratione, magnam. Delectus nesciunt impedit praesentium sed, aliquam architecto dolores quae, distinctio consectetur obcaecati esse, consequuntur vel sit quis blanditiis possimus dolorum. Eaque architecto doloremque aliquid quae cumque, vitae perferendis enim, iure fugiat, soluta aut!</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Why does my bank statement show multiple charges for one upgrade?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="privacy" class="cd-faq__group">
			<li class="cd-faq__title"><h2>Privacy</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Can I specify my own private key?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>My files are missing! How do I get them back?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How can I access my account data?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus magni vero deserunt enim et quia in aliquam, rem tempore voluptas illo nisi veritatis quas quod placeat ipsa! Error qui harum accusamus incidunt at libero ipsum, suscipit dolorum esse explicabo in eius voluptates quidem voluptatem inventore amet eaque deserunt veniam dignissimos excepturi? Dolore, quo amet nostrum autem nemo. Sit nam assumenda, corporis ea sunt distinctio nostrum doloribus alias, beatae nesciunt dolore saepe consequuntur minima eveniet porro dolor officiis maiores ab obcaecati officia enim aliquam. Itaque fuga molestiae hic accusantium atque corporis quia id sequi enim vero? Hic aperiam sint facilis aliquam quia, accusamus tenetur earum totam enim est, error. Iusto, reiciendis necessitatibus molestias. Voluptatibus eos explicabo repellat nesciunt nam vero minima.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How can I control if other search engines can link to my profile?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="delivery" class="cd-faq__group">
			<li class="cd-faq__title"><h2>Delivery</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>What should I do if my order hasn't been delivered yet?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How can I find your international delivery information?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Who takes care of shipping?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How do returns or refunds work?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How do I use shipping profiles?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How does your UK Next Day Delivery service work?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How does your Next Day Delivery service work?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>When will my order arrive?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>When will my order ship?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->
	</div> <!-- cd-faq__items -->

	<a href="#0" class="cd-faq__close-panel text-replace">Close</a>
  
  <div class="cd-faq__overlay" aria-hidden="true"></div>
</section> <!-- cd-faq -->
<script src="resources/js/faqutil.js"></script> <!-- util functions included in the CodyHouse framework -->
	<script src="resources/js/faqmain.js"></script> 
</body>
</div>
</html>