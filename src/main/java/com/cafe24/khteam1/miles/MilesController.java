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



	//회원관리(마일리지사용내역)	
	@RequestMapping(value = "/admin/milesList.do")
	public ModelAndView adminMilesList(CommandMap commandMap) throws Exception {
		ModelAndView view = new ModelAndView("admin/adminMilesList");
		List<Map<String, Object>> list = milesService.milesList(commandMap.getMap());
		view.addObject("list", list);	
		return view;
	}
	
	//회원관리(마일리지회원관리)
		@RequestMapping(value = "/admin/milesManage.do")
		public ModelAndView adminMilesManage(CommandMap commandMap) throws Exception {
			ModelAndView view = new ModelAndView("admin/adminMilesManage");
			List<Map<String, Object>> list = milesService.milesManage(commandMap.getMap());
			view.addObject("list", list);
			return view;
		}
}