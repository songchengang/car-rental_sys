package com.graduate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.util.StringUtils;
import com.graduate.bean.Rules;
import com.graduate.service.CarService;
import com.graduate.service.RulesService;

/**
 * 车辆违章Controller
 */
@Controller
@RequestMapping(value = "/graduate/rules")
public class RulesController {

	@Autowired
	private RulesService rulesService;
	@Autowired
	private CarService carService;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(Rules rules, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("rulesPage");
		List<Rules> datalist = rulesService.findList(rules); 
		mv.addObject("datalist", datalist).addObject("param", rules).addObject("carlist", carService.findAll());
		return mv;
	}

	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("rulesForm");
		String id = request.getParameter("id");
		Rules rules = new Rules();
		if(StringUtils.isNotBlank(id)) {
    		rules = rulesService.get(id);
    	}
    	mv.addObject("rules", rules).addObject("carlist", carService.findAll());
		return mv;
	}

	@RequestMapping(value = "save")
	public String save(Rules rules) {
		rulesService.save(rules);
		return "redirect:/graduate/rules/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        rulesService.delete(request.getParameter("id"));
        return "redirect:/graduate/rules/list";
	}

}