package com.cafe24.khteam1.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cafe24.khteam1.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;

	@Override
	public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception {
		return memberDAO.memberList(map);
	}

	@Override 
	public List<Map<String, Object>> findMemberList(Map<String, Object> map) throws Exception {
		return memberDAO.findMemberList(map);
	}
	
	@Override
	public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		memberDAO.insertMember(map);
	}

	@Override
	public Map<String, Object> viewMember(Map<String, Object> map) throws Exception {
		return memberDAO.viewMember(map);
	}

	@Override
	public void updateMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		memberDAO.updateMember(map);
	}
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		memberDAO.deleteMember(map);
	}

	@Override
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> member = memberDAO.loginCheck(map);
		result.put("map", member);
		return result;
	}
	
	@Override
	public String checkId(Map<String, Object> map) throws Exception {
		String count = memberDAO.checkId(map); 
		String result = null;
		if(count.equals("0") || count == null) {
			result = "";
		} else {
			result = "n";
		}
		log.debug(result);
		return result;
	}	
}