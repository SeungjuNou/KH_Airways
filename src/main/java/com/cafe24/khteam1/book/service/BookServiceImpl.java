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
		

}
