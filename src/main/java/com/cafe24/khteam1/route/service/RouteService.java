package com.cafe24.khteam1.route.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface RouteService {

	// PDF
	List<Map<String, Object>> pdfRouteList(Map<String, Object> map) throws Exception;
	
	// 회원리스트
	List<Map<String, Object>> depRouteList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> arrRouteList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectRouteList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectRouteDeactList(Map<String, Object> map) throws Exception;

	void insertRoute(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectRouteDetail(Map<String, Object> map) throws Exception;

	void updateRoute(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteRoute(Map<String, Object> map) throws Exception;

}
