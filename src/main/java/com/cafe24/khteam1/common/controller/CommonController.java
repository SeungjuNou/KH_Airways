package com.cafe24.khteam1.common.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.khteam1.common.common.CommandMap;
import com.cafe24.khteam1.common.service.CommonService;
import com.cafe24.khteam1.common.util.KakaoRestApiHelper;

@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());

	private static KakaoRestApiHelper apiHelper = new KakaoRestApiHelper();

	@ModelAttribute("pay") 
	private Map<String, Object> map() {
		return new HashMap<String, Object>();
	}

	@Resource(name = "commonService")
	private CommonService commonService;

	@RequestMapping(value = "/common/downloadFile.do")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		Map<String, Object> map = commonService.selectFileInfo(commandMap.getMap());
		String storedFileName = (String) map.get("STORED_FILE_NAME");
		String originalFileName = (String) map.get("ORIGINAL_FILE_NAME");

		String filePath = request.getSession().getServletContext().getRealPath("/file/");

		byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath + storedFileName));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	/*@RequestMapping(value = "/test/api.do")
	public ModelAndView api(@ModelAttribute("pay") Map<String, Object> map, CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("common/test");
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("cid", "TC0ONETIME");
		paramMap.put("partner_order_id", "1234");
		paramMap.put("partner_user_id", "1234");
		paramMap.put("item_name", "Khair - 항공권");
		paramMap.put("quantity", "1");
		paramMap.put("total_amount", "100000");
		paramMap.put("vat_amount", "10000");
		paramMap.put("tax_free_amount", "0");
		paramMap.put("approval_url", "http://localhost:9090/khteam1/book/bookSuccess.do");
		paramMap.put("fail_url", "http://localhost:9090/khteam1/main.do");
		paramMap.put("cancel_url", "http://localhost:9090/khteam1/main.do");

		String str = apiHelper.readyPay(paramMap);

		String[] map2 = str.split("\"");

		for (int i = 0; i < map2.length; i++) {
			System.out.println(map2[i]);
		}
		String tid = map2[3];

		map.put("tid", tid);
		log.debug(map);
		mv.addObject("nextUrl", map2[17]);
		mv.addObject("tid", map2[3]);
		request.getSession().setAttribute("tid", map2[3]);
		
		return mv;
	}*/

	/*@RequestMapping(value = "/test/api2.do" , method = { RequestMethod.GET, RequestMethod.POST})
	public void api2(@ModelAttribute("pay") Map<String, Object> map, CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		
		try {
			System.out.println(request.getParameter("tid"));
			System.out.println(commandMap.getMap().toString());
		} catch (Exception ex) {}
		
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("cid", "TC0ONETIME");
		paramMap.put("tid", request.getSession().getAttribute("tid").toString());
		paramMap.put("partner_order_id", "1234");
		paramMap.put("partner_user_id", "1234");
		paramMap.put("pg_token", commandMap.getMap().get("pg_token").toString());
		apiHelper.successPay(paramMap);
	}*/

	/*
	 * try { CloseableHttpClient httpclient = HttpClients.createDefault(); HttpPost
	 * httpPost = new HttpPost(API_SERVER_HOST+PAY_READY_PATH); //전달하고자 하는
	 * PARAMETER를 List객체에 담는다 List <NameValuePair> nvps = new ArrayList
	 * <NameValuePair>(); nvps.add(new BasicNameValuePair("param1",
	 * request.getParameter("param1"))); nvps.add(new BasicNameValuePair("param2",
	 * request.getParameter("param2"))); //UTF-8은 한글
	 * 
	 * httpPost.setHeader("partner_order_id", "partner_order_id");
	 * httpPost.setHeader("partner_user_id", "partner_user_id");
	 * httpPost.setHeader("item_name", "초코파이"); httpPost.setHeader("quantity", "1");
	 * httpPost.setHeader("total_amount", "2200"); httpPost.setHeader("vat_amount",
	 * "220"); httpPost.setHeader("tax_free_amount", "0");
	 * httpPost.setHeader("approval_url", "https://developers.kakao.com/success");
	 * httpPost.setHeader("fail_url", "https://developers.kakao.com/fail");
	 * httpPost.setHeader("cancel_url", "https://developers.kakao.com/cancel");
	 * 
	 * 
	 * 
	 * CloseableHttpResponse response = httpclient.execute(httpPost);
	 * 
	 * try { System.out.println(response.getStatusLine()); //API서버로부터 받은 JSON 문자열
	 * 데이터 System.out.println(EntityUtils.toString(response.getEntity()));
	 * HttpEntity entity = response.getEntity(); EntityUtils.consume(entity);
	 * 
	 * } finally { response.close(); } } catch (Exception e) { e.printStackTrace();
	 * }
	 */
}
