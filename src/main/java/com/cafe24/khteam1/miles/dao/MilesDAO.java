package com.cafe24.khteam1.miles.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;

@Repository
public class MilesDAO extends AbstractDAO {

	public void insertMiles(Map<String, Object> map) throws Exception {
		insert("miles.insertMiles", map);
	}
}