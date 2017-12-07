package com.cafe24.khteam1.book;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.flight.service.FlightService;
import com.cafe24.khteam1.route.service.RouteService;
 
@Controller
@SessionAttributes("flightInfo") 
public class BookController {
    Logger log = Logger.getLogger(this.getClass());
      
    @Resource(name="routeService")
    private RouteService routeService;

    @Resource(name="flightService")
    private FlightService flightService;

    @ModelAttribute("flightInfo")
    private Map<String, Object> map() {
        return new HashMap<String, Object>();
    }

    //항공 조회 정보(노선, 날짜, 인원) 저장후 페이지 이동
    @RequestMapping(value="/book/flightSearch.do", method=RequestMethod.POST)
    public ModelAndView flightSearch(@ModelAttribute("flightInfo") Map<String, Object> map, CommandMap commandMap) {
        map.putAll(commandMap.getMap());
        return new ModelAndView("/book/selectFlight");
    }


    //ajax
    //항공 조회(왕복)
    @ResponseBody
    @RequestMapping(value="/book/flightList.do")
    public Map<String, Object> flightList(@ModelAttribute("flightInfo") HashMap<String, Object> map, CommandMap commandMap) throws Exception {
        
        log.debug("test");    
        Map<String, Object> map2 = new HashMap<String, Object>();
        
        if(commandMap.get("TI_DEP1") != null) {
            map2.put("TI_DEP1", commandMap.get("TI_DEP1"));
        }
        if(commandMap.get("TI_DEP2") != null) {
            map2.put("TI_DEP2", commandMap.get("TI_DEP2"));
        }
        
        //항공편 조회 리스트(출국, 귀국)
        List<Map<String, Object>> list1 = flightService.flightList(map2);
        List<Map<String, Object>> list2 = flightService.flightList2(map2);
        
        //날짜 버튼 설정(출국, 귀국)
        Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse((String) map2.get("TI_DEP1"));
        Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse((String) map2.get("TI_DEP2"));
        
        List<String> dateButton1 = dateButton(date1);
        List<String> dateButton2 = dateButton(date2);
        System.out.println(dateButton1);

        //항공편 조회 리스트, 날짜 버튼리스트 담아서 보내기
        Map<String, Object> flightList = new HashMap<String, Object>();
        flightList.put("list1", list1);
        flightList.put("list2", list2);
        flightList.put("date1", dateButton1);
        flightList.put("date2", dateButton2);
        
        return flightList;
    }


    //dateButton 리스트 메소드
    public List<String> dateButton(Date date) {
        List<String> dList = new ArrayList<String>();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
    
        for(int i=-2; i<3; i++) {
            cal.setTime(date);
            cal.add(Calendar.DATE, i);
            String datefo = df.format(cal.getTime());
            dList.add(datefo);
        }
        
        return dList; 
    }
    


} 
 