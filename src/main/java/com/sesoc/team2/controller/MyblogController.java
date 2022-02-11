package com.sesoc.team2.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//게시글 쓰기, 게시글 읽기, 팔로우 리스트
@Controller
@RequestMapping("myBlog")
public class MyblogController {
	private static final Logger logger = LoggerFactory.getLogger(MyblogController.class);
	
	//개인블로그의 메인 (글 목록 나열)(개인 정보 나열)(친구목록)
	//(글 목록 나열) - 제목, 한줄, 날짜, 조회수 ??
	//(개인정보 나열에 - 세션의 사진, 세션의 회원등급, 회원의 팔로우 수)
	//(친구목록 나열에 - 세션으로 친구를 불러오는데 그 친구의 이름, 아이디)
	
	//글쓰기 페이지로 이동
	//게시글 작성(저장)
	//게시글 읽기(전체 페이지, 1개 불러오기)
	//게시글 삭제
	
	//쪽지로 이동
		@RequestMapping(value = "messageWindow", method = RequestMethod.GET)
		public String messageWindow() {
			return "myblog/messageWindow";
		}
	
	//댓글 작성(저장, 등록)
	//댓글 좋아요
	//댓글 삭제 (글을 쓴 사람만 지울 수 잇음, 블로그의 주인이 아니야, 주인도 바꿀 수 있게 할 것인가)
	
	//팔로우하기
	//팔로우취소(한번 더 누르면?)- 누르기 전에는 팔로잉이라고 뜨기
	
	
}
