package com.graduate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.bean.Safe;
import com.graduate.bean.User;
import com.graduate.service.CarService;
import com.graduate.service.SafeService;
import com.graduate.util.StringUtils;

/**
 * 车辆保险Controller
 */
@Controller
@RequestMapping(value = "/graduate/safe")
public class SafeController {

	@Autowired
	private SafeService safeService;
	@Autowired
	private CarService carService;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(Safe safe, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("safePage");
		List<Safe> datalist = safeService.findList(safe); 
		mv.addObject("datalist", datalist).addObject("param", safe).addObject("carlist", carService.findAll());
		return mv;
	}

	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("safeForm");
		String id = request.getParameter("id");
		Safe safe = new Safe();
		if(StringUtils.isNotBlank(id)) {
    		safe = safeService.get(id);
    	}
    	mv.addObject("safe", safe).addObject("carlist", carService.findAll());
		return mv;
	}

	@RequestMapping(value = "save")
	public String save(HttpServletRequest request, Safe safe) {
		if(StringUtils.isBlank(safe.getUserid())) {
			User user = (User) request.getSession().getAttribute("currentUser");
			safe.setUserid(user.getId());
			safe.setUsername(user.getName());
		}
		safeService.save(safe);
		return "redirect:/graduate/safe/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        safeService.delete(request.getParameter("id"));
        return "redirect:/graduate/safe/list";
	}

}