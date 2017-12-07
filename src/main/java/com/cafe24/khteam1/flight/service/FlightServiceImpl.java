package com.cafe24.khteam1.flight.service;

  
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cafe24.khteam1.common.util.FileUtils;
import com.cafe24.khteam1.flight.dao.FlightDAO;

@Service("flightService")
public class FlightServiceImpl implements FlightService{
    Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="fileUtils")
    private FileUtils fileUtils; 
    
    @Resource(name="flightDAO")
    private FlightDAO flightDAO;
      
    @Override
    public List<Map<String, Object>> flightList(Map<String, Object> map) {
        return flightDAO.selectFlightList(map);
    }

    @Override
    public List<Map<String, Object>> flightList2(Map<String, Object> map) {
        return flightDAO.selectFlightList2(map);
    }

    @Override
    public void insertFlight(Map<String, Object> map, HttpServletRequest request) throws Exception{
        

    }

    @Override
    public Map<String, Object> flightDetail(Map<String, Object> map) throws Exception{
		return map;
        
    }

	@Override
	public void updateFlight(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		
	}

	@Override
	public void deleteFlight(Map<String, Object> map) throws Exception {
		
	}

	//flight 입력
	@Override
	public void insertFlight(Map<String, Object> map) throws Exception {
		flightDAO.insertFlight(map);
	}

	//관리자 flight
	@Override
	public List<Map<String, Object>> flightAllList() throws Exception {
		return flightDAO.flightAllList();
	}


}
