package com.cafe24.khteam1.miles.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MilesService {
	
		//마일리지 리스트
		List<Map<String, Object>> milesList(Map<String, Object> map) throws Exception;
		
		//마일리지 내역 등록 
		void insertMiles(Map<String, Object> map, HttpServletRequest request) throws Exception;
		
		//마일리지 내역 수정
		void updateMiles(Map<String, Object> map, HttpServletRequest request) throws Exception;
		
		//마일리지회원관리
		List<Map<String, Object>> milesManage(Map<String, Object> map) throws Exception;
		
		//현재 마일리지
		Map<String, Object> nowMile(Map<String, Object> map) throws Exception;
		
		//사용 마일리지
		void useMile(Map<String, Object> map) throws Exception;
		
		void saveMile(Map<String, Object> map) throws Exception;
}
