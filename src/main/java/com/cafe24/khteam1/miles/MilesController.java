package com.cafe24.khteam1.miles;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.miles.service.MilesService;
import com.cafe24.khteam1.member.service.MemberService;

@Controller
public class MilesController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "milesService")
	private MilesService milesService;

	@Resource(name = "memberService")
	private MemberService memberService;

	

	
	/////////관리자/////////
	
	// 회원관리(마일리지사용내역) //회원별 
	@RequestMapping(value = "/admin/milesList.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminMilesList(CommandMap commandMap) throws Exception {
		ModelAndView view = new ModelAndView("member/adminMilesManage");
		List<Map<String, Object>> list = milesService.milesList(commandMap.getMap());
		view.addObject("list", list);
		return view;
	}
	
	

	// 회원관리(마일리지회원관리) //전부 
	@RequestMapping(value = "/admin/milesManage.do")
	public ModelAndView adminMilesManage(CommandMap commandMap) throws Exception {
		ModelAndView view = new ModelAndView("member/adminMilesManage");
		List<Map<String, Object>> list = milesService.milesManage(commandMap.getMap());
		view.addObject("list", list);
		return view;
	}
	
	/////////회원/////////
	
	/*// 마이페이지(마일리지사용)
	@RequestMapping(value = "/myPage/useMile.do")
	public ModelAndView useMile(CommandMap commandMap) throws Exception {
		ModelAndView view = new ModelAndView("myPage/milesList");
		Map<String, Object> map = milesService.useMile(commandMap.getMap());
		view.addObject("map", map);
		return view;
	}*/

	// 마이페이지(마일리지사용내역)
	@RequestMapping(value = "/myPage/milesList.do")
	public ModelAndView milesList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("myPage/milesList");
		commandMap.getMap().put("ID", (String) request.getSession().getAttribute("ID")); // 커맨드맵에 ID란 이름의 로그인체크에서 설정한
																							// 세션ID(DB데이터)값을 넣음
		Map<String, Object> map = memberService.viewMember(commandMap.getMap()); // 회원정보에 세션ID(DB데이터)값을 설정하고 map에 담음
		commandMap.getMap().put("MILE_NO", map.get("MILE_NO")); // 커맨드맵에 세션ID(DB데이터)중의 MILE_NO란 이름의 마일리지번호값을 넣음
		Map<String, Object> map2 = milesService.nowMile(commandMap.getMap()); // 마일리지목록을 띄워줄 commandMap(MILE_NO)
		commandMap.getMap().put("MILES", map2.get("MILES"));
		List<Map<String, Object>> list = milesService.milesList(commandMap.getMap()); // 마일리지목록을 띄워줄 commandMap(MILE_NO)
		view.addObject("list", list);
		view.addObject("map", map);
		view.addObject("map2", map2);
		return view;
	}

}