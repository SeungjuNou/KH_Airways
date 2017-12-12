package com.cafe24.khteam1.member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.common.util.DateTrans;
import com.cafe24.khteam1.member.service.MemberService;
import com.cafe24.khteam1.miles.service.MilesService;

@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "memberService")
	private MemberService memberService;

	@Resource(name = "milesService")
	private MilesService milesService;

	@Resource(name = "dateTrans")
	private DateTrans dateTrans;

	// 회원 가입 & 마일리지 생성
	@RequestMapping(value = "/join/insertMember.do", method = RequestMethod.POST)
	public ModelAndView insertMember(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView view = new ModelAndView("redirect:/main.do");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String mileNo = mileNo("F_MILSE");
		
		map.put("MILE_NO", mileNo);
		map.put("MILES_TEXT", "F_MILES");

		log.debug(map);
		commandMap.getMap().put("MILE_NO", mileNo);
		commandMap.getMap().put("GRADE", 0);
		
		memberService.insertMember(commandMap.getMap(), request);
		milesService.insertMiles(map, request);

		return view;
	}

	// 로그인체크
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/login/loginCheck.do", method = RequestMethod.POST)
	public ModelAndView loginCheck(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("redirect:/main.do");

		Map<String, Object> result = memberService.loginCheck(commandMap.getMap());
		Map<String, Object> map = (Map<String, Object>) result.get("map");

		String password = (String) map.get("PASSWORD");

		if (password.equals(commandMap.get("PASSWORD"))) {
			request.getSession().setAttribute("ID", commandMap.get("ID"));
			view.setViewName("main/main");
		} else {
			view.setViewName("main/main");
		}

		return view;
	}

	// ajax 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/member/checkId.do")
	public String checkId(CommandMap commandMap) throws Exception {
		String result = memberService.checkId(commandMap.getMap());

		return result;

	}

	// 마이페이지(회원 상세보기)
	@RequestMapping(value = "/myPage/viewMember.do")
	public ModelAndView viewMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("myPage/viewMember");
		commandMap.getMap().put("ID", (String) request.getSession().getAttribute("ID")); //커맨드맵에 ID란 이름의 로그인체크에서 설정한 세션ID(DB데이터)값을 넣음\
		Map<String, Object> map = memberService.viewMember(commandMap.getMap());	// 회원정보에 세션ID(DB데이터)값을 설정하고 map에 담음
		Map<String, Object> map2 = milesService.milesNow(commandMap.getMap()); //마일리지목록을 띄워줄 commandMap(MILE_NO)
		commandMap.getMap().put("MILES", map2.get("MILES"));
		view.addObject("map", map);
		view.addObject("map2" , map2);
		return view;
	}
	
	// 회원 수정
	@RequestMapping(value = "/myPage/updateMember.do")
	public ModelAndView updateMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("redirect:/myPage/viewMember.do");
		memberService.updateMember(commandMap.getMap(), request);
		view.addObject("ID", commandMap.get("ID"));
		return view;
	}

	// 회원 수정 폼
	@RequestMapping(value = "/myPage/updateMemberForm.do")
	public ModelAndView updateMemberForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("myPage/updateMemberForm");
		commandMap.getMap().put("ID", (String) request.getSession().getAttribute("ID"));
		Map<String, Object> map = memberService.viewMember(commandMap.getMap());
		view.addObject("map", map);
		return view;
	}

	// 회원 삭제
	@RequestMapping(value = "/myPage/deleteMember.do")
	public ModelAndView deleteMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("redirect:/main.do");
		commandMap.getMap().put("ID", (String) request.getSession().getAttribute("ID"));
		memberService.deleteMember(commandMap.getMap());
		view.addObject("ID", commandMap.get("ID"));
		return view;
	}

	//////////////////////////////////////////////////////
	//////////////////////// 관리자//////////////////////////
	//////////////////////////////////////////////////////

	// 관리자 회원목록
	@RequestMapping(value = "/admin/memberList.do")
	public ModelAndView memberList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("admin/adminMemberList");
		List<Map<String, Object>> list = memberService.memberList(commandMap.getMap());
		view.addObject("list", list);
		return view;
	}

	// 관리자 회원수정폼
	@RequestMapping(value = "/admin/updateMemberForm.do")
	public ModelAndView adminUpdateMemberForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("admin/adminUpdateMemberForm");
		Map<String, Object> map = memberService.viewMember(commandMap.getMap());
		view.addObject("map", map.get("map"));
		return view;
	}

	// 관리자 회원수정
	@RequestMapping(value = "/admin/updateMember.do")
	public ModelAndView adminUpdateMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("redirect:/admin/memberList.do");
		memberService.updateMember(commandMap.getMap(), request);
		view.addObject("NO", commandMap.get("NO"));
		return view;
	}

	// 관리자 회원삭제
	@RequestMapping(value = "/admin/deleteMember.do")
	public ModelAndView adminDeleteMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("redirect:/admin/memberList.do");
		memberService.deleteMember(commandMap.getMap());
		return view;
	}

	// 마일리지 번호(임시)
	public String mileNo(String type) {
			double no =  Math.random();
			int result = (int)(no * 90000) +10000;
			String resultNo = String.valueOf(result);
			return resultNo;
		}
	



}
