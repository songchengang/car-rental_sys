package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Orders;

/**
 * 订单管理DAO接口
 */
public interface OrdersMapper {

	public Orders get(@Param("id") String id);
	
	public List<Orders> findList(@Param("orders") Orders entity);
	
	public int insert(Orders entity);
	
	public int update(Orders entity);
	
	public int delete(@Param("id") String id);
	
}