package com.cafe24.khteam1.adminCommon.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cafe24.khteam1.adminCommon.dao.AdminDAO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	 Logger log = Logger.getLogger(this.getClass());
	    
	    @Resource(name="adminDAO")
	    private AdminDAO adminDAO;

		@SuppressWarnings("unchecked")
		@Override
		public Map<String, Object> selectToday(Map<String, Object> map) throws Exception {
			return (Map<String, Object>) adminDAO.selectToday(map);
		}

		@Override
		public List<Map<String, Object>> selectWeek(Map<String, Object> map) throws Exception {
			return adminDAO.selectWeek(map);
		}

		@Override
		public List<Map<String, Object>> selectMonth(Map<String, Object> map) throws Exception {
			return adminDAO.selectMonth(map);
		}

		@Override
		public List<Map<String, Object>> selectMoney(Map<String, Object> map) throws Exception {
			return adminDAO.selectMoney(map);
		}

		@SuppressWarnings("unchecked")
		@Override
		public Map<String, Object> selectMen(Map<String, Object> map) throws Exception {
			return (Map<String, Object>) adminDAO.selectMen(map);
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public Map<String, Object> selectWomen(Map<String, Object> map) throws Exception {
			return (Map<String, Object>) adminDAO.selectWomen(map);
		}
}
