package com.cafe24.khteam1.webcheck.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cafe24.khteam1.common.common.CommandMap;

public interface WebcheckService {

		List<Map<String, Object>> checkinList(Map<String, Object> map) throws Exception;

		//체크?��?��?�� 리스?�
		/*List<Map<String, Object>> checkinList(Map<String, Object> map) throws Exception;*/

		/*//?��?�� ?��?�� ?��?�� 리스?�� 
		List<Map<String, Object>> findCheckinList(Map<String, Object> map) throws Exception;*/
		
		//체크인 내역 저장
		/*void insertCheckin(Map<String, Object> map, HttpServletRequest request) throws Exception;*/

		/*//체크?�� ?��?��보기 ?��걸로 (pdf)?��?��?��?�� �??��?��?��?��. 
		Map<String, Object> viewCheckin(Map<String, Object> map) throws Exception;
		
		//체크?��?���? ?��?��.
		void updateCheckin(Map<String, Object> map, HttpServletRequest request) throws Exception;

		//체크?��?���? ?��?��.
		void deleteCheckin(Map<String, Object> map) throws Exception;*/
}
