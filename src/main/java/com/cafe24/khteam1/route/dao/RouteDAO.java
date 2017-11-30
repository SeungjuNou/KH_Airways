package com.cafe24.khteam1.route.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;
 
@Repository
public class RouteDAO extends AbstractDAO{
  
	@SuppressWarnings("unchecked") 
	public List<Map<String, Object>> depRouteList(Map<String, Object> map) throws Exception{
	    return (List<Map<String, Object>>)selectPagingList("route.depRouteList", map);
	}

	@SuppressWarnings("unchecked") 
	public List<Map<String, Object>> arrRouteList(Map<String, Object> map) throws Exception{
	    return (List<Map<String, Object>>)selectPagingList("route.arrRouteList", map);
	}

}

 