package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Repair;

/**
 * 车辆维修DAO接口
 */
public interface RepairMapper {

	public Repair get(@Param("id") String id);
	
	public List<Repair> findList(@Param("repair") Repair entity);
	
	public int insert(Repair entity);
	
	public int update(Repair entity);
	
	public int delete(@Param("id") String id);
	
}