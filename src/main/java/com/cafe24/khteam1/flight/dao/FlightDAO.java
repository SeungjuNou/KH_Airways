package com.cafe24.khteam1.flight.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;
 
@Repository
public class FlightDAO extends AbstractDAO{


    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectFlightList(Map<String, Object> map) {
        return selectList("flight.flightList", map);
    }
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectFlightList2(Map<String, Object> map) {
        return selectList("flight.flightList2", map);
    }

    //flight등록
  	public void insertFlight(Map<String, Object> map) {
  		insert("flight.insertFlight", map);
  	}
  	
  	//전체 flight 리스트 불러오기
  	@SuppressWarnings("unchecked")
  	public List<Map<String, Object>> flightAllList() {
  		return (List<Map<String,Object>>) selectList("flight.flightAllList");
  	}
  	
  	//flight 검색 리스트
  	@SuppressWarnings("unchecked")
  	public List<Map<String, Object>> flightSearchList(Map<String, Object> map) {
  		return (List<Map<String, Object>>) selectList("flight.flightSearchList", map);
  	}
}

 