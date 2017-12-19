package com.cafe24.khteam1.route;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.common.util.HtmlMaker;

@Controller
public class RoutePdfController {
	
	@Resource(name="htmlMaker")
    private HtmlMaker htmlMaker;
	
	// routeList.jsp 에서 '출력하기' 클릭 => 현재 컨트롤러 => /util/PdfBuilder 클래스로 이동
	@RequestMapping("/pdfMake.do")
	public String pageRankReport(Model model, CommandMap commandMap) {
		// HtmlMaker 클래스에서 pageMakeHtml을 불러와서 htmlStr에 넣고 이와 함께, fileName을 각각의 이름값을 정해서 model에 넣어서 buildPdf로 리턴.
		// buildPdf는 bean id 로서 action-servlet.xml파일에서 확인.
		String htmlStr = htmlMaker.pageMakeHtml((commandMap.getMap().get("reqName")).toString());
		
		
		String fileName = (commandMap.getMap().get("reqName")).toString();
		/*commandMap.getMap().get("TK_NO"+"_"+"EN_NAME");*/
		
		model.addAttribute("bodyString", htmlStr);
		model.addAttribute("fileName", fileName);
		model.addAttribute("folderName", fileName);
		
		if(null == null ) {
			return "buildPdf";
		} else {
			return "downloadPdf";
		}
		
	}
	
}