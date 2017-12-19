package com.cafe24.khteam1.common.service;


import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cafe24.khteam1.common.dao.CommonDAO;


 
@Service("commonService")
public class CommonServiceImpl implements CommonService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="commonDAO") 
    private CommonDAO commonDAO;
    
    @Override
    public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
        return commonDAO.selectFileInfo(map);
    }
    
    @Override
    public Map<String, Object> selectFile(Map<String, Object> map) throws Exception {
        return commonDAO.selectFile(map);
    }
    
    @Override
    public void insertFile(Map<String, Object> map) throws Exception {
        commonDAO.insertFile(map);
    }

}

