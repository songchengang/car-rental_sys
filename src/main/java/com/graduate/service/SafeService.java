package com.graduate.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.graduate.util.StringUtils;
import com.graduate.bean.Safe;
import com.graduate.mapper.SafeMapper;

/**
 * 车辆保险Service
 */
@Service
public class SafeService{

	@Autowired
    private SafeMapper safeMapper;
    
	public Safe get(String id) {
		return safeMapper.get(id);
	}
	
	public List<Safe> findList(Safe safe) {
		return safeMapper.findList(safe);
	}
	
	public int save(Safe safe) {
		if(StringUtils.isBlank(safe.getId())) {
    		safe.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		return safeMapper.insert(safe);
    	} else {
    		return safeMapper.update(safe);
    	}
	}
	
	public int delete(String id) {
		return safeMapper.delete(id);
	}
	
}