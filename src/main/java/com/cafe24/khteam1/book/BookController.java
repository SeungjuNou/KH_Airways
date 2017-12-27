package com.cafe24.khteam1.book;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.common.util.KakaoRestApiHelper;
import com.cafe24.khteam1.flight.service.FlightService;
import com.cafe24.khteam1.miles.service.MilesService;
import com.cafe24.khteam1.route.service.RouteService;
import com.cafe24.khteam1.book.service.BookService;
import com.cafe24.khteam1.ticket.service.TicketService;

@Controller
@SessionAttributes("flightInfo")
public class BookController {
	Logger log = Logger.getLogger(this.getClass());

	private static KakaoRestApiHelper apiHelper = new KakaoRestApiHelper();
	
	@Resource(name = "bookService")
	private BookService bookService;

	@Resource(name = "ticketService")
	private TicketService ticketService;

	@Resource(name = "routeService")
	private RouteService routeService;

	@Resource(name = "flightService")
	private FlightService flightService;
	
	@Resource(name = "milesService")
	private MilesService milesService;

	@ModelAttribute("flightInfo")
	private Map<String, Object> map() {
		return new HashMap<String, Object>();
	}

	// 항공 조회 정보(노선, 날짜, 인원) 저장후 페이지 이동
	@RequestMapping(value = "/book/flightSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView flightSearch(@ModelAttribute("flightInfo") Map<String, Object> map, CommandMap commandMap) {
		map.putAll(commandMap.getMap());
		log.debug(map);
		return new ModelAndView("/book/selectFlight");
	}

	// ajax
	// 항공 조회(왕복)
	@ResponseBody
	@RequestMapping(value = "/book/flightList.do")
	public Map<String, Object> flightList(@ModelAttribute("flightInfo") Map<String, Object> map, CommandMap commandMap)
			throws Exception {

		Map<String, Object> map1 = new HashMap<String, Object>();
		Map<String, Object> map2 = routeService.selectRouteNo(map); // 가는편 노선 조회
		Map<String, Object> map3 = map;

		log.debug(map);
		log.debug(commandMap.getMap() + "................////");

		int itiNO = Integer.parseInt(map2.get("ITI_NO").toString());
		itiNO++;

		map.put("ITI_NO1", map2.get("ITI_NO"));
		map.put("ITI_NO2", itiNO);

		map1.put("DEP_DATE", map.get("DEP_DATE1"));
		map1.put("ITI_NO", map2.get("ITI_NO"));
		log.debug(map1);
		List<Map<String, Object>> list1 = flightService.flightList(map1); // 가는 항공편

		map1.put("DEP_DATE", map.get("DEP_DATE2"));
		map1.put("ITI_NO", itiNO);
		List<Map<String, Object>> list2 = flightService.flightList(map1); // 오는 항공편
		Map<String, Object> map4 = routeService.selectRouteDetail(map1); // 오는편 노선 조회

		if (commandMap.getMap().get("DEP_DATE1") != null) {
			map3.put("DEP_DATE1", commandMap.getMap().get("DEP_DATE1"));
		}

		if (commandMap.getMap().get("DEP_DATE2") != null) {
			map3.put("DEP_DATE2", commandMap.getMap().get("DEP_DATE2"));
		}

		// 날짜 버튼 설정(출국, 귀국)
		Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse((String) map3.get("DEP_DATE1"));
		Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse((String) map3.get("DEP_DATE2"));

		List<String> dateButton1 = dateButton(date1);
		List<String> dateButton2 = dateButton(date2);

		log.debug(dateButton1);

		// 항공편 조회 리스트, 날짜 버튼리스트 담아서 보내기
		Map<String, Object> flightList = new HashMap<String, Object>();
		flightList.put("list1", list1);
		flightList.put("list2", list2);
		flightList.put("route", map2);
		flightList.put("route2", map4);
		flightList.put("date1", dateButton1);
		flightList.put("date2", dateButton2);
		return flightList;
	}

	// 승객의 수만큼 탑승자 정보를 입력 받는 메서드.
	@RequestMapping(value = "/book/pgInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView psInfo(@ModelAttribute("flightInfo") Map<String, Object> map, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView("/book/pgInfo");

		Map<String, Object> map2 = new HashMap<String, Object>();
		Map<String, Object> map3 = new HashMap<String, Object>();
		map2.put("ITI_NO", map.get("ITI_NO1"));
		map3.put("ITI_NO", map.get("ITI_NO2"));

		map2 = routeService.selectRouteDetail(map2);
		map3 = routeService.selectRouteDetail(map3);

		int price1 = Integer.parseInt(map2.get("PRICE").toString());
		int price2 = Integer.parseInt(map3.get("PRICE").toString());
		int total_price = price1 + price2;
		List<String> list = new ArrayList<String>();
		int adult = Integer.parseInt((String) (map.get("adult_count")));
		int child = Integer.parseInt((String) (map.get("child_count")));
		int price_sum = (int) ((total_price * adult) + (total_price * child * 0.7));

		for (int i = 0; i < adult + child; i++) {
			if (i == 0)
				list.add("collapseOne");
			if (i == 1)
				list.add("collapseTwo");
			if (i == 2)
				list.add("collapseThree");
			if (i == 3)
				list.add("collapseFour");
			if (i == 4)
				list.add("collapseFive");
			if (i == 5)
				list.add("collapseSix");
			if (i == 6)
				list.add("collapseSeven");
			if (i == 7)
				list.add("collapseEight");
			if (i == 8)
				list.add("collapseNine");
		}

		map.put("people", adult + child);
		map.put("PRICE", price_sum);
		map.put("TIME1_1", map2.get("TI_DEP"));
		map.put("TIME1_2", map2.get("TI_ARR"));
		map.put("TIME2_1", map3.get("TI_DEP"));
		map.put("TIME2_2", map3.get("TI_ARR"));
		map.put("DEP_CODE", commandMap.getMap().get("DEP_CODE"));
		map.put("ARR_CODE", commandMap.getMap().get("ARR_CODE"));
		
		
		Map<String, Object> mile = new HashMap<String, Object>();
		String mileNo = "17991";
		mile.put("MILE_NO", mileNo);
		
		mv.addObject("miles", milesService.nowMile(mile));
		mv.addObject("listSize", list.size());
		mv.addObject("map", map);
		mv.addObject("list", list);

		log.debug(map);
		return mv;
	}

	// 탑승자 정보 입력 받은 것 + 예약번호 생성 => 예약테이블에 넣는 메서드
	@RequestMapping(value = "/book/bookSuccess.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bookSuccess(@ModelAttribute("flightInfo") Map<String, Object> map, CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/test/api.do");

		Map<String, Object> map2book = new HashMap<String, Object>();
		String regDate = new SimpleDateFormat("yyMMdd").format(new java.util.Date());

		int price = (Integer) map.get("PRICE");
		int miles = (int) (price * 0.1) ;
		

		String bName = ((String) commandMap.getMap().get("fmName1")) + ((String) commandMap.getMap().get("lastName1"));
		String email = (String) commandMap.getMap().get("email");
		String phone = (String) commandMap.getMap().get("phone");
		String pay = (String) commandMap.getMap().get("pay");

		String mem_id = (String) request.getSession().getAttribute("ID");

		map2book.put("BOOK_NO", "B" + dateRandom());
		map2book.put("COUNT", map.get("people"));
		map2book.put("DEP_CODE", map.get("DEP_CODE"));
		map2book.put("ARR_CODE", map.get("ARR_CODE"));
		map2book.put("PAY", pay);
		map2book.put("PRICE", price);
		map2book.put("NAME", bName);
		map2book.put("EMAIL", email);
		map2book.put("PHONE", phone);
		map2book.put("DAY", regDate);
		map2book.put("MEM_ID", mem_id);

		mv.addObject("map", map2book);

		bookService.insertBook(map2book);

		map.put("BOOK_NO", map2book.get("BOOK_NO"));

		// 티켓번호 생성해서 티켓테이블에 넣는 메서드
		///////////////////////////////////////////////////////////////////////////


		Map<String, Object> map2ticket = new HashMap<String, Object>();

		int round = (Integer) map2book.get("COUNT");
		
		for (int i = 1; i <= round; i++) {

			String name4TK = ((String) commandMap.getMap().get("fmName" + i))
					+ ((String) commandMap.getMap().get("lastName" + i));
			String ch_bag = (String) commandMap.getMap().get("ck_bag" + i);
			String meal = (String) commandMap.getMap().get("meal" + i);
			String sex = (String) commandMap.getMap().get("sex" + i);
			String age = (String) commandMap.getMap().get("age" + i);

			map2ticket.put("TK_NO", "T" + dateRandom());
			map2ticket.put("BOOK_NO", map2book.get("BOOK_NO"));
			map2ticket.put("NAME", name4TK);
			map2ticket.put("CARE", "Y");
			map2ticket.put("CARE_KD", "A");
			map2ticket.put("CH_BAG", ch_bag);
			map2ticket.put("MEAL", meal);
			map2ticket.put("ADULT", age);
			map2ticket.put("GENDER", sex);

			mv.addObject("map", map2ticket);

			ticketService.insertTicket(map2ticket);

		}

		//완료페이지 화면 띄우는용
		List<Map<String, Object>> successList = ticketService.TKlistByBKno(map2book);
		mv.addObject("successList", successList);
		
		
		//마일리지 결제 혹은 적립 
		Map<String, Object> mile = new HashMap<String, Object>();
		String mileNo = (String) request.getSession().getAttribute("MILE_NO");
		
		if(pay.equals("pay")) { //적립 
			mile.put("SAVE_MILE", miles);
			mile.put("MILE_NO", mileNo);
			milesService.saveMile(mile);
		} else { //결제 
			mile.put("USE_MILE", miles);
			mile.put("MILE_NO", mileNo);
			milesService.useMile(mile);
		}
		
		
		
		return mv;
	}
	
	@RequestMapping(value = "/book/pay.do")
	public ModelAndView pay(@ModelAttribute("flightInfo") Map<String, Object> map, CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/book/complete.do");
		
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("cid", "TC0ONETIME");
		paramMap.put("tid", request.getSession().getAttribute("tid").toString());
		paramMap.put("partner_order_id", "1234");
		paramMap.put("partner_user_id", "1234");
		paramMap.put("pg_token", commandMap.getMap().get("pg_token").toString());
		apiHelper.successPay(paramMap);
		
		return mv;
	}
	
	
	@RequestMapping(value = "/test/api.do")
	public ModelAndView api(@ModelAttribute("flightInfo") Map<String, Object> map, CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("common/test");
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("cid", "TC0ONETIME");
		paramMap.put("partner_order_id", "1234");
		paramMap.put("partner_user_id", "1234");
		paramMap.put("item_name", "Khair - 항공권");
		paramMap.put("quantity", "1");
		paramMap.put("total_amount", "100000");
		paramMap.put("vat_amount", "10000");
		paramMap.put("tax_free_amount", "0");
		paramMap.put("approval_url", "http://localhost:9090/khteam1/book/pay.do");
		paramMap.put("fail_url", "http://localhost:9090/khteam1/main.do");
		paramMap.put("cancel_url", "http://localhost:9090/khteam1/main.do");

		String str = apiHelper.readyPay(paramMap);

		String[] map2 = str.split("\"");

		for (int i = 0; i < map2.length; i++) {
			System.out.println(map2[i]);
		}
		String tid = map2[3];

		map.put("tid", tid);
		log.debug(map);
		mv.addObject("nextUrl", map2[17]);
		mv.addObject("tid", map2[3]);
		request.getSession().setAttribute("tid", map2[3]);
		
		return mv;
	}
	
	
	@RequestMapping(value = "/book/complete.do")
	public ModelAndView complete(@ModelAttribute("flightInfo") Map<String, Object> map, CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/book/bookComplete");
		//완료페이지 화면 띄우는용
		List<Map<String, Object>> successList = ticketService.TKlistByBKno(map);
		mv.addObject("successList", successList);
		mv.addObject("map", map);
		
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		flightService.seatMin(map);
		map2.put("DEP_CODE", map.get("ARR_CODE"));
		flightService.seatMin(map2);
		return mv;
	}
	

	// routeToPdf.jsp 뷰로 넘어가서 피디엪 출력을 위한 값들을 담아서 보여주도록 해주는 컨트롤러
	// routeToPdf.jsp => HtmlMaker.urlPath => RoutePdfController.htmlStr =>
	// PdfBuiler
	@RequestMapping(value = "/book/pdfEticket.do")
	public ModelAndView pdfEticket(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("pdf/bookPdf");

		
		Map<String, Object> bookMap = bookService.bookDetail(commandMap.getMap());
		Map<String, Object> ticketMap = ticketService.ticketDetail(commandMap.getMap());
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		map2.put("DEP_CODE", bookMap.get("DEP_CODE"));
		Map<String, Object> flightMap = flightService.flightDetail(map2);
		Map<String, Object> depMap = routeService.selectRouteDetail(flightMap);
		
		map2.put("DEP_CODE", bookMap.get("ARR_CODE"));
		flightMap = flightService.flightDetail(map2);
		Map<String, Object> arrMap = routeService.selectRouteDetail(flightMap);
		
		log.debug(bookMap);
		log.debug(ticketMap); 
		
		mv.addObject("depMap", depMap);
		mv.addObject("arrMap", arrMap);
		mv.addObject("ticketMap", ticketMap);
		mv.addObject("bookMap",bookMap); 
		return mv; 
	}

	// 관리자 페이지 시작
	// ----------------------------------------------------------------------

	// 예약현황 목록 호출하는 메서드
	@RequestMapping(value = "/admin/bookList.do")
	public ModelAndView bookList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/book/adminBookList");
		List<Map<String, Object>> list = bookService.bookList();
		mv.addObject("list", list);

		log.debug("list=> " + list);
		log.debug("commandMap=> " + commandMap.getMap());
		return mv;
	}

	// 예약번호 클릭하면 번호에 따른 티켓번호 출력해주는 메서드
	@RequestMapping(value = "/admin/TKlistByBKno.do")
	public ModelAndView TKlistByBKno(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/ticket/TKlistByBKno");
		List<Map<String, Object>> list = ticketService.TKlistByBKno(commandMap.getMap());
		mv.addObject("list", list);

		log.debug("list=> " + list);
		log.debug("commandMap=> " + commandMap.getMap());
		return mv;
	}

	// 예약번호 수동으로 등록하기 화면
	@RequestMapping(value = "/admin/openBookWrite.do")
	public ModelAndView openBookWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/book/adminBookWrite");

		log.debug("commandMap=> " + commandMap.getMap());
		return mv;
	}

	// 예약번호 수동으로 등록하기
	@RequestMapping(value = "/admin/bookWrite.do", method = RequestMethod.POST)
	public ModelAndView bookWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/bookList.do");

		log.debug("commandMap=> " + commandMap.getMap());

		commandMap.getMap().put("BOOK_NO", "B" + dateRandom());
		bookService.insertBook(commandMap.getMap());

		log.debug("commandMap=> " + commandMap.getMap());
		return mv;
	}

	// 예약번호 수정하기 화면
	@RequestMapping(value = "/admin/openBookUpdate.do")
	public ModelAndView openBookUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/book/adminBookUpdate");
		Map<String, Object> map = bookService.bookDetail(commandMap.getMap());
		mv.addObject("map", map);

		log.debug("map=> " + map);
		log.debug("commandMap=> " + commandMap.getMap());
		return mv;
	}

	// 예약번호 수정사항 입력
	@RequestMapping(value = "/admin/bookUpdate.do", method = RequestMethod.POST)
	public ModelAndView bookUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		System.out.println(commandMap.getMap());
		ModelAndView mv = new ModelAndView("redirect:/admin/bookList.do");
		bookService.bookUpdate(commandMap.getMap(), request);
		mv.addObject("BOOK_NO", commandMap.get("BOOK_NO"));

		log.debug("mv=> " + mv);
		log.debug("commandMap=> " + commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/admin/bookDelete.do", method = RequestMethod.POST)
	public ModelAndView bookDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/bookList.do");
		bookService.bookDelete(commandMap.getMap(), request);
		mv.addObject("BOOK_NO", commandMap.get("BOOK_NO"));

		log.debug("mv=> " + mv);
		log.debug("commandMap=> " + commandMap.getMap());
		return mv;
	}

	// dateButton 리스트 메소드
	public List<String> dateButton(Date date) {
		List<String> dList = new ArrayList<String>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();

		for (int i = -2; i < 3; i++) {
			cal.setTime(date);
			cal.add(Calendar.DATE, i);
			String datefo = df.format(cal.getTime());
			dList.add(datefo);
		}

		return dList;
	}

	// int를 가격으로 변환
	public static String toPriceFormat(int num) {
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(num);
	}

	public static String dateRandom() {
		String sysDate = new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		int random = (int) (Math.random() * 10000);
		return sysDate + random;
	}
}
