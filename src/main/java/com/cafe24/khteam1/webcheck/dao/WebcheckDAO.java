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
	
	
	
	
	public void insertWebcheck(Map<String, Object> map) throws Exception {
		insert("webcheck.insertWebcheck", map);
	}
	

	@SuppressWarnings("unchecked")
	public Map<String, Object> viewCheckin(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("webcheck.viewCheckin", map);
	}
	
	
}
