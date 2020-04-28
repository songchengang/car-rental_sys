package com.graduate.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduate.util.StringUtils;
import com.graduate.bean.User;
import com.graduate.mapper.UserMapper;

/**
 * 用户管理Service
 */
@Service
public class UserService{

	@Autowired
    private UserMapper userMapper;
    
	public User get(String id) {
		return userMapper.get(id);
	}
	
	public List<User> findList(User user) {
		return userMapper.findList(user);
	}
	
	public int save(User user) {
		if(StringUtils.isBlank(user.getId())) {
			//随机生成用户id
    		user.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		//设定初始押金、信用
    		user.setYjstate("0");
    		user.setXinyong("0");
    		return userMapper.insert(user);
    	} else {
    		return userMapper.update(user);
    	}
	}
	
	public int delete(String id) {
		return userMapper.delete(id);
	}
	
	public User identity(String name, String password) {
    	List<User> list = userMapper.identity(name, password);
    	if(list != null && !list.isEmpty()) {
    		return list.get(0);
    	}
    	return new User();
    }
	
}