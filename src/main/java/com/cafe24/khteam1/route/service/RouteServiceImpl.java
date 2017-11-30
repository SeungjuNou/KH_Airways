package com.cafe24.khteam1.route.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cafe24.khteam1.route.dao.RouteDAO;

@Service("routeService")
public class RouteServiceImpl implements RouteService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "routeDAO")
	private RouteDAO routeDAO;

	@Override
	public List<Map<String, Object>> depRouteList(Map<String, Object> map) throws Exception {
		
		return routeDAO.depRouteList(map);

	}

	@Override
	public List<Map<String, Object>> arrRouteList(Map<String, Object> map) throws Exception {
		
		return routeDAO.arrRouteList(map);

	}

	

}
