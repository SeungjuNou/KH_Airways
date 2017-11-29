package com.cafe24.khteam1.webcheck.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface WebcheckService {

		//체크인현황 리스트 
		List<Map<String, Object>> checkinList(Map<String, Object> map) throws Exception;

		//특정 회원 현황 리스트 
		List<Map<String, Object>> findCheckinList(Map<String, Object> map) throws Exception;
		
		//체크인 데이터 입
		void insertCheckin(Map<String, Object> map, HttpServletRequest request) throws Exception;

		//체크인 상세보기 이걸로 (pdf)작성해도 가능합니다. 
		Map<String, Object> viewCheckin(Map<String, Object> map) throws Exception;
		
		//체크인정보 수정.
		void updateCheckin(Map<String, Object> map, HttpServletRequest request) throws Exception;

		//체크인정보 삭제.
		void deleteCheckin(Map<String, Object> map) throws Exception;
}
