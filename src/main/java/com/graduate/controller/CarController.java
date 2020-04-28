package com.graduate.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.bean.Car;
import com.graduate.bean.User;
import com.graduate.service.CarService;
import com.graduate.service.OrdersService;
import com.graduate.util.DateUtils;
import com.graduate.util.JsonMsg;
import com.graduate.util.StringUtils;

/**
 * 车辆Controller
 */
@Controller
@RequestMapping(value = "/graduate/car")
public class CarController {

	@Autowired
	private CarService carService;
	@Autowired
	private OrdersService ordersService;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(Car car, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("carPage");// 返回carpage视图
		List<Car> datalist = carService.findList(car); //用service层中的方法返回车辆列表
		mv.addObject("datalist", datalist).addObject("param", car);
		return mv;
	}

	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("carForm");
		String id = request.getParameter("id");
		Car car = new Car();
		if(StringUtils.isNotBlank(id)) {
    		car = carService.get(id);
    	}
    	mv.addObject("car", car);
		return mv;
	}

	@RequestMapping(value = "save")
	public String save(Car car) {
		carService.save(car);
		return "redirect:/graduate/car/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        carService.delete(request.getParameter("id"));
        return "redirect:/graduate/car/list";
	}
	
	// 租赁列表
	@RequestMapping(value = "/rentlist")
	public ModelAndView rentlist(Car car, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("rentlist");         // 实例化，并返回到rentlist视图
		List<Car> datalist = carService.rentlist(car);         // 调用service层中的rentlist方法
		mv.addObject("datalist", datalist).addObject("param", car);         //将对象添加到模型中
		return mv;
	}
	
	@RequestMapping(value = "rentform")
	public ModelAndView rentform(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("rentForm");      // 返回rentform视图
		Car car = new Car();
		try {
			String brand = request.getParameter("brand");
			car.setBrand(new String(brand.getBytes("ISO-8859-1"),"UTF-8"));
			String cartype = request.getParameter("cartype");
			car.setCartype(new String(cartype.getBytes("ISO-8859-1"),"UTF-8"));
			String price = request.getParameter("price");
			car.setPrice(new String(price.getBytes("ISO-8859-1"),"UTF-8"));
			String seat = request.getParameter("seat");
			car.setSeat(new String(seat.getBytes("ISO-8859-1"),"UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
    	mv.addObject("car", car);        //将用户选择的车辆添加到模型中
		return mv;
	}
	
	@RequestMapping(value = "optrent")
	@ResponseBody
	public JsonMsg optrent(HttpServletRequest request, Car car) {
		User user = (User) request.getSession().getAttribute("currentUser");
		if(StringUtils.isBlank(user.getYajin()) || "0".equals(user.getYajin())) 
			return JsonMsg.fail("您未缴纳押金，请到个人信息中缴纳押金后，再租用车辆");
		if("1".equals(user.getYjstate())) 
			return JsonMsg.fail("您的押金已冻结，无法租用车辆");
		List<Car> datalist = new ArrayList<Car>();		// 获得符合条件的车辆
		car.setBrandq(car.getBrand());
		car.setCartypeq(car.getCartype());
		List<Car> carlist = carService.findList(car);		// 获得该时间段已租用的车辆id
		String begintime = request.getParameter("begintime");
		String endtime = request.getParameter("endtime");
		Map<String, String> map = ordersService.czorder(begintime, endtime);
		for(Car entry : carlist) {			// 获得该时间段未租用的且符合条件的车辆
			if(StringUtils.isBlank(map.get(entry.getId()))) datalist.add(entry);
		}
		if(datalist == null || datalist.isEmpty() ) 
			return JsonMsg.fail("抱歉，该时间段您选择的车型已全部租完，请选择其他车辆或其他时间段");
		int index = (int)(0+Math.random()*datalist.size());
		return JsonMsg.success().addInfo(datalist.get(index));
	}
	
	@RequestMapping(value = "xrent")
	public ModelAndView xrent(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("rentForm");
		Car car = new Car();
		try {
			String id = request.getParameter("id");
			String time = request.getParameter("time");
			car = carService.get(id);
			Date date = DateUtils.parseDate(time);
			Calendar c = Calendar.getInstance();  
            c.setTime(date);  
            c.add(Calendar.DAY_OF_MONTH, 1); 
            date = c.getTime();
			mv.addObject("time", DateUtils.formatDate(date, "yyyy-MM-dd"));
		} catch (Exception e) {
			e.printStackTrace();
		}
    	mv.addObject("car", car);
		return mv;
	}
} 