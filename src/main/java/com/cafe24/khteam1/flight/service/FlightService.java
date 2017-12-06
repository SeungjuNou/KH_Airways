package com.cafe24.khteam1.flight.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FlightService {
 
	List<Map<String, Object>> flightList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> flightList2(Map<String, Object> map) throws Exception;
	
	void insertFlight(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> flightDetail(Map<String, Object> map) throws Exception;
	
	void updateFlight(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteFlight(Map<String, Object> map) throws Exception;
	
	
}
