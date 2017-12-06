package com.cafe24.khteam1.route;

import java.util.List;
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
import com.cafe24.khteam1.route.service.RouteService;

@Controller
public class RouteController {
    Logger log = Logger.getLogger(this.getClass());
      
    @Resource(name="routeService")
    private RouteService routeService;


      
    @RequestMapping(value="/main.do")
    public ModelAndView openMain(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/main/main");
        List<Map<String,Object>> list = routeService.depRouteList(commandMap.getMap());
        mv.addObject("list", list);
        return mv;
    }

    
    @ResponseBody
    @RequestMapping(value="/arrRouteList.do") 
    public List<Map<String,Object>> arrRouteList(CommandMap commandMap) throws Exception{
        
        List<Map<String,Object>> list = routeService.arrRouteList(commandMap.getMap());
        return list;
    
    }
    
    @RequestMapping(value = "/route/openRouteList.do") // 노선등록 현황을 불러오는
	public ModelAndView openRouteList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/route/routeList");
		List<Map<String, Object>> list = routeService.selectRouteList(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value = "/route/openRouteDeactList.do") // 비활성화된 노선등록 현황을 불러오는
	public ModelAndView openRouteDeactList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/route/routeDeactList");
		List<Map<String, Object>> list = routeService.selectRouteDeactList(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value = "/route/openRouteWrite.do") //노선등록화면
	public ModelAndView openRouteWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/route/routeWrite");

		return mv;
	}

	@RequestMapping(value = "/route/insertRoute.do", method = RequestMethod.POST) //노선등록하기
	public ModelAndView insertRoute(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/route/openRouteList.do");
		routeService.insertRoute(commandMap.getMap(), request);

		return mv;
	}

	@RequestMapping(value = "/route/openRouteDetail.do") //상세보기
	public ModelAndView openRouteDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/route/routeDetail");

		Map<String, Object> map = routeService.selectRouteDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}

	@RequestMapping(value = "/route/openRouteUpdate.do") //수정하기화면
	public ModelAndView openRouteUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/route/routeUpdate");
		Map<String, Object> map = routeService.selectRouteDetail(commandMap.getMap());

		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}

	@RequestMapping(value = "/route/updateRoute.do", method = RequestMethod.POST) //수정사항 입력
	public ModelAndView updateRoute(CommandMap commandMap, HttpServletRequest request) throws Exception {
		System.out.println(commandMap.getMap());
		ModelAndView mv = new ModelAndView("redirect:/route/openRouteList.do");

		routeService.updateRoute(commandMap.getMap(), request);

		mv.addObject("ITI_NO", commandMap.get("ITI_NO"));
		return mv;
	}

	@RequestMapping(value = "/route/deleteRoute.do") //삭제(비활성화)하기
	public ModelAndView deleteRoute(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/route/openRouteList.do");

		routeService.deleteRoute(commandMap.getMap());

		return mv;
	}
    
    


} 

