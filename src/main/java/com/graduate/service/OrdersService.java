package com.graduate.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduate.bean.Orders;
import com.graduate.mapper.OrdersMapper;
import com.graduate.util.StringUtils;

/**
 * 订单管理Service
 */
@Service
public class OrdersService{

	@Autowired
    private OrdersMapper ordersMapper;
    //返回所查目标的所有数据
	public Orders get(String id) {
		return ordersMapper.get(id);
	}
	
	public List<Orders> findList(Orders orders) {
		return ordersMapper.findList(orders);
	}
	//保存（修改、新增）数据
	public int save(Orders orders) {
		if(StringUtils.isBlank(orders.getId())) {
			//UUID自动生成唯一id
    		orders.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		return ordersMapper.insert(orders);
    	} else {
    		return ordersMapper.update(orders);
    	}
	}
	//删除
	public int delete(String id) {
		return ordersMapper.delete(id);
	}
	//
	public Map<String, String> czorder(String begintime, String endtime) {
		Orders param = new Orders();
		param.setBegintime(begintime);
		param.setEndtime(endtime);
		param.setQxstate("0");
		List<Orders> list = this.findList(param);
		Map<String, String> map = new HashMap<String, String>();
		for(Orders orders : list) {
			map.put(orders.getCarid(), "1");
		}
		return map;
	}
	
}