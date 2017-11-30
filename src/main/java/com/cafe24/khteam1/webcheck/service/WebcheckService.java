package com.cafe24.khteam1.webcheck.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface WebcheckService {

		//ì²´í¬?¸?˜„?™© ë¦¬ìŠ¤?Š¸ 
		List<Map<String, Object>> checkinList(Map<String, Object> map) throws Exception;

		//?Š¹? • ?šŒ?› ?˜„?™© ë¦¬ìŠ¤?Š¸ 
		List<Map<String, Object>> findCheckinList(Map<String, Object> map) throws Exception;
		
		//ì²´í¬?¸ ?°?´?„° ?…
		void insertCheckin(Map<String, Object> map, HttpServletRequest request) throws Exception;

		//ì²´í¬?¸ ?ƒ?„¸ë³´ê¸° ?´ê±¸ë¡œ (pdf)?‘?„±?•´?„ ê°??Š¥?•©?‹ˆ?‹¤. 
		Map<String, Object> viewCheckin(Map<String, Object> map) throws Exception;
		
		//ì²´í¬?¸? •ë³? ?ˆ˜? •.
		void updateCheckin(Map<String, Object> map, HttpServletRequest request) throws Exception;

		//ì²´í¬?¸? •ë³? ?‚­? œ.
		void deleteCheckin(Map<String, Object> map) throws Exception;
}
