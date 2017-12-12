package com.cafe24.khteam1.miles.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;

@Repository
public class MilesDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> milesList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("miles.milesList", map);
	}

	public void insertMiles(Map<String, Object> map) throws Exception {
		insert("miles.insertMiles", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> milesManage(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("miles.milesManage", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> milesNow(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("miles.milesNow", map);
	}
	
	
	
	
}