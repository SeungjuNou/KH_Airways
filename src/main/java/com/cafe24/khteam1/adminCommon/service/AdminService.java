package com.cafe24.khteam1.adminCommon.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	Map<String, Object> selectToday(Map<String, Object> map) throws Exception; 
	
	List<Map<String, Object>> selectWeek(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectMonth(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectMoney(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectMen(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectWomen(Map<String, Object> map) throws Exception;
	
	Map<String, Object> seatCount(Map<String, Object> map) throws Exception;
	
	Map<String, Object> seatCountCheck(Map<String, Object> map) throws Exception;
}



