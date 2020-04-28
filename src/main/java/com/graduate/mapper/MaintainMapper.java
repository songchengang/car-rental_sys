package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Maintain;

/**
 * 车辆保养DAO接口
 */
public interface MaintainMapper {

	public Maintain get(@Param("id") String id);
	
	public List<Maintain> findList(@Param("maintain") Maintain entity);
	
	public int insert(Maintain entity);
	
	public int update(Maintain entity);
	
	public int delete(@Param("id") String id);
	
}