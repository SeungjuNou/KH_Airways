package com.cafe24.khteam1.ticket.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TicketService {

	/*//항공권리스트
	List<Map<String, Object>> ticketList(Map<String, Object> map) throws Exception;

	//개인별 항공권 리스트
	List<Map<String, Object>> memberTicketList(Map<String, Object> map) throws Exception;*/
	
	//예약목록에서 항공권리스트 띄우기
	List<Map<String, Object>> TKlistByBKno(Map<String, Object> map) throws Exception;
	
	//항공권 생성
	void insertTicket(Map<String, Object> map) throws Exception;
	/*
	//항공권 상세보기
	Map<String, Object> viewTicket(Map<String, Object> map) throws Exception;
	
	//항공권 수정(혹시 몰라..)
	void updateTicket(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//항공권 취소(혹시 몰라..)
	void deleteTicket(Map<String, Object> map) throws Exception;*/
}
