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

}

 