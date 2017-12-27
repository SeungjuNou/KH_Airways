package com.cafe24.khteam1.pp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;

@Repository
public class PpDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminUnapprovedList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("pp.adminUnapprovedList", map);
	}

	public void ppModify(Map<String, Object> map) throws Exception {
		update("pp.ppModify", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminApprovedList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("pp.adminApprovedList", map);
	}
	
	 public void ppModifyApply(Map<String, Object> map) throws Exception{
	     insert("pp.ppModifyApply", map);
	    }

	public void ppModifyApplyBoard(Map<String, Object> map)  throws Exception{
		insert("pp.ppModifyApplyBoard", map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ppModifyApplyList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("pp.ppModifyApplyList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> ppModifyApplyView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("pp.ppModifyApplyView", map);
	}
}
	



