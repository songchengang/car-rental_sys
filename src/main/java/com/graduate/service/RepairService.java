package com.graduate.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.graduate.util.StringUtils;
import com.graduate.bean.Repair;
import com.graduate.mapper.RepairMapper;

/**
 * 车辆维修Service
 */
@Service
public class RepairService{

	@Autowired
    private RepairMapper repairMapper;
    
	public Repair get(String id) {
		return repairMapper.get(id);
	}
	
	public List<Repair> findList(Repair repair) {
		return repairMapper.findList(repair);
	}
	
	public int save(Repair repair) {
		if(StringUtils.isBlank(repair.getId())) {
    		repair.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		return repairMapper.insert(repair);
    	} else {
    		return repairMapper.update(repair);
    	}
	}
	
	public int delete(String id) {
		return repairMapper.delete(id);
	}
	
}