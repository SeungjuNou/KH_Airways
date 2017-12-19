package com.cafe24.khteam1.common.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.common.service.CommonService;
import com.cafe24.khteam1.common.util.HtmlMaker;

@Controller
public class PdfController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="htmlMaker")
    private HtmlMaker htmlMaker;
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	// .jsp 에서 '출력하기' 클릭 => 현재 컨트롤러 => /util/PdfBuilder 클래스로 이동
	@RequestMapping("/pdfMake.do")
	public String pageRankReport(Model model, CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception {
		// HtmlMaker 클래스에서 pageMakeHtml을 불러와서 htmlStr에 넣고 이와 함께, fileName을 각각의 이름값을 정해서 model에 넣어서 buildPdf로 리턴.
		// buildPdf는 bean id 로서 action-servlet.xml파일에서 확인.
		String htmlStr = htmlMaker.pageMakeHtml((commandMap.getMap().get("reqName")).toString());
		log.debug(commandMap.getMap());
		String name = (commandMap.getMap().get("name")).toString(); //파일이름 
		String fname = (commandMap.getMap().get("fname")).toString(); //폴더이름 
		
		  
		Map<String, Object> count = commonService.selectFile(commandMap.getMap());
		
		model.addAttribute("bodyString", htmlStr);
		model.addAttribute("fileName", name);
		model.addAttribute("folderName", fname);
		
		if(count == null ||count.size() <= 0 ) { //db에 없으면 생성view 반환
			commonService.insertFile(commandMap.getMap()); //db저장
			return "buildPdf";
		} else { //db에 있으면 다운로드 실행
			
			try {
				String filePath = request.getSession().getServletContext().getRealPath("/"+fname+"/");
		         
		        byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath + name + ".pdf"));
		         
		        response.setContentType("application/octet-stream");
		        response.setContentLength(fileByte.length);
		        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(name,"UTF-8")+"\";");
		        response.setHeader("Content-Transfer-Encoding", "binary");
		        response.getOutputStream().write(fileByte);
		        response.getOutputStream().flush();
		        response.getOutputStream().close();
		        return null;
		        
			} catch (Exception ex){
				return "buildPdf";
			}
			
		}
		
	}
	
}