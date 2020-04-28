package com.graduate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.util.JsonMsg;
import com.graduate.util.StringUtils;
import com.graduate.bean.User;
import com.graduate.service.UserService;

/**
 * 用户管理Controller
 */
@Controller
@RequestMapping(value = "/graduate/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("userPage");// 实例化，并返回到userPage视图
		List<User> datalist = userService.findList(user); // 调用service层中的findList方法
		mv.addObject("datalist", datalist).addObject("param", user);//将对象添加到模型中
		return mv;
	}

	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("userForm");// 跳转到userForm视图
		String id = request.getParameter("id");// 得到用户id
		String auth = request.getParameter("auth");// 得到用户权限（会员或员工）
		User user = new User();
		user.setAuth(auth);
		if(StringUtils.isNotBlank(id)) {//若用户id不为空，则得到用户信息
    		user = userService.get(id);
    	}
    	mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = "save")
	public String save(HttpServletRequest request, User user) {
		userService.save(user);// 调用service层中的save方法
		String flag = request.getParameter("flag");
		if(StringUtils.isNotBlank(flag)) {
			request.getSession().setAttribute("currentUser", user);
			return "redirect:/graduate/user/person";
		} else {
			return "redirect:/graduate/user/list?auth="+user.getAuth();
		}
	}
	
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        userService.delete(request.getParameter("id"));
        return "redirect:/graduate/user/list?auth="+request.getParameter("auth");
	}
	
	@RequestMapping(value = "updateState")
	public String updateState(HttpServletRequest request) {
		User user = userService.get(request.getParameter("id"));//得到用户信息
		user.setYjstate(request.getParameter("state"));//设定押金状态（解冻或冻结）
		userService.save(user);//保存用户信息
		return "redirect:/graduate/user/list?auth="+user.getAuth();
	}
	
	@RequestMapping(value = "person")
	public String person(HttpServletRequest request) {
		return "person";
	}
	
	@RequestMapping(value = "returnyj")
	@ResponseBody
	public JsonMsg returnyj(HttpServletRequest request) {
		User user = userService.get(request.getParameter("id"));//得到用户信息
		if("1".equals(user.getYjstate())) {//判断押金是否可退
			return JsonMsg.fail("押金为冻结状态，不可退还！");
		}
		user.setYajin("0");//重新设定押金状态为未交
		user.setYjtype("");//重新设定押金付款方式
		userService.save(user);
		request.getSession().setAttribute("currentUser", user);
		return JsonMsg.success();
	}

	@RequestMapping(value = "/payyj")
	public String payyj(HttpServletRequest request) {
		return "payyj";
	}
	
	@RequestMapping(value = "pay")
	public String pay(HttpServletRequest request) {
		User user = userService.get(request.getParameter("id"));//得到用户id
		user.setYajin(request.getParameter("yajin"));//押金金额
		user.setYjtype(request.getParameter("yjtype"));//押金付款方式
		userService.save(user);
		request.getSession().setAttribute("currentUser", user);
		return "redirect:/graduate/user/person";
	}
}