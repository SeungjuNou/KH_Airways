package com.cafe24.khteam1.book.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TicketService {

	//?•­ê³µê¶Œë¦¬ìŠ¤?Š¸
	List<Map<String, Object>> ticketList(Map<String, Object> map) throws Exception;

	//?˜ˆ?•½ë³? ?•­ê³µê¶Œ ë¦¬ìŠ¤?Š¸
	List<Map<String, Object>> memberTicketList(Map<String, Object> map) throws Exception;
	
	//?•­ê³µê¶Œ ?°?´?„° ?‚½?… 
	void insertTicket(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//?•­ê³µê¶Œ ?ƒ?„¸ë³´ê¸°
	Map<String, Object> viewTicket(Map<String, Object> map) throws Exception;
	
	//?•­ê³µê¶Œ ?ˆ˜? • (?˜¹?‹œëª°ë¼..)
	void updateTicket(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//?•­ê³µê¶Œ ì·¨ì†Œ (?˜¹?‹œëª°ë¼..)
	void deleteTicket(Map<String, Object> map) throws Exception;
}
