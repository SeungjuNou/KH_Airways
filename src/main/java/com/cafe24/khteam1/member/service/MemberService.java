package com.cafe24.khteam1.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;



public interface MemberService {

	List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception;
 
	List<Map<String, Object>> findMemberList(Map<String, Object> map) throws Exception;
	
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> viewMember(Map<String, Object> map) throws Exception;
	
	void updateMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
 
	void deleteMember(Map<String, Object> map) throws Exception;
	
	String checkId(Map<String, Object> map) throws Exception;

	Map<String, Object> loginCheck(Map<String, Object> map) throws Exception;

	
	
}
