package com.cafe24.khteam1.main;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.route.service.RouteService;
import com.cafe24.khteam1.webcheck.service.WebcheckService;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "routeService")
	private RouteService routeService;

	@Resource(name = "webcheckService")
	private WebcheckService webcheckService;

	@ResponseBody
	@RequestMapping(value = "/arrRouteList2.do")
	public List<Map<String, Object>> arrRouteList(CommandMap commandMap) throws Exception {

		List<Map<String, Object>> list = routeService.arrRouteList(commandMap.getMap());
		return list;

	}

	@SuppressWarnings("null")
	@RequestMapping(value = "/main.do")
	public ModelAndView openMain(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/main/main");
		List<Map<String, Object>> list2 = null;
		
        List<Map<String,Object>> list = routeService.depRouteList(commandMap.getMap());

		String path = request.getSession().getServletContext().getRealPath("/file_QR/");
		try {
			String regDate = new SimpleDateFormat("yyMMdd").format(new java.util.Date());
			String id = (String) request.getSession().getAttribute("ID");
			commandMap.getMap().put("BO_DAY", regDate);
			commandMap.getMap().put("MEM_ID", id);
			Map<String, Object> map = null;
			log.debug(commandMap.getMap());
			if(id != null || !(id.equals("null"))) {
				list2 = webcheckService.viewMemberCheckin(commandMap.getMap());
				mv.addObject("size", list2.size());
				mv.addObject("list2", list2);
			}
		} catch (Exception ex) {
			
		}
		
		
		
		mv.addObject("list", list);
		return mv;
	}

}
