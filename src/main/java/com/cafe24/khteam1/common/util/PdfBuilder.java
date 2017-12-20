package com.cafe24.khteam1.common.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;


// 마지막 과정으로, 겉으로 보이는 PDF 외형을 만들어서 이름.PDF로 바로 다운하도록 해 주는 클래스
public class PdfBuilder extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		Document document = new Document(PageSize.A4, 50, 50, 50, 50); // 용지 및 여백 설정
	     
		// PdfWriter 생성
		String fileName = ((String) model.get("fileName")); // 파일명이 한글일 땐 인코딩 필요
		String folderName = (String) model.get("folderName"); //폴더명 
		String filePath = request.getSession().getServletContext().getRealPath("/"+folderName+"/"); //서버경로 
		String serverPath = request.getSession().getServletContext().getRealPath("/");
		PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filePath + fileName)); // 서버에 저장
		PdfWriter writer2 = PdfWriter.getInstance(document, response.getOutputStream()); //링크 클릭하면 바로 다운로드
		writer.setInitialLeading(12.5f);
		
		// 파일 다운로드 설정 (리스폰영역)
		response.setContentType("apllication/download; charset=utf-8"); //contentType pdf혹은 다운로드로 지정.
		response.setHeader("Content-Transper-Encoding", "binary");
		response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");
		
		// Document 오픈
		document.open();
		XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
		     
		// CSS
		CSSResolver cssResolver = new StyleAttrCSSResolver();
		CssFile cssFile = XMLWorkerHelper.getCSS(new FileInputStream(serverPath + "_css/morris.css"));
		cssResolver.addCss(cssFile);
		    
		// HTML, 폰트 설정
		String fontPath = serverPath + "fonts/malgun.ttf";
		XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
		fontProvider.register(fontPath, "MalgunGothic"); // MalgunGothic은 alias,
		CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
		 
		HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
		htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
		 
		// Pipelines
		PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
		HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
		CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
		 
		XMLWorker worker = new XMLWorker(css, true);
		XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
		 
		// 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
		String htmlStr = "" + model.get("bodyString") + "";
		htmlStr = htmlStr.replaceAll("logo", "<img src=\"//image/KHicon.jpg\"/>");
		 
		StringReader strReader = new StringReader(htmlStr);
		xmlParser.parse(strReader);
        
        
		document.close();
		writer.close();
		writer2.close();
		
	}
}
