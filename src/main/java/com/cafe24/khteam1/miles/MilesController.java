package com.cafe24.khteam1.miles;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

	//마이 페이지(마일리지)
		@RequestMapping(value = "/myPage/milesList.do")
		public ModelAndView milesList(CommandMap commandMap) throws Exception {
			ModelAndView view = new ModelAndView("myPage/myPage");
			List<Map<String, Object>> list = milesService.milesList(commandMap.getMap());	//마일리지 현황을 보여주기 위한 map
			Map<String, Object> map = milesService.milesList2(commandMap.getMap());		//마이페이지에 현재마일리지를 보여주기위한 map
			Map<String, Object> map2 = memberService.milesList3(commandMap.getMap());	//마이페이지에 이름과 회원번호를 보여주기 위한  map
			view.addObject("map2", map2.get("map2"));
			view.addObject("map", map.get("map"));
			view.addObject("list", map.get("list"));
			view.addObject("list", list);
			if (list.size() > 0) {
				view.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			} else {
				view.addObject("TOTAL", 0);
			}
			return view;
		}
}