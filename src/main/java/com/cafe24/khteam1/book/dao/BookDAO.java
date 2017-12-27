package com.cafe24.khteam1.book.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;

@Repository
public class BookDAO extends AbstractDAO { 
	
	public void insertBook(Map<String, Object> map) throws Exception {
		insert("book.insertBook", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> bookList() throws Exception {
		return (List<Map<String, Object>>) selectList("book.bookList");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> memberBookList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("book.memberBookList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> memberWbBookList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("book.memberWbBookList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> memberNoWbBookList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("book.memberNoWbBookList", map);
	}


	@SuppressWarnings("unchecked")
	public Map<String, Object> bookDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("book.bookDetail", map);
	}
	
	public void bookWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		insert("book.bookWrite", map);
	}

	public void bookUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		update("book.bookUpdate", map);
	}

	public void bookDelete(Map<String, Object> map, HttpServletRequest request) throws Exception {
		update("book.bookDelete", map);
	}
	
	public void updateWbCheck(Map<String, Object> map) throws Exception {
		update("book.updateWbCheck", map);
	}

}
