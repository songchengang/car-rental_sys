package com.graduate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.util.StringUtils;
import com.graduate.bean.Maintain;
import com.graduate.service.CarService;
import com.graduate.service.MaintainService;

/**
 * 车辆保养Controller
 */
@Controller
@RequestMapping(value = "/graduate/maintain")
public class MaintainController {

	@Autowired
	private MaintainService maintainService;
	@Autowired
	private CarService carService;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(Maintain maintain, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("maintainPage");
		List<Maintain> datalist = maintainService.findList(maintain); 
		mv.addObject("datalist", datalist).addObject("param", maintain).addObject("carlist", carService.findAll());
		return mv;
	}

	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("maintainForm");
		String id = request.getParameter("id");
		Maintain maintain = new Maintain();
		if(StringUtils.isNotBlank(id)) {
    		maintain = maintainService.get(id);
    	}
    	mv.addObject("maintain", maintain).addObject("carlist", carService.findAll());
		return mv;
	}

	@RequestMapping(value = "save")
	public String save(Maintain maintain) {
		maintainService.save(maintain);
		return "redirect:/graduate/maintain/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        maintainService.delete(request.getParameter("id"));
        return "redirect:/graduate/maintain/list";
	}

}