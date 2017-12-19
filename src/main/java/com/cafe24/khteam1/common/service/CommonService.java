package com.cafe24.khteam1.common.service;

import java.util.Map;

public interface CommonService {
	
	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectFile(Map<String, Object> map) throws Exception;
	
	void insertFile(Map<String, Object> map) throws Exception;

}
