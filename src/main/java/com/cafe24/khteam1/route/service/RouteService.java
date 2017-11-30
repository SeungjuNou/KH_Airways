package com.cafe24.khteam1.route.service;

import java.util.List;
import java.util.Map;



public interface RouteService {

	//회원리스트
	List<Map<String, Object>> depRouteList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> arrRouteList(Map<String, Object> map) throws Exception;

}
