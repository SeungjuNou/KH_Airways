package com.cafe24.khteam1.common.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
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
import com.cafe24.khteam1.common.util.MailSend;

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
		
		String name = (commandMap.getMap().get("name")).toString(); //파일이름 
		String fname = (commandMap.getMap().get("fname")).toString(); //폴더이름 
		String reqName = (commandMap.getMap().get("reqName")).toString(); //요청이름
		String email = (commandMap.getMap().get("email")).toString(); //이메일 여부
		
		String urlPath = null;
		if(reqName.equals("book/pdfEticket")) {
			String book_no = "&BOOK_NO="+(commandMap.getMap().get("BOOK_NO")).toString(); //예약번호
			urlPath = "http://localhost:9090/khteam1/"+reqName+".do?"+ "name="+ name +"&fname="+ fname + book_no;
		} else {
			urlPath = "http://localhost:9090/khteam1/"+reqName+".do?"+ "name="+ name +"&fname="+ fname;
		}
		
		String htmlStr = htmlMaker.pageMakeHtml(urlPath);
		
		Map<String, Object> count = commonService.selectFile(commandMap.getMap());
		
		model.addAttribute("bodyString", htmlStr);
		model.addAttribute("fileName", name);
		model.addAttribute("folderName", fname);
		model.addAttribute("email", email);
		
		String filePath = request.getSession().getServletContext().getRealPath("/"+fname+"/");
		
		if(count == null ||count.size() <= 0) { //db에 없으면 생성view 반환
			commonService.insertFile(commandMap.getMap()); //db저장
			return "buildPdf";
		} else { //db에 있으면 다운로드 실행
			if(email == null || email.equals("")) {
				try {
					
			         
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
			} else {
				Map<String, Object> map = new HashMap<String, Object>();
				MailSend ms = new MailSend();
				map.put("subject", "KhAirways 에서 발송한 메일입니다.");
				map.put("text", "본 이메일은 발신전용으로 수신은 불가능함을 알려드립니다. 더불어 파일첨부 이외의 내용은 없습니다.");
				map.put("to", "teamproj1@gmail.com");
				map.put("file", (filePath + name + ".pdf"));
				ms.send(map);
				
				return null;
			}
		}
		
	}
	
}