package com.graduate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.util.StringUtils;
import com.graduate.bean.Repair;
import com.graduate.service.CarService;
import com.graduate.service.RepairService;

/**
 * 车辆维修Controller
 */
@Controller
@RequestMapping(value = "/graduate/repair")
public class RepairController {

	@Autowired
	private RepairService repairService;
	@Autowired
	private CarService carService;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(Repair repair, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("repairPage");
		List<Repair> datalist = repairService.findList(repair); 
		mv.addObject("datalist", datalist).addObject("param", repair).addObject("carlist", carService.findAll());
		return mv;
	}

	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("repairForm");
		String id = request.getParameter("id");
		Repair repair = new Repair();
		if(StringUtils.isNotBlank(id)) {
    		repair = repairService.get(id);
    	}
    	mv.addObject("repair", repair).addObject("carlist", carService.findAll());
		return mv;
	}

	@RequestMapping(value = "save")
	public String save(Repair repair) {
		repairService.save(repair);
		return "redirect:/graduate/repair/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        repairService.delete(request.getParameter("id"));
        return "redirect:/graduate/repair/list";
	}

}