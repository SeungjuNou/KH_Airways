package com.cafe24.khteam1.route.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cafe24.khteam1.route.dao.RouteDAO;

@Service("routeService")
public class RouteServiceImpl implements RouteService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "routeDAO")
	private RouteDAO routeDAO;
	
	//PDF
	@Override
	public List<Map<String, Object>> pdfRouteList(Map<String, Object> map) throws Exception {
		return routeDAO.pdfRouteList(map);
	}

	@Override
	public List<Map<String, Object>> depRouteList(Map<String, Object> map) throws Exception {
		
		return routeDAO.depRouteList(map);

	}

	@Override
	public List<Map<String, Object>> arrRouteList(Map<String, Object> map) throws Exception {
		
		return routeDAO.arrRouteList(map);

	}

	
	@Override
	public List<Map<String, Object>> selectRouteList(Map<String, Object> map) throws Exception {
	    return routeDAO.selectRouteList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectRouteDeactList(Map<String, Object> map) throws Exception {
	    return routeDAO.selectRouteDeactList(map);
	}

	@Override
	public void insertRoute(Map<String, Object> map, HttpServletRequest request) throws Exception {
	       
		routeDAO.insertRoute(map);
	}
	
	@Override
	public Map<String, Object> selectRouteDetail(Map<String, Object> map) throws Exception {
		   
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = routeDAO.selectRouteDetail(map);
		resultMap.put("map", tempMap);
		        
		System.out.println(resultMap); 
		return resultMap;
	}
	
	@Override
	public void updateRoute(Map<String, Object> map, HttpServletRequest request) throws Exception{
		routeDAO.updateRoute(map);
	}
	
	@Override
	public void deleteRoute(Map<String, Object> map) throws Exception {
		routeDAO.deleteRoute(map);
	}


}
