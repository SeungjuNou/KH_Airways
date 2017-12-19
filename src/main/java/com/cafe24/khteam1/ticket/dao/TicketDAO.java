package com.cafe24.khteam1.ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;

@Repository
public class TicketDAO extends AbstractDAO { 
	
	public void insertTicket(Map<String, Object> map) throws Exception {
		insert("ticket.insertTicket", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> TKlistByBKno(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("ticket.TKlistByBKno", map);
	}

}
