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
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = memberDAO.viewMember(map);
		resultMap.put("map", tempMap);
		return resultMap;
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
<<<<<<< HEAD

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
=======
	
	@Override
	public Map<String, Object> milesList3(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = memberDAO.milesList3(map);
		resultMap.put("map2", tempMap);
		return resultMap;
	}
	
	@Override
	public Map<String, Object> milesList2(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = memberDAO.milesList2(map);
		resultMap.put("map2", tempMap);
		return resultMap;
>>>>>>> 7d5063b6cd0b2d47c1c35bfd33cf06174a90255f
	}
}