<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
               <div class="site-search ml-xl-0 ml-md-auto w-r-100 my-2 my-xl-0">
                    <form class="form-inline" id="bookName" method="get" action="list">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <i class="glph-icon flaticon-loupe input-group-text py-2d75 bg-white-100 border-white-100"></i>
                            </div>
                            <input type="hidden" name="page" id="page" />
                            <input class="form-control bg-white-100 min-width-380 py-2d75 height-4 border-white-100" type="text" placeholder="검색어 입력" aria-label="Search" name="searchText" value="${searchText}" onkeypress="if(event.keyCode == 13){ bookPage(); }"/>
                            
                        </div>
                        <button class="btn btn-outline-success my-2 my-sm-0 sr-only" type="submit"  id="search" onclick="javascript: pagingFormSubmit(1); bookPage();" value="검색">Search</button>
                    </form>
                </div>
                
                
                <!-- 반복 시작 -->
<c:forEach var="book" items="${booklist}" varStatus="status">  
<tr>
	<td class="center" style="width:140px; text-align:center;"><img src="download?filename=${book.book_image}"></td>  
	<td class="center" style="width:370px; text-align:left;">
		<p style="font-size: 16px; font-weight:bold;"><a href="read?book_isbn=${book.book_isbn}">${book.book_title}</a></p>  <!-- read다음 book_no는 parameterType값 ; controller와 일치해야함 -->
		<p style="font-size: 14px; font-weight:normal;">저자: ${book.book_author}</p>
		<p style="font-size: 12px; font-weight:bold; color:#acacac;"><${book.book_public}></p>
	</td>
	<td class="center" style="width:150px; text-align:center; font-size: 14px;">${book.book_reward}</td>
	<td class="center" style="width:150px; text-align:center; font-size: 14px;"><fmt:formatNumber value="${book.book_price}" pattern="###,###" />원</td>
	<td class="center" style="width:70px; text-align:center;" value="${book.book_isbn}"	>    
			<a href="#" onclick="bt1Click('${book.book_isbn}');" class="btn btn-primary">Add to Cart</a><br><br>
			<input type="hidden" id="book_isbn_param${status.count}" value="${book.book_isbn}">
			<a href="#" onclick="bt2Click(${book.book_isbn});" class="btn btn-primary">위시리스트</a>
	</td>
</tr>

</c:forEach>        
<!-- 반복 끝 -->
</body>
</html>