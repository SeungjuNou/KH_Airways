package com.cafe24.khteam1.pp;

import java.util.HashMap;
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
import com.cafe24.khteam1.member.service.MemberService;
import com.cafe24.khteam1.pp.service.PpService;
import com.cafe24.khteam1.sample.service.SampleService;

@Controller
public class PpController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "ppService")
	private PpService ppService;

	@Resource(name = "sampleService")
	private SampleService sampleService;

	@Resource(name = "memberService")
	private MemberService memberService;

	// 여권정보신청내역
	@RequestMapping(value = "/admin2/unapprovedList.do")
	public ModelAndView adminUnapprovedList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("pp/adminUnapprovedList");
		String approved = (String) commandMap.get("DEL_GB");
		List<Map<String, Object>> list = null;
		if (approved == null || approved.equals("N")) {
			list = ppService.adminUnapprovedList(commandMap.getMap());
		}
		view.addObject("list", list);
		return view;
	}

	// 여권정보신청내역
	@RequestMapping(value = "/admin2/approvedList.do")
	public ModelAndView adminApprovedList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("pp/adminApprovedList");
		List<Map<String, Object>> list = ppService.adminApprovedList(commandMap.getMap());
		view.addObject("list", list);
		return view;
	}

	// 여권정보승인하기
	@RequestMapping(value = "/admin2/ppModify.do")
	public ModelAndView ppModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("redirect:/admin/unapprovedList.do");
		ppService.ppModify(commandMap.getMap(), request);
		return view;
	}

	// 여권정보신청 파일보기
	@RequestMapping(value = "/admin2/ppModifyApplyView.do")
	public ModelAndView ppModifyApplyView(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("pp/adminPpModifyApplyView");

		Map<String, Object> map = ppService.ppModifyApplyView(commandMap.getMap());
		commandMap.getMap().put("BOARD_IDX", map.get("BOARD_IDX"));
		commandMap.getMap().put("IDX", map.get("IDX"));

		view.addObject("map", map);
		view.addObject("list", map.get("list"));
		return view;
	}

	// 여권정보변경 신청하기
	@RequestMapping(value = "/myPage/ppModifyApplyBoard.do")
	public ModelAndView ppModifyApplyBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("redirect:/myPage/viewMember.do");
		Map<String, Object> map = new HashMap<String, Object>();
		log.debug(commandMap.getMap());
		commandMap.getMap().put("IDX", map.get("IDX"));
		ppService.ppModifyApplyBoard(commandMap.getMap(), request);
		view.addObject("map", commandMap.getMap());
		return view;
	}

}