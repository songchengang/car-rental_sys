package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Car;

/**
 * 车辆DAO接口
 */
public interface CarMapper {

	public Car get(@Param("id") String id);
	
	public List<Car> findList(@Param("car") Car entity);
	
	public int insert(Car entity);
	
	public int update(Car entity);
	
	public int delete(@Param("id") String id);
	
	public List<Car> rentlist(@Param("car") Car entity);
	
}