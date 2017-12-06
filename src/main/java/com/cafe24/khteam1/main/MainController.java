package com.cafe24.khteam1.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.route.service.RouteService;
  
@Controller
public class MainController {
    Logger log = Logger.getLogger(this.getClass());
      
    @Resource(name="routeService")
    private RouteService routeService;


     
    @RequestMapping(value="/main2.do")
    public ModelAndView openMain(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/main/main");
        List<Map<String,Object>> list = routeService.depRouteList(commandMap.getMap());
        mv.addObject("list", list);
        return mv;
    }

    
    @ResponseBody
    @RequestMapping(value="/arrRouteList2.do") 
    public List<Map<String,Object>> arrRouteList(CommandMap commandMap) throws Exception{
        
        List<Map<String,Object>> list = routeService.arrRouteList(commandMap.getMap());
        return list;
    
    }
    
    


} 
 