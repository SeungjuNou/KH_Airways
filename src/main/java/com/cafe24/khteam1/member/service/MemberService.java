package com.cafe24.khteam1.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;



public interface MemberService {
	//회원목록
	List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> memberGradeList(Map<String, Object> map) throws Exception;
	
	//회원검색목록
	List<Map<String, Object>> findMemberList(Map<String, Object> map) throws Exception;
	
	//회원가입
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	//회원정보
	Map<String, Object> viewMember(Map<String, Object> map) throws Exception;
	
	//회원수정
	void updateMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	//회원삭제
	void deleteMember(Map<String, Object> map) throws Exception;
	
	//아이디중복체크
	String checkId(Map<String, Object> map) throws Exception;
	
	//로그인체크
	Map<String, Object> loginCheck(Map<String, Object> map) throws Exception;

	void updateGrade(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
}
