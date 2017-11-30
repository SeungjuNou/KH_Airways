package com.cafe24.khteam1.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;



public interface MemberService {

	//?šŒ?›ë¦¬ìŠ¤?Š¸
	List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception;
 
	//ê²??ƒ‰?šŒ?›ë¦¬ìŠ¤?Š¸ 
	List<Map<String, Object>> findMemberList(Map<String, Object> map) throws Exception;
	
	//?šŒ?›ê°??…  
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//?šŒ?›? •ë³? ë³´ê¸°
	Map<String, Object> viewMember(Map<String, Object> map) throws Exception;
	
	//?šŒ?›? •ë³? ?ˆ˜? • 
	void updateMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
 
	//?šŒ?›?ƒˆ?‡´
	void deleteMember(Map<String, Object> map) throws Exception;

}
