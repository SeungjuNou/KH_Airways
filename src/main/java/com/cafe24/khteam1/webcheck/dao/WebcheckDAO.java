package com.cafe24.khteam1.webcheck.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;

@Repository
public class WebcheckDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> checkinList(Map<String, Object> map)throws Exception {
		return (List<Map<String, Object>>) selectList("webcheck.checkinList", map);
	}
	
	
	
	
	/*public void insertWebcheck(Map<String, Object> map) throws Exception {
		insert("book.insertWebcheck", map);
	}*/
	
	
	/*bookDAO
	public Map<String, Object> viewBook(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = bookDAO.viewBook(map);
		return resultMap;
	}*/
	
	
}
