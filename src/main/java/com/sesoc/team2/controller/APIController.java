package com.sesoc.team2.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.team2.dao.apiDAO;
import com.sesoc.team2.vo.API;

@Controller
public class APIController<BookDB> {
	private static final Logger logger = LoggerFactory.getLogger(APIController.class);
	
	@Autowired
	apiDAO dao;
	

	//이미지 파일 저장 경로 (서버의 절대경로)
	final String dir = "/bookimage/"; //경로 바꿀것!
	
	//카카오 책 API 요청 페이지로 이동
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String home() throws Exception {
		
		return "book/searchPage";
	}

	
	//카카오로부터 받은 책 정보를 하나씩 DB에 저장
		@ResponseBody
		@RequestMapping(value = "/book/insert_db", method = RequestMethod.POST)
		public void insert_db(API api) throws Exception {
			logger.info("전달된 값 >>> {}", api);
			
			String filename = imageSave(api.getBook_image(), api.getBook_isbn()); 
			
			if (filename != null) {
				api.setBook_image(filename);
			}
			int result = dao.insert_db(api);
			
			if (result == 0) {
				logger.info("저장실패 === {}", api);
			}
		}
		
		//전달받은 이미지 파일의 URL로부터 파일 저장
		private String imageSave(String book_image, String book_isbn) {
			//파일경로가 없으면 null 리턴
			if (book_image == null || book_image.isEmpty()) {
				return null;
			}
			
			//저장 폴더가 없으면 생성
			File path = new File(dir);
			if (!path.isDirectory()) {
				path.mkdirs();
			}
			
			//저장할 파일명 (ISBN에서 공백제거)
			String filename = book_isbn.trim().replaceAll(" ", "") + ".jpg";
			
			
			try {
				URL url = new URL(book_image);
				HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
				InputStream in = con.getInputStream();
				
				FileOutputStream out = new FileOutputStream(dir + filename);
				
				FileCopyUtils.copy(in, out);
			}
			catch (Exception e) {
				e.printStackTrace();
				return null;
			}
			return filename;
		}
		
		//책 정보 출력 예
		@RequestMapping(value = "/view", method = RequestMethod.GET)
		public String view(Model model) {
			//테스트 하기 위한 임시 코드임. 아래 정보 DB에서 불러오는 것으로 수정할 것
			API api = new API();
			api.setBook_author("book_author");
			api.setBook_title("book_title");
			//보여줄 이미지 파일명 (실제 /bookimage 폴더에 있는 파일명으로 테스트
			api.setBook_image("book_image");
			
			model.addAttribute("api", api);
			return "bookInfo";
		}

		//이미지파일 다운로드
		@RequestMapping(value = "download", method = RequestMethod.GET)
		public String fileDownload(String filename, HttpServletResponse response) {
			
			try {
				response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(filename, "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			//저장된 파일 경로
			String fullPath = dir + filename;
			
			//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
			FileInputStream filein = null;
			ServletOutputStream fileout = null;
			
			try {
				filein = new FileInputStream(fullPath);
				fileout = response.getOutputStream();
				
				//Spring의 파일 관련 유틸 이용하여 출력
				FileCopyUtils.copy(filein, fileout);
				
				filein.close();
				fileout.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

			return null;
		}


}
