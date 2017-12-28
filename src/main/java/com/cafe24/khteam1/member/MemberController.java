package com.cafe24.khteam1.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.khteam1.book.service.BookService;
import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.common.util.DateTrans;
import com.cafe24.khteam1.common.util.MailSend;
import com.cafe24.khteam1.member.service.MemberService;
import com.cafe24.khteam1.miles.service.MilesService;


@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "memberService")
	private MemberService memberService;

	@Resource(name = "milesService")
	private MilesService milesService;
	
	@Resource(name = "bookService")
	private BookService bookService;
	
	@Resource(name="mailSend")
	private MailSend mailSend;

	@Resource(name = "dateTrans")
	private DateTrans dateTrans;

	// 회원 가입 & 마일리지 생성
	@RequestMapping(value = "/join/insertMember.do", method = RequestMethod.POST)
	public ModelAndView insertMember(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView view = new ModelAndView("redirect:/main.do");
		Map<String, Object> map = new HashMap<String, Object>();

		String mileNo = mileNo("F_MILSE");

		map.put("MILE_NO", mileNo);
		map.put("MILES_TEXT", "회원가입보너스");

		log.debug(map);
		commandMap.getMap().put("MILE_NO", mileNo);
		commandMap.getMap().put("GRADE", 0);

		memberService.insertMember(commandMap.getMap(), request);
		milesService.insertMiles(map, request);

		return view;
	}
	
	
	//id찾기 컨트롤러  
	@RequestMapping(value = "/findId.do")
	public ModelAndView findId(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("myPage/findId");
		return view;
	}
	
	//id찾기 인증번호 보내기
	@ResponseBody
	@RequestMapping(value="/findId.do", method=RequestMethod.POST)
	public boolean findId(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception {
		//ID찾기
		Map<String, Object> info = memberService.findId(commandMap.getMap());
		
		if(info==null) {
			return false;
		} else {
			//인증번호 생성
			StringBuffer accessNo = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
			    int rIndex = rnd.nextInt(2);
			    switch (rIndex) {
			    case 0:
			        // A-Z
			    	accessNo.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 1:
			        // 0-9
			    	accessNo.append((rnd.nextInt(10)));
			        break;
			    }
			}
			
			session.setAttribute("ID", info.get("ID"));
			session.setAttribute("accessNo", accessNo.toString());
			
			commandMap.put("subject", "인증번호 TEST");
			commandMap.put("text", "인증번호 : " + accessNo);
			commandMap.put("to", commandMap.get("EMAIL"));
			mailSend.send(commandMap.getMap());
			return true;
		}
	}
	
	//ID찾기 인증하기 폼
	@RequestMapping(value="/accessForm.do")
	public ModelAndView accessCheckForm() {
		return new ModelAndView("myPage/accessForm");
	}
	
	//ID찾기 인증확인
	@ResponseBody
	@RequestMapping(value="/accessCheck.do", method=RequestMethod.POST)
	public String accessCheck(CommandMap commandMap, HttpSession session) {
		String sessionNo = (String) session.getAttribute("accessNo");
		String accessNo = (String) commandMap.get("accessNo");
		String result = "false";
		
		if(sessionNo.equals(accessNo)) {
			result = (String) session.getAttribute("ID");
			session.invalidate();
			return result;
		} else
			return result;
	}
	
	
	
	// 로그인체크
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/login/loginCheck.do", method = RequestMethod.POST)
	public boolean loginCheck(CommandMap commandMap, HttpServletRequest request) throws Exception {
		//ModelAndView view = new ModelAndView("redirect:/main.do");
		boolean loginResult = false;

		Map<String, Object> result = memberService.loginCheck(commandMap.getMap());
		Map<String, Object> map = (Map<String, Object>) result.get("map");

		try {	
			String password = (String) map.get("PASSWORD");
			String MILE_NO =  String.valueOf(map.get("MILE_NO"));
			String MEM_NO = String.valueOf(map.get("NO"));
			
			if (password.equals(commandMap.get("PASSWORD"))) {
				request.getSession().setAttribute("ID", commandMap.get("ID"));
				request.getSession().setAttribute("MEM_NAME", (String) map.get("NAME"));
				request.getSession().setAttribute("MILE_NO", MILE_NO);
				request.getSession().setAttribute("MEM_NO", MEM_NO);
				
				loginResult = true;
			} else {
				
			}
			
		} catch(NullPointerException e) {}

		return loginResult;
	} 
	
	
	// 로그아
	@RequestMapping(value = "/login/logOut.do", method = RequestMethod.GET)
	public ModelAndView logOut(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("redirect:/main.do");

		request.getSession().invalidate(); 

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
		commandMap.getMap().put("ID", (String) request.getSession().getAttribute("ID")); // 커맨드맵에 ID란 이름의 로그인체크에서 설정한
																							// 세션ID(DB데이터)값을 넣음\
		Map<String, Object> map = memberService.viewMember(commandMap.getMap()); // 회원정보에 세션ID(DB데이터)값을 설정하고 map에 담음
		commandMap.getMap().put("MILE_NO", map.get("MILE_NO")); // 커맨드맵에 세션ID(DB데이터)중의 MILE_NO란 이름의 마일리지번호값을 넣음
		Map<String, Object> map2 = milesService.nowMile(commandMap.getMap()); // 마일리지목록을 띄워줄 commandMap(MILE_NO)
		commandMap.getMap().put("MILES", map2.get("MILES"));
		view.addObject("map", map);
		view.addObject("map2", map2);
		return view;
	}

	// 회원 수정
	@RequestMapping(value = "/myPage/updateMember.do" , method=RequestMethod.POST)
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
		commandMap.getMap().put("MILE_NO", map.get("MILE_NO"));
		Map<String, Object> map2 = milesService.nowMile(commandMap.getMap()); // 마일리지목록을 띄워줄 commandMap(MILE_NO)
		commandMap.getMap().put("MILES", map2.get("MILES"));
		view.addObject("map", map);
		view.addObject("map2", map2);
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
	
	@RequestMapping(value = "/myPage/mybookList.do")
	public ModelAndView mybookList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("myPage/memberBookList");
		List<Map<String,Object>> list = null;
		String id = (String) request.getSession().getAttribute("ID");
		commandMap.getMap().put("MEM_ID", id);
		list = bookService.memberBookList(commandMap.getMap());
		
		mv.addObject("list", list);
		return mv;
	}

	//////////////////////////////////////////////////////
	//////////////////////// 관리자//////////////////////////
	//////////////////////////////////////////////////////

	// 관리자 회원목록
	@RequestMapping(value = "/admin2/memberList.do")
	public ModelAndView memberList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("member/adminMemberList");	
		String keyword = (String) commandMap.get("keyword");
		List<Map<String,Object>> list = null;
		
			if (keyword == null || keyword.equals("")) {
				list = memberService.memberList(commandMap.getMap());
			}else {
				list = memberService.findMemberList(commandMap.getMap());
			}
		
		view.addObject("list",list);
		return view;
	}
	
	//회원등급 변경 목록
	@RequestMapping(value = "/admin3/memberGradeList.do")
	public ModelAndView memberGradeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("member/adminMemberGradeList");
		String grade = (String) commandMap.get("GRADE");
		String keyword = (String) commandMap.get("keyword");
		List<Map<String,Object>> list = null;
		if (grade==null || grade.equals("")){
			if (keyword == null || keyword.equals("")) {
				list = memberService.memberList(commandMap.getMap());
			}else {
				list = memberService.findMemberList(commandMap.getMap());
			}
			}else {
				list = memberService.memberGradeList(commandMap.getMap());
		}
		view.addObject("list",list);
		return view;
	}
	
	// 관리자 회원수정폼
	@RequestMapping(value = "/admin2/updateMemberForm.do")
	public ModelAndView adminUpdateMemberForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("member/adminUpdateMemberForm");
		Map<String, Object> map = memberService.viewMember(commandMap.getMap());
		view.addObject("map", map);
		return view;
	}
	
	// 관리자 회원수정폼
		@RequestMapping(value = "/admin2/memberGradeForm.do")
		public ModelAndView adminMemberGradeForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView view = new ModelAndView("member/adminMemberGradeForm");
			Map<String, Object> map = memberService.viewMember(commandMap.getMap());
			view.addObject("map", map);
			return view;
		}

	// 관리자 회원수정
	@RequestMapping(value = "/admin2/updateMember.do")
	public ModelAndView adminUpdateMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("redirect:/admin2/memberList.do");
		memberService.updateMember(commandMap.getMap(), request);
		return view;
	}
	
	// 관리자 회원등급수정
		@RequestMapping(value = "/admin2/updateGrade.do")
		public ModelAndView adminUpdateGrade(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView view = new ModelAndView("redirect:/admin2/memberGradeList.do");
			memberService.updateMember(commandMap.getMap(), request);
			return view;
		}
	
	// 관리자 회원삭제
	@RequestMapping(value = "/admin2/deleteMember.do")
	public ModelAndView adminDeleteMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView("redirect:/admin2/memberList.do");
		memberService.deleteMember(commandMap.getMap());
		return view;
	}
	
	// 마일리지 번호
	public String mileNo(String type) {
		double no = Math.random();
		int result = (int) (no * 90000) + 10000;
		String resultNo = String.valueOf(result);
		return resultNo;
	}
}