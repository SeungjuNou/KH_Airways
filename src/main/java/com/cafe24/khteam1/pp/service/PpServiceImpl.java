package com.cafe24.khteam1.pp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cafe24.khteam1.common.util.FileUtils;
import com.cafe24.khteam1.pp.dao.PpDAO;
import com.cafe24.khteam1.sample.dao.SampleDAO;

@Service("ppService")
public class PpServiceImpl implements PpService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "ppDAO")
	private PpDAO ppDAO;
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> adminUnapprovedList(Map<String, Object> map) throws Exception {
		return ppDAO.adminUnapprovedList(map);
	}
	

	@Override
	public List<Map<String, Object>> adminApprovedList(Map<String, Object> map) throws Exception {
		return ppDAO.adminApprovedList(map);
	}

	@Override
	public void ppModify(Map<String, Object> map, HttpServletRequest request) throws Exception {
		ppDAO.ppModify(map);
		
	}
	@Override
	public void ppModifyApplyBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		ppDAO.ppModifyApplyBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			ppDAO.ppModifyApply(list.get(i));
		}
	}


	@Override
	public List<Map<String, Object>> ppModifyApplyList(Map<String, Object> map) throws Exception {
		return ppDAO.ppModifyApplyList(map);
	}


	@Override
	public Map<String, Object> ppModifyApplyView(Map<String, Object> map) throws Exception {
		 Map<String, Object> resultMap = new HashMap<String,Object>();
		    Map<String, Object> tempMap = ppDAO.ppModifyApplyView(map);
		    resultMap.put("map", tempMap);
		    log.debug(sampleDAO.selectFileList(map));
		    List<Map<String,Object>> list = sampleDAO.selectFileList(map);
		    resultMap.put("list", list);
		     
		    return resultMap;
		}
}
	


