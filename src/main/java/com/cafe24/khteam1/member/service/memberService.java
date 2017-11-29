package com.cafe24.khteam1.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;



public interface MemberService {

	//회원리스트
	List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception;
 
	//검색회원리스트 
	List<Map<String, Object>> findMemberList(Map<String, Object> map) throws Exception;
	
	//회원가입  
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//회원정보 보기
	Map<String, Object> viewMember(Map<String, Object> map) throws Exception;
	
	//회원정보 수정 
	void updateMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
 
	//회원탈퇴
	void deleteMember(Map<String, Object> map) throws Exception;

}
