package com.cafe24.khteam1.webcheck;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.khteam1.book.service.BookService;
import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.flight.service.FlightService;
import com.cafe24.khteam1.route.service.RouteService;
import com.cafe24.khteam1.ticket.service.TicketService;
import com.cafe24.khteam1.webcheck.service.WebcheckService;

@Controller
@SessionAttributes("webcheckInfo")
public class WebCheckController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "webcheckService")
	private WebcheckService webcheckService;

	@Resource(name = "bookService")
	private BookService bookService;
	
	@Resource(name = "flightService")
	private FlightService flightService;
	
	@Resource(name = "routeService")
	private RouteService routeService;

	@Resource(name = "ticketService")
	private TicketService ticketService;

	@ModelAttribute("webcheckInfo")
	private Map<String, Object> map() {
		return new HashMap<String, Object>();
	}

	@RequestMapping(value = "/webcheck/checkinList.do") // 체크인 현황(리스트)를 불러오는
	public ModelAndView checkinList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/webCheck/checkinList");
		List<Map<String, Object>> list = webcheckService.checkinList(commandMap);
		mv.addObject("list", list);
		return mv;
	}

	// 체크인 창(체크인 main form) 띄우는 메소드
	@RequestMapping(value = "/webcheck/openCheckin.do")
	public ModelAndView openCheckin(@ModelAttribute("webcheckInfo") Map<String, Object> map,CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/webCheck/openWebCheck");
		
		String MEM_ID = (String) request.getSession().getAttribute("ID"); 
		map.put("MEM_ID", MEM_ID);
		List<Map<String,Object>> result = bookService.memberWbBookList(map);
		
		mv.addObject("result", result);
		return mv;
	}

	@RequestMapping(value = "/webcheck/webCheckStep1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView webCheckStep1(@ModelAttribute("webcheckInfo") Map<String, Object> map, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView("/webCheck/webCheckStep1");
		
		Map<String, Object> book = bookService.bookDetail(commandMap.getMap());
		List<Map<String, Object>> ticket = ticketService.TKlistByBKno(commandMap.getMap());
		
		for(int i =0; i <ticket.size(); i++) {
			Map<String, Object> tk = ticket.get(i);
			map.put("TK_NO", tk.get("TK_NO"));
			
		}
		
		map.putAll(bookService.bookDetail(commandMap.getMap()));

		mv.addObject("book", book);
		mv.addObject("ticket", ticket); 
		mv.addObject("map", map);
		
		return mv;
	}

	@RequestMapping(value = "/webcheck/webCheckStep2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView webCheckStep2(@ModelAttribute("webcheckInfo") Map<String, Object> map, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView("/webCheck/webCheckStep2");
		map.putAll(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	
	@RequestMapping(value = "/webcheck/webCheckStep3.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView webCheckStep3(@ModelAttribute("webcheckInfo") Map<String, Object> map, CommandMap commandMap)
			throws Exception { 
		ModelAndView mv = new ModelAndView("/webCheck/webCheckStep3");
		
		log.debug(map);
		log.debug("step3333333" + map);
		map.putAll(commandMap.getMap());
		
		Map<String, Object> flight = flightService.flightDetail(map);
		String seat = (String) flight.get("BOOK_SEAT");
		String seat2 = (String) commandMap.getMap().get("seat");
		String strResult = seat + seat2;
		map.put("result", strResult);
		flightService.seatUpdate(map, null);
		
		int round =  Integer.parseInt((String) map.get("COUNT"));
		
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		
		String[] map2 = seat2.split(",");
		
		for (int i = 0; i < round; i++) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("BP_NO", "BP"+ dateRandom());
			result.put("BOOK_NO", map.get("BOOK_NO"));
			result.put("TICKET_NO", (String) map.get("TK_NO"+i));
			result.put("EN_NAME", (String)map.get("EN_NAME"+i));
			result.put("PP_NO", (String)map.get("PP_NO"+i));
			result.put("PP_EXP", (String)map.get("PP_EXP"+i));
			result.put("PP_BIRTH", (String)map.get("PP_BIRTH"+i));
			result.put("SEAT", map2[i]);
			webcheckService.insertWebcheck(result);
			resultList.add(result);
		}
		
		map.put("WB_CHECK", "Y");
		bookService.updateWbCheck(map);

		mv.addObject("result", resultList);
		mv.addObject("map", map);
		return mv;
	} 
	
	
	
	@RequestMapping(value = "/webcheck/bpPdf.do")
	public ModelAndView bpPdf(@ModelAttribute("webcheckInfo") Map<String, Object> map,CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("pdf/bpPdf");
		
		log.debug(commandMap.getMap());
		map.put("BOOK_NO", commandMap.getMap().get("name"));
		map.put("name", commandMap.getMap().get("tk_no"));
		
		Map<String, Object> bookMap = bookService.bookDetail(map);
		Map<String, Object> ticketMap = ticketService.ticketDetail(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		map2.put("DEP_CODE", bookMap.get("DEP_CODE"));
		Map<String, Object> flightMap = flightService.flightDetail(map2);
		Map<String, Object> depMap = routeService.selectRouteDetail(flightMap);
		 
		map2.put("DEP_CODE", bookMap.get("ARR_CODE"));
		Map<String, Object> flightMap2 = flightService.flightDetail(map2);
		Map<String, Object> arrMap = routeService.selectRouteDetail(flightMap2);
		
		Map<String, Object> checkin = webcheckService.viewCheckin(bookMap);
		
		mv.addObject("checkin", checkin);
		mv.addObject("dep", flightMap);
		mv.addObject("arr", flightMap2);
		mv.addObject("depMap", depMap);
		mv.addObject("arrMap", arrMap);
		mv.addObject("ticketMap", ticketMap);
		mv.addObject("bookMap",bookMap); 
		return mv; 
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/webcheck/seatCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public List<String> seatCheck(@ModelAttribute("webcheckInfo") Map<String, Object> map, CommandMap commandMap)
			throws Exception {
		
		Map<String, Object> flight = flightService.flightDetail(map);
		
		String str = (String) flight.get("BOOK_SEAT");
	
		String arr[] = str.split(",");
		List<String> list = new ArrayList<String>();
		
		
		for(String str2 : arr) {
			list.add(str2);
		}
		
		return list;
	}
	
	
	public static String dateRandom() {
		String sysDate = new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		int random = (int) (Math.random() * 10000);
		return sysDate + random;
	}
	
	
	

}
