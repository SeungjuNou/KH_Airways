package com.cafe24.khteam1.member;

import java.util.HashMap;
import java.util.Map;

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
	
	@Resource(name="dateTrans")
	private DateTrans dateTrans;
	
	// 회원 가입 & 마일리지 생성
		@SuppressWarnings("unused")
		@RequestMapping(value = "/join/insertMember.do", method=RequestMethod.POST)
		public ModelAndView insertMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
			
			ModelAndView view = new ModelAndView("redirect:/main.do");
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("MILE_NO", mileNo("F_MILES"));
			map.put("MILES_TEXT", mileText("F_MILES"));
			
			commandMap.getMap().put("MILE_NO", mileNo("F_MILES"));
			
			memberService.insertMember(commandMap.getMap(), request);
			milesService.insertMiles(map, request);
			
			return view;
		}
		
		// 로그인체크
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "/login/loginCheck.do", method=RequestMethod.POST)
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
		
		//ajax 아이디 중복체크 
		@ResponseBody
	    @RequestMapping(value="/member/checkId.do") 
	    public String checkId(CommandMap commandMap) throws Exception{
	        String result = memberService.checkId(commandMap.getMap());
	        
	        return result;
	    
	    }
	    
		
		
		
		// 마일리지 번호(임시)
		public String mileNo(String type) {
			return "34757";
		}

		// 회원가입 마일리지 텍스트(임시)
		public String mileText(String type) {
			return "회원가입보너스";
		}
}
