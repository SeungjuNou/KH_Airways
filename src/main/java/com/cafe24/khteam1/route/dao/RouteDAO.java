package com.cafe24.khteam1.route.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;

@Repository
public class RouteDAO extends AbstractDAO {
	 
	//PDF
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> pdfRouteList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("route.pdfRouteList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> depRouteList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("route.depRouteList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> arrRouteList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("route.arrRouteList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRouteList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("route.selectRouteList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRouteDeactList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("route.selectRouteDeactList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRouteNo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("route.selectRouteNo",map);
	}

	public void insertRoute(Map<String, Object> map) throws Exception {
		insert("route.insertRoute", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRouteDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("route.selectRouteDetail", map);
	}

	public void updateRoute(Map<String, Object> map) throws Exception {
		update("route.updateRoute", map);
	}

	public void deleteRoute(Map<String, Object> map) throws Exception {
		update("route.deleteRoute", map);
	}

	//flight등록 페이지(select)에 들어갈 노선 정보
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRouteInfoList() throws Exception {
		return selectList("route.selectRouteInfoList");
	}
}
