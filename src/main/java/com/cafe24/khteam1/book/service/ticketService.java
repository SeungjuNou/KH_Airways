package com.cafe24.khteam1.book.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ticketService {

	//항공권리스트
	List<Map<String, Object>> ticketList(Map<String, Object> map) throws Exception;

	//예약별 항공권 리스트
	List<Map<String, Object>> memberTicketList(Map<String, Object> map) throws Exception;
	
	//항공권 데이터 삽입 
	void insertTicket(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//항공권 상세보기
	Map<String, Object> viewTicket(Map<String, Object> map) throws Exception;
	
	//항공권 수정 (혹시몰라..)
	void updateTicket(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//항공권 취소 (혹시몰라..)
	void deleteTicket(Map<String, Object> map) throws Exception;
}
