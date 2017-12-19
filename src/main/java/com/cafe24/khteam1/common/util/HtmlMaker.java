package com.cafe24.khteam1.common.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Component("htmlMaker")
public class HtmlMaker {
	// PdfController와 PdfBuilder클래스의 중간과정으로 피디엪파일을 만들기 위한 정보를 넣은 값을 스트링으로 묶어서 RouteController에서 값을 불러옴
	
	public String pageMakeHtml(String conUrl) {
	 	
		String urlPath = "http://localhost:9090/khteam1/"+conUrl+".do"; 
        String pageContents = "";
        StringBuilder contents = new StringBuilder();
 
        try{
 
            URL url = new URL(urlPath);
            URLConnection con = (URLConnection)url.openConnection();
            InputStreamReader reader = new InputStreamReader (con.getInputStream(), "UTF-8");
 
            BufferedReader buff = new BufferedReader(reader);
 
            while((pageContents = buff.readLine())!=null){
                //System.out.println(pageContents);             
                contents.append(pageContents);
            }
 
            buff.close();
 
            System.out.println(contents.toString());
           
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return contents.toString();
	}
}
