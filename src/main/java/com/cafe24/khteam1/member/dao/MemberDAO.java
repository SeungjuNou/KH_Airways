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
}
