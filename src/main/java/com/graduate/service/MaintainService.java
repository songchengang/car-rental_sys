package com.graduate.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.graduate.util.StringUtils;
import com.graduate.bean.Maintain;
import com.graduate.mapper.MaintainMapper;

/**
 * 车辆保养Service
 */
@Service
public class MaintainService{

	@Autowired
    private MaintainMapper maintainMapper;
    
	public Maintain get(String id) {
		return maintainMapper.get(id);
	}
	
	public List<Maintain> findList(Maintain maintain) {
		return maintainMapper.findList(maintain);
	}
	
	public int save(Maintain maintain) {
		if(StringUtils.isBlank(maintain.getId())) {
    		maintain.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		return maintainMapper.insert(maintain);
    	} else {
    		return maintainMapper.update(maintain);
    	}
	}
	
	public int delete(String id) {
		return maintainMapper.delete(id);
	}
	
}