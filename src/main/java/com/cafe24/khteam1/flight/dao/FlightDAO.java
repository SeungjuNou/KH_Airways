package com.cafe24.khteam1.flight.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;
 
@Repository
public class FlightDAO extends AbstractDAO{
 
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> filghtList(Map<String, Object> map) throws Exception{
	    return (List<Map<String, Object>>)selectPagingList("flight.filghtList", map);
	}
	
    public void insertFlight(Map<String, Object> map) throws Exception{
        insert("flight.insertFlight", map);
    } 

    @SuppressWarnings("unchecked")
    public Map<String, Object> flightDetail(Map<String, Object> map) throws Exception{
        return (Map<String, Object>) selectOne("flight.flightDetail", map);
    }
    
    public void updateFlight(Map<String, Object> map) throws Exception{
        update("flight.updateFlight", map);
    }
    
    public void deleteFlight(Map<String, Object> map) throws Exception{
        update("flight.deleteFlight", map);
    }

}

 