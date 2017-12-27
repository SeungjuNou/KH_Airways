package com.cafe24.khteam1.common.util;

import java.util.Map;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component("mailSend")
public class MailSend {
	@Autowired
	private JavaMailSender mailSender;
	
	public final String MAILFORM = "cha0731csh@gmail.com";
	
	public void send(Map<String, Object> map) {
		MimeMessage message = mailSender.createMimeMessage();
		String file = (String) map.get("file");
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			//메일 기본 설정
			messageHelper.setSubject((String) map.get("subject"));//제목
			messageHelper.setText((String) map.get("text"));//내용
			messageHelper.setTo((String) map.get("to"));//받는 메일주소
			messageHelper.setFrom(MAILFORM);//보내는 메일주소
			//첨부파일
			if(map.get("file") != null) {
				DataSource dataSource = new FileDataSource(file);
				messageHelper.addAttachment((String)map.get("file"), dataSource);
			}
			
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}