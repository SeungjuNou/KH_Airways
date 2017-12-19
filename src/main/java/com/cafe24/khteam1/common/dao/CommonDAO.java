package com.cafe24.khteam1.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository("commonDAO")
public class CommonDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>)selectOne("common.selectFileInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFile(Map<String, Object> map) throws Exception{
		System.out.println(map);
	    return (Map<String, Object>) selectOne("common.selectFile", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception{
	    insert("common.insertFile", map);
	}
 
}


