
/* Drop Tables */

DROP TABLE POST_COMMENT CASCADE CONSTRAINTS;
DROP TABLE BLOG_POST CASCADE CONSTRAINTS;
DROP TABLE BOOK_AUTHOR CASCADE CONSTRAINTS;
DROP TABLE BOOK_REVIEW CASCADE CONSTRAINTS;
DROP TABLE CART_BOOK CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAIL CASCADE CONSTRAINTS;
DROP TABLE USER_WISHLIST CASCADE CONSTRAINTS;
DROP TABLE BOOK_INFO CASCADE CONSTRAINTS;
DROP TABLE BOOK_PUBLIC CASCADE CONSTRAINTS;
DROP TABLE CHAT CASCADE CONSTRAINTS;
DROP TABLE CHATJOIN CASCADE CONSTRAINTS;
DROP TABLE CHATROOM CASCADE CONSTRAINTS;
DROP TABLE EVENT CASCADE CONSTRAINTS;
DROP TABLE FOLLOW CASCADE CONSTRAINTS;
DROP TABLE MANAGER CASCADE CONSTRAINTS;
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
DROP TABLE USER_PAY CASCADE CONSTRAINTS;
DROP TABLE USER_TRANSFER CASCADE CONSTRAINTS;
DROP TABLE ORDER_LIST CASCADE CONSTRAINTS;
DROP TABLE USER_CART CASCADE CONSTRAINTS;
DROP TABLE USER_REWARD_HISTORY CASCADE CONSTRAINTS;
DROP TABLE USER_WISH CASCADE CONSTRAINTS;
DROP TABLE USER_INFO CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE book_info_seq;
DROP SEQUENCE book_review_seq;
DROP SEQUENCE cart_book_seq;
DROP SEQUENCE chat_seq;
DROP SEQUENCE follow_seq;
DROP SEQUENCE member_seq;
DROP SEQUENCE message_seq;
DROP SEQUENCE order_detail_seq;
DROP SEQUENCE post_comment_seq;
DROP SEQUENCE post_no_seq;
DROP SEQUENCE user_wishlist_no_seq;




/* Create Sequences */

CREATE SEQUENCE book_info_seq;
CREATE SEQUENCE book_review_seq;
CREATE SEQUENCE cart_book_seq;
CREATE SEQUENCE chat_seq;
CREATE SEQUENCE follow_seq;
CREATE SEQUENCE member_seq;
CREATE SEQUENCE message_seq;
CREATE SEQUENCE order_detail_seq;
CREATE SEQUENCE post_comment_seq;
CREATE SEQUENCE post_no_seq;
CREATE SEQUENCE user_wishlist_no_seq;



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
	-- 업로드된 파일
	post_originalfile varchar2(200),
	-- 저장된 파일
	post_savedfile varchar2(200),
	-- 회원ID
	user_id varchar2(20) NOT NULL,
	post_book_isbn varchar2(30),
	post_book_title varchar2(150),
	PRIMARY KEY (post_no)
);


CREATE TABLE BOOK_AUTHOR
(
	-- 저자
	book_author varchar2(50) DEFAULT '0' NOT NULL,
	book_author_name varchar2(20) NOT NULL,
	PRIMARY KEY (book_author)
);


CREATE TABLE BOOK_INFO
(
	-- 책 인덱스
	-- 
	book_isbn varchar2(30) NOT NULL,
	-- 책 제목
	book_title varchar2(150) NOT NULL,
	-- 책 재고
	book_stock number DEFAULT 0 NOT NULL,
	-- 책 입고날짜
	book_inputdate varchar2(200) NOT NULL,
	-- 책 구매시 주는 포인트
	book_reward number DEFAULT 0,
	book_price number DEFAULT 0,
	-- 책 설명
	book_contents varchar2(700),
	-- 책 이미지 저장
	-- 저장은 서버 컴퓨터에
	book_image varchar2(200),
	-- 저자
	book_author varchar2(50) NOT NULL,
	-- 출판사
	book_public varchar2(50) NOT NULL,
	-- 책 번호
	book_no number DEFAULT 0 NOT NULL,
	PRIMARY KEY (book_isbn)
);


CREATE TABLE BOOK_PUBLIC
(
	-- 출판사
	book_public varchar2(50) DEFAULT '0' NOT NULL,
	book_public_name varchar2(30) NOT NULL,
	PRIMARY KEY (book_public)
);


CREATE TABLE BOOK_REVIEW
(
	-- 책 리뷰 번호
	book_review_no number NOT NULL,
	-- 책 리뷰 작성자
	book_review_writer varchar2(20) NOT NULL,
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
	book_isbn varchar2(30) NOT NULL,
	PRIMARY KEY (book_review_no)
);


CREATE TABLE CART_BOOK
(
	-- 장바구니에 담긴 책 식별자
	cart_book_no number DEFAULT 0 NOT NULL,
	-- 장바구니에 책을 담은 날짜
	cart_book_inputdate date DEFAULT sysdate NOT NULL,
	-- 장바구니에 담은 책의 개수
	cart_book_count number DEFAULT 0 NOT NULL,
	-- 장바구니에 담긴 책가격
	book_price number DEFAULT 0,
	-- 책 제목
	book_title varchar2(150),
	-- 책 인덱스
	-- 
	book_isbn varchar2(30) NOT NULL,
	-- 찜 번호
	user_cart_no number DEFAULT 0 NOT NULL,
	PRIMARY KEY (cart_book_no)
);


CREATE TABLE CHAT
(
	-- 메세지 번호
	chat_id number DEFAULT 0 NOT NULL,
	-- 채팅 메세지
	chat_message varchar2(300),
	-- 채팅한 시간
	chat_time varchar2(40),
	-- 채팅방 경로
	chatroom_id varchar2(200) NOT NULL,
	-- 회원ID
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (chat_id)
);


CREATE TABLE CHATJOIN
(
	-- 식별자
	chatjoin_no number DEFAULT 0 NOT NULL,
	-- 채팅방 경로
	chatroom_id varchar2(200) NOT NULL,
	-- 회원ID
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (chatjoin_no)
);


CREATE TABLE CHATROOM
(
	-- 채팅방 경로
	chatroom_id varchar2(200) NOT NULL,
	PRIMARY KEY (chatroom_id)
);


CREATE TABLE EVENT
(
	-- 이벤트 이름
	event_name varchar2(40),
	-- 0:꽝
	-- 1:당첨
	event_result number DEFAULT 0,
	-- 회원ID
	user_id varchar2(20) NOT NULL
);


CREATE TABLE FOLLOW
(
	-- 시퀀스
	id varchar2(20) NOT NULL,
	-- 상대방 id
	follow_ing_id varchar2(20) NOT NULL,
	-- 본인 id
	follow_ed_id varchar2(20) NOT NULL,
	UNIQUE (follow_ed_id, follow_ing_id)
);


CREATE TABLE MANAGER
(
	-- 관리자 아이디
	manager_id varchar2(20) NOT NULL,
	-- 관리자 비밀번호
	manager_pw varchar2(30) NOT NULL,
	PRIMARY KEY (manager_id)
);


CREATE TABLE MESSAGE
(
	-- 메세지 번호
	message_no number DEFAULT 0 NOT NULL,
	-- 메세지 내용
	message_contents varchar2(200) NOT NULL,
	-- 메세지 보낸 날짜
	message_date date DEFAULT sysdate NOT NULL,
	-- 메세지 조회했는지
	message_hits number DEFAULT 0 NOT NULL,
	-- 쪽지 첨부파일
	message_file varchar2(200),
	-- 메세지 보낸 아이디
	message_sent_id varchar2(20) NOT NULL,
	-- 메세지 받은 아이디
	message_recv_id varchar2(20) NOT NULL,
	PRIMARY KEY (message_no)
);


CREATE TABLE ORDER_DETAIL
(
	order_detail_no number DEFAULT 0 NOT NULL,
	book_price number DEFAULT 0 NOT NULL,
	order_detail_count number DEFAULT 0 NOT NULL,
	-- 책 인덱스
	-- 
	book_isbn varchar2(30) NOT NULL,
	-- 주문번호
	order_no number NOT NULL,
	PRIMARY KEY (order_detail_no)
);


CREATE TABLE ORDER_LIST
(
	-- 주문번호
	order_no number NOT NULL,
	-- 주문날짜
	order_date date DEFAULT sysdate,
	-- 총 주문 금액
	order_totalprice number DEFAULT 0 NOT NULL,
	-- 주문상태
	order_state varchar2(30),
	-- 배송지 주소
	order_address varchar2(400),
	-- 회원ID
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (order_no)
);


CREATE TABLE POST_COMMENT
(
	post_comment_no number DEFAULT 0 NOT NULL,
	-- 댓글 작성자 id
	post_comment_writter varchar2(20) NOT NULL,
	post_comment_content varchar2(300) NOT NULL,
	post_comment_date date DEFAULT sysdate NOT NULL,
	post_comment_like number DEFAULT 0,
	-- 블로그 게시글 번호
	post_no number NOT NULL,
	PRIMARY KEY (post_comment_no)
);


CREATE TABLE USER_CART
(
	-- 찜 번호
	user_cart_no number DEFAULT 0 NOT NULL,
	-- 회원ID
	user_id varchar2(20) NOT NULL UNIQUE,
	PRIMARY KEY (user_cart_no)
);


CREATE TABLE USER_INFO
(
	-- 회원ID
	user_id varchar2(20) NOT NULL,
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
	order_no number NOT NULL,
	user_pay_price number DEFAULT 0 NOT NULL,
	user_pay_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (order_no)
);


CREATE TABLE USER_REWARD_HISTORY
(
	-- 유저 포인트 리스트의 번호
	user_reward_no number DEFAULT 0 NOT NULL,
	book_reward_plus number DEFAULT 0 NOT NULL,
	-- 책 포인트
	book_reward_minus number DEFAULT 0 NOT NULL,
	reward_date date DEFAULT sysdate NOT NULL,
	book_reward_sum number DEFAULT 0 NOT NULL,
	-- 회원ID
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (user_reward_no)
);


CREATE TABLE USER_TRANSFER
(
	-- 주문번호
	order_no number NOT NULL,
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
	-- user_wish 식별
	user_wish_no number DEFAULT 0 NOT NULL,
	-- 회원ID
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (user_wish_no)
);


CREATE TABLE USER_WISHLIST
(
	user_wishlist_no number DEFAULT 0 NOT NULL,
	-- 책제목
	book_title varchar2(200),
	-- 회원ID
	user_id varchar2(20) NOT NULL,
	-- 책 인덱스
	-- 
	book_isbn varchar2(30) NOT NULL,
	-- user_wish 식별
	user_wish_no number DEFAULT 0 NOT NULL,
	PRIMARY KEY (user_wishlist_no),
	UNIQUE (user_id, book_isbn)
);



/* Create Foreign Keys */

ALTER TABLE POST_COMMENT
	ADD FOREIGN KEY (post_no)
	REFERENCES BLOG_POST (post_no)
;


ALTER TABLE BOOK_REVIEW
	ADD FOREIGN KEY (book_isbn)
	REFERENCES BOOK_INFO (book_isbn)
;


ALTER TABLE CART_BOOK
	ADD FOREIGN KEY (book_isbn)
	REFERENCES BOOK_INFO (book_isbn)
;


ALTER TABLE ORDER_DETAIL
	ADD FOREIGN KEY (book_isbn)
	REFERENCES BOOK_INFO (book_isbn)
;


ALTER TABLE USER_WISHLIST
	ADD FOREIGN KEY (book_isbn)
	REFERENCES BOOK_INFO (book_isbn)
;


ALTER TABLE CHAT
	ADD FOREIGN KEY (chatroom_id)
	REFERENCES CHATROOM (chatroom_id)
;


ALTER TABLE CHATJOIN
	ADD FOREIGN KEY (chatroom_id)
	REFERENCES CHATROOM (chatroom_id)
;


ALTER TABLE ORDER_DETAIL
	ADD FOREIGN KEY (order_no)
	REFERENCES ORDER_LIST (order_no)
;


ALTER TABLE USER_PAY
	ADD FOREIGN KEY (order_no)
	REFERENCES ORDER_LIST (order_no)
;


ALTER TABLE USER_TRANSFER
	ADD FOREIGN KEY (order_no)
	REFERENCES ORDER_LIST (order_no)
;


ALTER TABLE CART_BOOK
	ADD FOREIGN KEY (user_cart_no)
	REFERENCES USER_CART (user_cart_no)
;


ALTER TABLE BLOG_POST
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE CHAT
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE CHATJOIN
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE EVENT
	ADD FOREIGN KEY (user_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE FOLLOW
	ADD FOREIGN KEY (follow_ing_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE FOLLOW
	ADD FOREIGN KEY (follow_ed_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE MESSAGE
	ADD FOREIGN KEY (message_recv_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE MESSAGE
	ADD FOREIGN KEY (message_sent_id)
	REFERENCES USER_INFO (user_id)
;


ALTER TABLE ORDER_LIST
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


ALTER TABLE USER_WISHLIST
	ADD FOREIGN KEY (user_wish_no)
	REFERENCES USER_WISH (user_wish_no)
;



/* Comments */

COMMENT ON COLUMN BLOG_POST.post_no IS '블로그 게시글 번호';
COMMENT ON COLUMN BLOG_POST.post_title IS '게시글 제목';
COMMENT ON COLUMN BLOG_POST.post_contents IS '게시글 내용';
COMMENT ON COLUMN BLOG_POST.post_uploaddate IS '게시글 날짜';
COMMENT ON COLUMN BLOG_POST.post_hits IS '게시글 추천';
COMMENT ON COLUMN BLOG_POST.post_originalfile IS '업로드된 파일';
COMMENT ON COLUMN BLOG_POST.post_savedfile IS '저장된 파일';
COMMENT ON COLUMN BLOG_POST.user_id IS '회원ID';
COMMENT ON COLUMN BOOK_AUTHOR.book_author IS '저자';
COMMENT ON COLUMN BOOK_INFO.book_isbn IS '책 인덱스
';
COMMENT ON COLUMN BOOK_INFO.book_title IS '책 제목';
COMMENT ON COLUMN BOOK_INFO.book_stock IS '책 재고';
COMMENT ON COLUMN BOOK_INFO.book_inputdate IS '책 입고날짜';
COMMENT ON COLUMN BOOK_INFO.book_reward IS '책 구매시 주는 포인트';
COMMENT ON COLUMN BOOK_INFO.book_contents IS '책 설명';
COMMENT ON COLUMN BOOK_INFO.book_image IS '책 이미지 저장
저장은 서버 컴퓨터에';
COMMENT ON COLUMN BOOK_INFO.book_author IS '저자';
COMMENT ON COLUMN BOOK_INFO.book_public IS '출판사';
COMMENT ON COLUMN BOOK_INFO.book_no IS '책 번호';
COMMENT ON COLUMN BOOK_PUBLIC.book_public IS '출판사';
COMMENT ON COLUMN BOOK_REVIEW.book_review_no IS '책 리뷰 번호';
COMMENT ON COLUMN BOOK_REVIEW.book_review_writer IS '책 리뷰 작성자';
COMMENT ON COLUMN BOOK_REVIEW.book_review_short IS '책 한줄리뷰';
COMMENT ON COLUMN BOOK_REVIEW.book_review_star IS '0
1
2
3
4';
COMMENT ON COLUMN BOOK_REVIEW.book_isbn IS '책 인덱스
';
COMMENT ON COLUMN CART_BOOK.cart_book_no IS '장바구니에 담긴 책 식별자';
COMMENT ON COLUMN CART_BOOK.cart_book_inputdate IS '장바구니에 책을 담은 날짜';
COMMENT ON COLUMN CART_BOOK.cart_book_count IS '장바구니에 담은 책의 개수';
COMMENT ON COLUMN CART_BOOK.book_price IS '장바구니에 담긴 책가격';
COMMENT ON COLUMN CART_BOOK.book_title IS '책 제목';
COMMENT ON COLUMN CART_BOOK.book_isbn IS '책 인덱스
';
COMMENT ON COLUMN CART_BOOK.user_cart_no IS '찜 번호';
COMMENT ON COLUMN CHAT.chat_id IS '메세지 번호';
COMMENT ON COLUMN CHAT.chat_message IS '채팅 메세지';
COMMENT ON COLUMN CHAT.chat_time IS '채팅한 시간';
COMMENT ON COLUMN CHAT.chatroom_id IS '채팅방 경로';
COMMENT ON COLUMN CHAT.user_id IS '회원ID';
COMMENT ON COLUMN CHATJOIN.chatjoin_no IS '식별자';
COMMENT ON COLUMN CHATJOIN.chatroom_id IS '채팅방 경로';
COMMENT ON COLUMN CHATJOIN.user_id IS '회원ID';
COMMENT ON COLUMN CHATROOM.chatroom_id IS '채팅방 경로';
COMMENT ON COLUMN EVENT.event_name IS '이벤트 이름';
COMMENT ON COLUMN EVENT.event_result IS '0:꽝
1:당첨';
COMMENT ON COLUMN EVENT.user_id IS '회원ID';
COMMENT ON COLUMN FOLLOW.id IS '시퀀스';
COMMENT ON COLUMN FOLLOW.follow_ing_id IS '상대방 id';
COMMENT ON COLUMN FOLLOW.follow_ed_id IS '본인 id';
COMMENT ON COLUMN MANAGER.manager_id IS '관리자 아이디';
COMMENT ON COLUMN MANAGER.manager_pw IS '관리자 비밀번호';
COMMENT ON COLUMN MESSAGE.message_no IS '메세지 번호';
COMMENT ON COLUMN MESSAGE.message_contents IS '메세지 내용';
COMMENT ON COLUMN MESSAGE.message_date IS '메세지 보낸 날짜';
COMMENT ON COLUMN MESSAGE.message_hits IS '메세지 조회했는지';
COMMENT ON COLUMN MESSAGE.message_file IS '쪽지 첨부파일';
COMMENT ON COLUMN MESSAGE.message_sent_id IS '메세지 보낸 아이디';
COMMENT ON COLUMN MESSAGE.message_recv_id IS '메세지 받은 아이디';
COMMENT ON COLUMN ORDER_DETAIL.book_isbn IS '책 인덱스
';
COMMENT ON COLUMN ORDER_DETAIL.order_no IS '주문번호';
COMMENT ON COLUMN ORDER_LIST.order_no IS '주문번호';
COMMENT ON COLUMN ORDER_LIST.order_date IS '주문날짜';
COMMENT ON COLUMN ORDER_LIST.order_totalprice IS '총 주문 금액';
COMMENT ON COLUMN ORDER_LIST.order_state IS '주문상태';
COMMENT ON COLUMN ORDER_LIST.order_address IS '배송지 주소';
COMMENT ON COLUMN ORDER_LIST.user_id IS '회원ID';
COMMENT ON COLUMN POST_COMMENT.post_comment_writter IS '댓글 작성자 id';
COMMENT ON COLUMN POST_COMMENT.post_no IS '블로그 게시글 번호';
COMMENT ON COLUMN USER_CART.user_cart_no IS '찜 번호';
COMMENT ON COLUMN USER_CART.user_id IS '회원ID';
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
COMMENT ON COLUMN USER_REWARD_HISTORY.user_reward_no IS '유저 포인트 리스트의 번호';
COMMENT ON COLUMN USER_REWARD_HISTORY.book_reward_minus IS '책 포인트';
COMMENT ON COLUMN USER_REWARD_HISTORY.user_id IS '회원ID';
COMMENT ON COLUMN USER_TRANSFER.order_no IS '주문번호';
COMMENT ON COLUMN USER_TRANSFER.user_transfer_name IS '수신인';
COMMENT ON COLUMN USER_TRANSFER.user_transfer_phone IS '수신자 전화번호';
COMMENT ON COLUMN USER_TRANSFER.user_transter_address IS '수신인 주소';
COMMENT ON COLUMN USER_WISH.user_wish_no IS 'user_wish 식별';
COMMENT ON COLUMN USER_WISH.user_id IS '회원ID';
COMMENT ON COLUMN USER_WISHLIST.book_title IS '책제목';
COMMENT ON COLUMN USER_WISHLIST.user_id IS '회원ID';
COMMENT ON COLUMN USER_WISHLIST.book_isbn IS '책 인덱스
';
COMMENT ON COLUMN USER_WISHLIST.user_wish_no IS 'user_wish 식별';



