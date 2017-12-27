package com.cafe24.khteam1.pp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface PpService {

	List<Map<String, Object>> adminUnapprovedList(Map<String, Object> map) throws Exception;

	void ppModify(Map<String, Object> map, HttpServletRequest request)throws Exception;

	List<Map<String, Object>> adminApprovedList(Map<String, Object> map)throws Exception;

	void ppModifyApplyBoard(Map<String, Object> map, HttpServletRequest request)throws Exception;

	List<Map<String, Object>> ppModifyApplyList(Map<String, Object> map) throws Exception;

	Map<String, Object> ppModifyApplyView(Map<String, Object> map) throws Exception;
		
	}

