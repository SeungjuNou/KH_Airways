package com.cafe24.khteam1.book.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface BookService {
 
	//예약테이블 삽입 
	void insertBook(Map<String, Object> map) throws Exception;

	//예약리스트
	List<Map<String, Object>> bookList() throws Exception;

	/*//개인 예약 리스트  
	Map<String, Object> memberBookList(Map<String, Object> map) throws Exception;*/
	
	//예약 상세보기-예약번호에 따른 티켓번호 보기
	Map<String, Object> bookDetail(Map<String, Object> map) throws Exception;
	
	//예약수동등록
	void bookWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	//예약 수정 (혹시몰라..)
	void bookUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//예약 취소 (혹시몰라..)
	void bookDelete(Map<String, Object> map, HttpServletRequest request) throws Exception;

}
