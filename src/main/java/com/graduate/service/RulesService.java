package com.graduate.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.graduate.util.StringUtils;
import com.graduate.bean.Rules;
import com.graduate.mapper.RulesMapper;

/**
 * 车辆违章Service
 */
@Service
public class RulesService{

	@Autowired
    private RulesMapper rulesMapper;
    
	public Rules get(String id) {
		return rulesMapper.get(id);
	}
	
	public List<Rules> findList(Rules rules) {
		return rulesMapper.findList(rules);
	}
	
	public int save(Rules rules) {
		if(StringUtils.isBlank(rules.getId())) {
    		rules.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		return rulesMapper.insert(rules);
    	} else {
    		return rulesMapper.update(rules);
    	}
	}
	
	public int delete(String id) {
		return rulesMapper.delete(id);
	}
	
}