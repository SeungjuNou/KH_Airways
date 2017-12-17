package com.cafe24.khteam1.adminCommon;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.khteam1.adminCommon.service.AdminService;
import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.common.util.DateTrans;
import com.cafe24.khteam1.common.util.GoogleChartDTO;
import com.google.gson.Gson;

@Controller
public class AdminController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminService")
    private AdminService adminService;
	
	@Resource(name="dateTrans")
	private DateTrans dateTrans;
	
	//남녀비
	@ModelAttribute("chartMaker")
    private GoogleChartDTO chartMaker() {
        return new GoogleChartDTO();
    }
	
	//좌석현황
	@ModelAttribute("chartMaker2")
    private GoogleChartDTO chartMaker2() {
        return new GoogleChartDTO();
    }
	
	@RequestMapping(value="/admin/selectToday.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView selectTodayList(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/admin/adminToday");
        
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("____dd");
        String today = dateFormat.format(date);
        
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("DAY", "____15");
        
        	mv.addObject("salesMap", adminService.selectToday(map));
       
        return mv; 
    }
	
	
	//탑승객 통계현황 
	@ResponseBody
	@RequestMapping(value="/admin/maleFemale.do", produces = "application/text; charset=utf8") 
    public String maleFemale(@ModelAttribute("chartMaker") GoogleChartDTO chartMaker) throws Exception{
		chartMaker.addColumn("SEX", "string");
		chartMaker.addColumn("percent", "number");
		
        chartMaker.createRows(2); 
        
        chartMaker.addCell(0, null, "남성");
        chartMaker.addCell(0, 40, null);
        
        chartMaker.addCell(1, null, "여성");
        chartMaker.addCell(1, 60, null);
        
        
        Gson gson = new Gson();
        String json = gson.toJson(chartMaker.getResult());
        
        log.debug(json);
        return json;
    }
	
	
	
	//탑승객 통계현황 
	@ResponseBody
	@RequestMapping(value="/admin/salesPie.do", produces = "application/text; charset=utf8") 
    public String seatPie(@ModelAttribute("chartMaker2") GoogleChartDTO chartMaker2) throws Exception{
		chartMaker2.addColumn("seat", "string");
		chartMaker2.addColumn("percent", "number");
		
        chartMaker2.createRows(2); 
        
        chartMaker2.addCell(0, null, "남는 좌석");
        chartMaker2.addCell(0, 27, null);
        
        chartMaker2.addCell(1, null, "예약된 좌석");
        chartMaker2.addCell(1, 73, null);
        
        
        Gson gson = new Gson();
        String json = gson.toJson(chartMaker2.getResult());
        
        return json;
    }
    
} 

 


