package com.cafe24.khteam1.ticket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cafe24.khteam1.ticket.dao.TicketDAO;

 
@Service("ticketService")
public class TicketServiceImpl implements TicketService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "ticketDAO") 
	private TicketDAO ticketDAO;
	
	@Override
	public void insertTicket(Map<String, Object> map) throws Exception {
	       
		ticketDAO.insertTicket(map);
	}
}
