
/* Drop Tables */

DROP TABLE POST_COMMENT CASCADE CONSTRAINTS;
DROP TABLE BLOG_POST CASCADE CONSTRAINTS;
DROP TABLE BOOK_REVIEW CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAIL CASCADE CONSTRAINTS;
DROP TABLE USER_CART CASCADE CONSTRAINTS;
DROP TABLE USER_WISH CASCADE CONSTRAINTS;
DROP TABLE USER_WISHLIST CASCADE CONSTRAINTS;
DROP TABLE BOOK_INFO CASCADE CONSTRAINTS;
DROP TABLE BOOK_AUTHOR CASCADE CONSTRAINTS;
DROP TABLE BOOK_PUBLIC CASCADE CONSTRAINTS;
DROP TABLE EVENT_RESULT CASCADE CONSTRAINTS;
DROP TABLE EVENT CASCADE CONSTRAINTS;
DROP TABLE FOLLOW_INFO CASCADE CONSTRAINTS;
DROP TABLE MANAGER CASCADE CONSTRAINTS;
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
DROP TABLE USER_PAY CASCADE CONSTRAINTS;
DROP TABLE USER_TRANSFER CASCADE CONSTRAINTS;
DROP TABLE ORDER_LIST CASCADE CONSTRAINTS;
DROP TABLE USER_BLOG CASCADE CONSTRAINTS;
DROP TABLE USER_REWARD_HISTORY CASCADE CONSTRAINTS;
DROP TABLE USER_INFO CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE BLOG_POST
(
	-- 블로그 게시글 번호
	post_no number NOT NULL,
	-- 게시글 제목
	post_title varchar2(50) NOT NULL,
	-- 게시글 내용
	post_contents varchar2(400) NOT NULL,
	-- 게시글 날짜
	post_uploaddate date DEFAULT sysdate NOT NULL,
	-- 게시글 추천
	post_hits number DEFAULT 0,
	-- 게시글 파일
	post_file varchar2(50),
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE,
	PRIMARY KEY (post_no)
);


CREATE TABLE BOOK_AUTHOR
(
	book_author_no number DEFAULT 0 NOT NULL UNIQUE,
	book_author_name varchar2(20) NOT NULL,
	PRIMARY KEY (book_author_no)
);


CREATE TABLE BOOK_INFO
(
	-- 책 인덱스
	-- 
	book_isbn varchar2(30) NOT NULL UNIQUE,
	-- 책 제목
	book_title varchar2(50) NOT NULL,
	-- 책 재고
	book_stock number DEFAULT 0 NOT NULL,
	-- 책 입고날짜
	book_inputdate date DEFAULT sysdate NOT NULL,
	-- 책 구매시 주는 포인트
	book_reward number DEFAULT 0,
	book_price number DEFAULT 0,
	book_author_no number DEFAULT 0 NOT NULL UNIQUE,
	book_public_no number DEFAULT 0 NOT NULL UNIQUE,
	book_contents varchar2(500) NOT NULL,
	PRIMARY KEY (book_isbn)
);


CREATE TABLE BOOK_PUBLIC
(
	book_public_no number DEFAULT 0 NOT NULL UNIQUE,
	book_public_name varchar2(30),
	PRIMARY KEY (book_public_no)
);


CREATE TABLE BOOK_REVIEW
(
	-- 책 리뷰 번호
	book_review_no number NOT NULL UNIQUE,
	-- 책 리뷰 작성자
	book_review_witter varchar2(20) NOT NULL,
	-- 책 한줄리뷰
	book_review_short varchar2(100) NOT NULL,
	book_review_date date DEFAULT sysdate NOT NULL,
	-- 0
	-- 1
	-- 2
	-- 3
	-- 4
	book_review_star number DEFAULT 0 NOT NULL,
	-- 책 인덱스
	-- 
	book_isbn varchar2(30) NOT NULL UNIQUE,
	PRIMARY KEY (book_review_no)
);


CREATE TABLE EVENT
(
	-- 이벤트명
	event_name varchar2(50) NOT NULL UNIQUE,
	-- 회원ID
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (event_name)
);


CREATE TABLE EVENT_RESULT
(
	-- 이벤트명
	event_name varchar2(50) NOT NULL UNIQUE,
	-- 0:꽝
	-- 1:당첨
	event_result number DEFAULT 0,
	PRIMARY KEY (event_name)
);


CREATE TABLE FOLLOW_INFO
(
	-- 상대가 나를 팔로우
	follow_ed number DEFAULT 0 NOT NULL,
	-- 내가 상대를 팔로우
	follow_ing number DEFAULT 0 NOT NULL,
	-- 팔로우 결과값
	-- XX:0
	-- OX:1
	-- XO:2
	-- OO:3
	follow_result number DEFAULT 0 NOT NULL,
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE
);


CREATE TABLE MANAGER
(
	-- 관리자 아이디
	manager_id varchar2(20) NOT NULL UNIQUE,
	-- 관리자 비밀번호
	manager_pw varchar2(30) NOT NULL,
	PRIMARY KEY (manager_id)
);


CREATE TABLE MESSAGE
(
	-- 메세지 번호
	message_no number DEFAULT 0 NOT NULL UNIQUE,
	-- 수신자 id
	message_recv_id varchar2(20) NOT NULL,
	-- 받은 메세지
	message_recv_contents varchar2(200) NOT NULL,
	-- 보낸메세지
	message_sent_contents varchar2(200) NOT NULL,
	-- 메세지 받은 날짜
	message_recv_date date DEFAULT sysdate NOT NULL,
	-- 메세지 보낸 날짜
	message_sent_date date DEFAULT sysdate NOT NULL,
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE,
	PRIMARY KEY (message_no)
);


CREATE TABLE ORDER_DETAIL
(
	order_detail_no number DEFAULT 0 NOT NULL UNIQUE,
	book_price number DEFAULT 0 NOT NULL,
	order_detail_count number DEFAULT 0 NOT NULL,
	-- 책 인덱스
	-- 
	book_isbn varchar2(30) NOT NULL UNIQUE,
	PRIMARY KEY (order_detail_no)
);


CREATE TABLE ORDER_LIST
(
	-- 주문번호
	order_no number NOT NULL UNIQUE,
	-- 주문날짜
	order_date date NOT NULL,
	-- 총 주문 금액
	order_totalprice number DEFAULT 0 NOT NULL,
	-- 주문상태
	order_state varchar2(30) NOT NULL,
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE,
	PRIMARY KEY (order_no)
);


CREATE TABLE POST_COMMENT
(
	post_comment_no number DEFAULT 0 NOT NULL UNIQUE,
	-- 댓글 작성자 id
	post_comment_writter varchar2(20) NOT NULL,
	post_comment_content varchar2(300) NOT NULL,
	post_comment_date date DEFAULT sysdate NOT NULL,
	post_comment_like number DEFAULT 0,
	-- 블로그 게시글 번호
	post_no number NOT NULL,
	PRIMARY KEY (post_comment_no)
);


CREATE TABLE USER_BLOG
(
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE,
	PRIMARY KEY (user_id)
);


CREATE TABLE USER_CART
(
	-- 찜 번호
	user_cart_no number DEFAULT 0 NOT NULL UNIQUE,
	-- 장바구니에 넣은 날짜
	user_cart_date date DEFAULT sysdate,
	-- 책 인덱스
	-- 
	book_isbn varchar2(30) NOT NULL UNIQUE,
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE,
	-- 장바구니에 넣은 수량
	user_cart_count number DEFAULT 0,
	PRIMARY KEY (user_cart_no)
);


CREATE TABLE USER_INFO
(
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE,
	-- 회원비밀번호
	user_pw varchar2(30) NOT NULL,
	-- 회원이름
	user_name varchar2(20) NOT NULL,
	-- 회원생년월일
	user_birth number NOT NULL,
	-- 회원전화번호
	user_phone number NOT NULL,
	-- 회원주소
	user_address varchar2(200) NOT NULL,
	-- 유저선호장르
	user_genre varchar2(20) NOT NULL,
	-- 유저 등급
	-- 0-bronze
	-- 1-silver
	-- 2-gold
	user_grade number DEFAULT 0 NOT NULL,
	PRIMARY KEY (user_id)
);


CREATE TABLE USER_PAY
(
	-- 주문번호
	order_no number NOT NULL UNIQUE,
	user_pay_price number DEFAULT 0 NOT NULL,
	user_pay_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (order_no)
);


CREATE TABLE USER_REWARD_HISTORY
(
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE,
	book_reward_plus number DEFAULT 0,
	-- 책 포인트
	book_reward_minus number DEFAULT 0 NOT NULL,
	reward_date date DEFAULT sysdate NOT NULL,
	book_reward_sum number DEFAULT 0 NOT NULL,
	PRIMARY KEY (user_id)
);


CREATE TABLE USER_TRANSFER
(
	-- 주문번호
	order_no number NOT NULL UNIQUE,
	-- 수신인
	user_transfer_name varchar2(20),
	-- 수신자 전화번호
	user_transfer_phone number DEFAULT 0,
	-- 수신인 주소
	user_transter_address varchar2(150),
	PRIMARY KEY (order_no)
);


CREATE TABLE USER_WISH
(
	-- 책 인덱스
	-- 
	book_isbn varchar2(30) NOT NULL UNIQUE,
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE
);


CREATE TABLE USER_WISHLIST
(
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE,
	user_wish number DEFAULT 0 NOT NULL,
	-- 책 인덱스
	-- 
	book_isbn varchar2(30) NOT NULL UNIQUE,
	PRIMARY KEY (user_id)
);



/* Create Foreign Keys */

ALTER TABLE POST_COMMENT
	ADD FOREIGN KEY (post_no)
	REFERENCES BLOG_POST (post_no)
;


ALTER TABLE BOOK_INFO
	ADD FOREIGN KEY (book_author_no)
	REFERENCES BOOK_AUTHOR (book_author_no)
;


ALTER TABLE BOOK_REVIEW
	ADD FOREIGN KEY (book_isbn)
	REFERENCES BOOK_INFO (book_isbn)
;


ALTER TABLE ORDER_DETAIL
	ADD FOREIGN KEY (book_isbn)
	REFERENCES BOOK_INFO (book_isbn)
;


ALTER TABLE USER_CART
	ADD FOREIGN KEY (book_isbn)
	REFERENCES BOOK_INFO (book_isbn)
;


ALTER TABLE USER_WISH
	ADD FOREIGN KEY (book_isbn)
	REFERENCES BOOK_INFO (book_isbn)
;


ALTER TABLE USER_WISHLIST
	ADD FOREIGN KEY (book_isbn)
	REFERENCES BOOK_INFO (book_isbn)
;


ALTER TABLE BOOK_INFO
	ADD FOREIGN KEY (book_public_no)
	REFERENCES BOOK_PUBLIC (book_public_no)
;


ALTER TABLE EVENT_RESULT
	ADD FOREIGN KEY (event_name)
	REFERENCES EVENT (event_name)
;


ALTER TABLE USER_PAY
	ADD FOREIGN KEY (order_no)
	REFERENCES ORDER_LIST (order_no)
;


ALTER TABLE USER_TRANSFER
	ADD FOREIGN KEY (order_no)
	REFERENCES ORDER_LIST (order_no)
;


ALTER TABLE BLOG_POST
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_BLOG (user_id)
;


ALTER TABLE MESSAGE
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_BLOG (user_id)
;


ALTER TABLE EVENT
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE FOLLOW_INFO
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE ORDER_LIST
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE USER_BLOG
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE USER_CART
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE USER_REWARD_HISTORY
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE USER_WISH
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE USER_WISHLIST
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;



/* Comments */

COMMENT ON COLUMN BLOG_POST.post_no IS '블로그 게시글 번호';
COMMENT ON COLUMN BLOG_POST.post_title IS '게시글 제목';
COMMENT ON COLUMN BLOG_POST.post_contents IS '게시글 내용';
COMMENT ON COLUMN BLOG_POST.post_uploaddate IS '게시글 날짜';
COMMENT ON COLUMN BLOG_POST.post_hits IS '게시글 추천';
COMMENT ON COLUMN BLOG_POST.post_file IS '게시글 파일';
COMMENT ON COLUMN BLOG_POST.user_id IS '회원ID';
COMMENT ON COLUMN BOOK_INFO.book_isbn IS '책 인덱스
';
COMMENT ON COLUMN BOOK_INFO.book_title IS '책 제목';
COMMENT ON COLUMN BOOK_INFO.book_stock IS '책 재고';
COMMENT ON COLUMN BOOK_INFO.book_inputdate IS '책 입고날짜';
COMMENT ON COLUMN BOOK_INFO.book_reward IS '책 구매시 주는 포인트';
COMMENT ON COLUMN BOOK_REVIEW.book_review_no IS '책 리뷰 번호';
COMMENT ON COLUMN BOOK_REVIEW.book_review_witter IS '책 리뷰 작성자';
COMMENT ON COLUMN BOOK_REVIEW.book_review_short IS '책 한줄리뷰';
COMMENT ON COLUMN BOOK_REVIEW.book_review_star IS '0
1
2
3
4';
COMMENT ON COLUMN BOOK_REVIEW.book_isbn IS '책 인덱스
';
COMMENT ON COLUMN EVENT.event_name IS '이벤트명';
COMMENT ON COLUMN EVENT.user_id IS '회원ID';
COMMENT ON COLUMN EVENT_RESULT.event_name IS '이벤트명';
COMMENT ON COLUMN EVENT_RESULT.event_result IS '0:꽝
1:당첨';
COMMENT ON COLUMN FOLLOW_INFO.follow_ed IS '상대가 나를 팔로우';
COMMENT ON COLUMN FOLLOW_INFO.follow_ing IS '내가 상대를 팔로우';
COMMENT ON COLUMN FOLLOW_INFO.follow_result IS '팔로우 결과값
XX:0
OX:1
XO:2
OO:3';
COMMENT ON COLUMN FOLLOW_INFO.user_id IS '회원ID';
COMMENT ON COLUMN MANAGER.manager_id IS '관리자 아이디';
COMMENT ON COLUMN MANAGER.manager_pw IS '관리자 비밀번호';
COMMENT ON COLUMN MESSAGE.message_no IS '메세지 번호';
COMMENT ON COLUMN MESSAGE.message_recv_id IS '수신자 id';
COMMENT ON COLUMN MESSAGE.message_recv_contents IS '받은 메세지';
COMMENT ON COLUMN MESSAGE.message_sent_contents IS '보낸메세지';
COMMENT ON COLUMN MESSAGE.message_recv_date IS '메세지 받은 날짜';
COMMENT ON COLUMN MESSAGE.message_sent_date IS '메세지 보낸 날짜';
COMMENT ON COLUMN MESSAGE.user_id IS '회원ID';
COMMENT ON COLUMN ORDER_DETAIL.book_isbn IS '책 인덱스
';
COMMENT ON COLUMN ORDER_LIST.order_no IS '주문번호';
COMMENT ON COLUMN ORDER_LIST.order_date IS '주문날짜';
COMMENT ON COLUMN ORDER_LIST.order_totalprice IS '총 주문 금액';
COMMENT ON COLUMN ORDER_LIST.order_state IS '주문상태';
COMMENT ON COLUMN ORDER_LIST.user_id IS '회원ID';
COMMENT ON COLUMN POST_COMMENT.post_comment_writter IS '댓글 작성자 id';
COMMENT ON COLUMN POST_COMMENT.post_no IS '블로그 게시글 번호';
COMMENT ON COLUMN USER_BLOG.user_id IS '회원ID';
COMMENT ON COLUMN USER_CART.user_cart_no IS '찜 번호';
COMMENT ON COLUMN USER_CART.user_cart_date IS '장바구니에 넣은 날짜';
COMMENT ON COLUMN USER_CART.book_isbn IS '책 인덱스
';
COMMENT ON COLUMN USER_CART.user_id IS '회원ID';
COMMENT ON COLUMN USER_CART.user_cart_count IS '장바구니에 넣은 수량';
COMMENT ON COLUMN USER_INFO.user_id IS '회원ID';
COMMENT ON COLUMN USER_INFO.user_pw IS '회원비밀번호';
COMMENT ON COLUMN USER_INFO.user_name IS '회원이름';
COMMENT ON COLUMN USER_INFO.user_birth IS '회원생년월일';
COMMENT ON COLUMN USER_INFO.user_phone IS '회원전화번호';
COMMENT ON COLUMN USER_INFO.user_address IS '회원주소';
COMMENT ON COLUMN USER_INFO.user_genre IS '유저선호장르';
COMMENT ON COLUMN USER_INFO.user_grade IS '유저 등급
0-bronze
1-silver
2-gold';
COMMENT ON COLUMN USER_PAY.order_no IS '주문번호';
COMMENT ON COLUMN USER_REWARD_HISTORY.user_id IS '회원ID';
COMMENT ON COLUMN USER_REWARD_HISTORY.book_reward_minus IS '책 포인트';
COMMENT ON COLUMN USER_TRANSFER.order_no IS '주문번호';
COMMENT ON COLUMN USER_TRANSFER.user_transfer_name IS '수신인';
COMMENT ON COLUMN USER_TRANSFER.user_transfer_phone IS '수신자 전화번호';
COMMENT ON COLUMN USER_TRANSFER.user_transter_address IS '수신인 주소';
COMMENT ON COLUMN USER_WISH.book_isbn IS '책 인덱스
';
COMMENT ON COLUMN USER_WISH.user_id IS '회원ID';
COMMENT ON COLUMN USER_WISHLIST.user_id IS '회원ID';
COMMENT ON COLUMN USER_WISHLIST.book_isbn IS '책 인덱스
';



