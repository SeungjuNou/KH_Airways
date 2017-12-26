package com.cafe24.khteam1.book.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cafe24.khteam1.book.dao.BookDAO;


@Service("bookService")
public class BookServiceImpl implements BookService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "bookDAO") 
	private BookDAO bookDAO;
	
	@Override
	public void insertBook(Map<String, Object> map) throws Exception {
		bookDAO.insertBook(map);
	}
	
	@Override
	public List<Map<String, Object>> bookList() throws Exception { 
		 return bookDAO.bookList();
	} 
		
	@Override
	public Map<String, Object> memberBookList(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = bookDAO.memberBookList(map);
	    return resultMap;
	}
	
	@Override
	public Map<String, Object> bookDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = bookDAO.bookDetail(map);
		return resultMap;
	}
	
	@Override
	public void bookWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		bookDAO.insertBook(map);
	}
	
	@Override
	public void bookUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception{
		bookDAO.bookUpdate(map, request);
	}
	
	@Override
	public void bookDelete(Map<String, Object> map, HttpServletRequest request) throws Exception {
		bookDAO.bookDelete(map, request);
	}

	@Override
	public void updateWbCheck(Map<String, Object> map) throws Exception {
		bookDAO.updateWbCheck(map);
	}

	@Override
	public List<Map<String, Object>> memberWbBookList(Map<String, Object> map) throws Exception {
		return bookDAO.memberWbBookList(map);
	}

	
	@Override
	public List<Map<String, Object>> memberNoWbBookList(Map<String, Object> map) throws Exception {
		return bookDAO.memberNoWbBookList(map);
	}

}
