package com.cafe24.khteam1.book.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;

@Repository
public class BookDAO extends AbstractDAO {
	
	public void insertBook(Map<String, Object> map) throws Exception {
		insert("book.insertBook", map);
	}

}
