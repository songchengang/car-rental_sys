package com.graduate.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.graduate.util.StringUtils;
import com.graduate.bean.Car;
import com.graduate.mapper.CarMapper;

/**
 * 车辆Service
 */
@Service
public class CarService{

	@Autowired
    private CarMapper carMapper;
    
	public Car get(String id) {
		return carMapper.get(id);
	}
	
	public List<Car> findList(Car car) {
		return carMapper.findList(car);
	}
	
	public int save(Car car) {
		if(StringUtils.isBlank(car.getId())) {
    		car.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		car.setState("0");
    		return carMapper.insert(car);
    	} else {
    		return carMapper.update(car);
    	}
	}
	
	public int delete(String id) {
		return carMapper.delete(id);
	}
	
	public List<Car> findAll() {
		return carMapper.findList(new Car());
	}
	
	public List<Car> rentlist(Car car) {
		return carMapper.rentlist(car);
	}
}