package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Safe;

/**
 * 车辆保险DAO接口
 */
public interface SafeMapper {

	public Safe get(@Param("id") String id);
	
	public List<Safe> findList(@Param("safe") Safe entity);
	
	public int insert(Safe entity);
	
	public int update(Safe entity);
	
	public int delete(@Param("id") String id);
	
}