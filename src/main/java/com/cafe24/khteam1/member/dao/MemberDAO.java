package com.cafe24.khteam1.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.khteam1.common.dao.AbstractDAO;

@Repository
public class MemberDAO extends AbstractDAO {

	public void insertMember(Map<String, Object> map) throws Exception {
		insert("member.insertMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.loginCheck", map);
	}
	
	public String checkId(Map<String, Object> map) throws Exception {
		return (String) selectOne("member.checkId", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> milesList3(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.milesList3", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> viewMember(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.viewMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> milesList2(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.milesList2", map);
	}
	
	public void updateMember(Map<String, Object> map) throws Exception {
		update("member.updateMember", map);
	}
	
	public void deleteMember(Map<String, Object> map) throws Exception {
		delete("member.deleteMember", map);
	}
	
}
