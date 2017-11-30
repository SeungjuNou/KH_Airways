package com.cafe24.khteam1.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cafe24.khteam1.member.dao.MemberDAO;
import com.cafe24.khteam1.member.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;

	@Override
	public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> findMemberList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		memberDAO.insertMember(map);
	}

	@Override
	public Map<String, Object> viewMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> member = memberDAO.loginCheck(map);
		result.put("map", member);
		return result;
	}
}