<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

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
	
	<!-- 한글오류나는거..  https://zzznara2.tistory.com/94 -->
	<title>Home</title>
</head>
<body>

<main id="content">
        <div class="mb-5 mb-lg-8 pb-xl-1">
            <div class="mb-5 mb-lg-8 pb-xl-1">
                <div class="page-header border-bottom" style="background-color:rgb(255,246,246)">
                    <div class="container">
                        <div class="d-md-flex justify-content-between align-items-center py-4">
                            <h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">New Post</h1>
                         						<nav class="woocommerce-breadcrumb font-size-2">
				                                <a href="/team2/blogmain" class="h-primary">Blog Main</a>
				                                <span> > </span>
				                                <a href="${user_id}" class="h-primary">Blog List(${user_id})</a>
				                            </nav>
                        </div>
                    </div>
                </div>
            </div>
          </div>
          
          
 </main>
<div class="container" >

	<!--  메인에 있는 좌측 (
	개인정보 덩어리
	친구목록 덩어리 
	카테고리 덩어리는 그대로 가지고 와야하나? 아니면 그냥 글쓰기만 ?
	아니면 글 쓸 때 쓰는 툴들 이미지로?)
	
	글쓰기 폼 덩어리-->
	<div>
		<form id="post_write" action="post_write" method="post"
			enctype="multipart/form-data" onsubmit="return post_formCheck()">
			<div>
				<label for="post_title"> 글 제목</label>
				<input type="text" name="post_title" id="post_title" placeholder="제목을 입력하세요">
			</div>
			<div>
			<label for="post_contents"> 내용</label>
				<textarea rows="10" cols="10" class="summernote" id="post_contents" name="post_contents" ></textarea>
			</div>
			<div>
				<input type="file" name="upload" size="30">
			</div>
			
			<!-- 책 제목을 받아야 하는 부분 검색하기.. 스트링으로 받아서 값을 받아-->
			<div>
				<label for="post_book_title">책</label>
				<input type="text" onkeyup="javascript:auto_book_complete();" name="post_book_title" id="post_book_title" placeholder="영감을 준 책 제목">
			</div>
			
			<button type="submit" id="post_save">글 저장하기</button>
		<!-- 나중에 ajex로 쓸 수 있겠지만 일단은 페이지가 바뀌는 것으로 하자 -->
		</form>
			<button onclick="location.href='${sessionScope.loginId}';">목록으로 돌아가기</button>
	</div>
		<script>
	      $('.summernote').summernote({
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        height: 300
	      });
	    </script>
    </div>
</body>
</html>
