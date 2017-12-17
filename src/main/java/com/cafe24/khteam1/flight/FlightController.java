package com.cafe24.khteam1.flight;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.common.util.DateTrans;
import com.cafe24.khteam1.flight.service.FlightService;
import com.cafe24.khteam1.route.service.RouteService;

@Controller
public class FlightController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="flightService")
	private FlightService flightService;
	
	@Resource(name="routeService")
    private RouteService routeService;
	
	@Resource(name="dateTrans")
	private DateTrans dateTrans;

	
	//flight 등록 페이지 이동
	@RequestMapping(value="/admin/flightRegFrom.do")
	public ModelAndView flightRegFrom() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> rourte = routeService.selectRouteList();
		
		mv.addObject("rourte", rourte);
		mv.setViewName("/admin/adminFlightReg");
		return mv;
	}
	
	//flight 입력
	@RequestMapping(value="/admin/flightReg.do",  method=RequestMethod.POST)
	public ModelAndView flightReg(CommandMap commandMap) throws Exception {
		Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse((String) commandMap.get("DEP_DATE1"));
		Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse((String) commandMap.get("DEP_DATE2"));
		
		//날짜 차이 구하기
		int count = dateTrans.DateCount(date1, date2);
		
		//
		for(int i=0; i<=count; i++) {
			commandMap.put("DEP_DATE1", dateTrans.DateAdd(date1, i));//날짜 변경(더하기)
			flightService.insertFlight(commandMap.getMap());
			System.out.println(commandMap.getMap());
		}
		
		return new ModelAndView("redirect:/admin/flightRegFrom.do");
	}
	
	//관리자 FlightList
	@RequestMapping(value="/admin/flightAdminList.do")
	public ModelAndView flightAdminList() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> flightList = flightService.flightAllList();
		mv.addObject("flightList", flightList);
		mv.setViewName("/admin/adminFlightList");
		return mv;
	}
	
	//관리자 FlightList 검색
	@RequestMapping(value="flightAdminSearch.do")
	public ModelAndView flightSearchList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> flightList = new ArrayList<Map<String,Object>>(); 	
		
		//검색 타입 설정
		if(commandMap.get("type").equals("1")) {
			commandMap.put("ITI_NO", commandMap.get("search"));
		} else {
			commandMap.put("CODE", commandMap.get("search"));
		}		
		
		//날짜 검색시 변경
		Date date1 = null;
		Date date2 = null;
		if(commandMap.get("DEP_DATE1") != "")
			date1 = new SimpleDateFormat("yyyy-MM-dd").parse((String) commandMap.get("DEP_DATE1"));
		if(commandMap.get("DEP_DATE2") != "")
			date2 = new SimpleDateFormat("yyyy-MM-dd").parse((String) commandMap.get("DEP_DATE2"));
		
		//날짜 차이 구하기
		int count = 0;
		if(date2 != null)
			count = dateTrans.DateCount(date1, date2);
		
		for(int i=0; i<=count; i++) {
			if(date1 != null) {
				commandMap.put("DEP_DATE1", dateTrans.DateAdd(date1, i));//날짜 변경(더하기)	
			}
			flightList.addAll(flightService.flightSearchList(commandMap.getMap()));//검색
		}
		
		mv.setViewName("/admin/adminFlightList");
		mv.addObject("flightList", flightList);
		return mv;
	}
}
