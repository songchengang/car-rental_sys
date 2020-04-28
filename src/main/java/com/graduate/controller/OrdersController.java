package com.graduate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//import com.graduate.bean.Car;
import com.graduate.bean.Orders;
//import com.graduate.bean.Safe;
import com.graduate.bean.User;
import com.graduate.service.CarService;
import com.graduate.service.OrdersService;
import com.graduate.service.SafeService;
import com.graduate.service.UserService;
import com.graduate.util.DateUtils;
import com.graduate.util.JsonMsg;
import com.graduate.util.StringUtils;

/**
 * 订单管理Controller
 */
@Controller
@RequestMapping(value = "/graduate/orders")
public class OrdersController {

	@Autowired
	private OrdersService ordersService;
	@Autowired
	private CarService carService;
	@Autowired
	private SafeService safeService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(Orders orders, HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("currentUser");
		//生成租赁人id（只需要生成会员的id即可）
		if("2".equals(user.getAuth())) {
			orders.setCreateid(user.getId());
		}
		ModelAndView mv = new ModelAndView("ordersPage");
		List<Orders> datalist = ordersService.findList(orders); 
		mv.addObject("datalist", datalist).addObject("param", orders).addObject("carlist", carService.findAll());
		return mv;
	}
//	@RequestMapping(value = "form")
//	public ModelAndView form(HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView("ordersForm");
//		String id = request.getParameter("id");
//		Orders orders = new Orders();
//		if(StringUtils.isNotBlank(id)) {
//    		orders = ordersService.get(id);
//    	}
//    	mv.addObject("orders", orders);
//		return mv;
//	}

	@RequestMapping(value = "save")
	public String save(HttpServletRequest request, Orders orders) {
		User user = (User) request.getSession().getAttribute("currentUser");
		orders.setCreateid(user.getId());
		orders.setCreatename(user.getName());
		orders.setCreatetime(DateUtils.getDateTime());
		orders.setQxstate("0");       // 车辆租用状态修改
		ordersService.save(orders);
		user.setXinyong(Integer.parseInt(user.getXinyong())+10+"");		// 修改信用
		userService.save(user);
		request.getSession().setAttribute("currentUser", user);
		return "redirect:/graduate/orders/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        ordersService.delete(request.getParameter("id"));
        return "redirect:/graduate/orders/list";
	}
	//归还，取消（状态变更）
	@RequestMapping(value = "updateState")
	public String updateState(HttpServletRequest request) {
		Orders orders = ordersService.get(request.getParameter("id"));      //获取订单编号
		orders.setQxstate(request.getParameter("state"));      //修改订单状态
		ordersService.save(orders);
		return "redirect:/graduate/orders/list";    //重定向到订单列表
	}
	//评价
	@RequestMapping(value = "setpj")
	@ResponseBody
	public JsonMsg setpj(HttpServletRequest request) {
		Orders orders = ordersService.get(request.getParameter("id"));      //获取订单编号
		orders.setEvaluate(request.getParameter("evaluate"));      //生成评价内容
		ordersService.save(orders);
		return JsonMsg.success();
	}
}