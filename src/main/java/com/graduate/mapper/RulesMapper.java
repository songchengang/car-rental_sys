package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Rules;

/**
 * 车辆违章DAO接口
 */
public interface RulesMapper {

	public Rules get(@Param("id") String id);
	
	public List<Rules> findList(@Param("rules") Rules entity);
	
	public int insert(Rules entity);
	
	public int update(Rules entity);
	
	public int delete(@Param("id") String id);
	
}