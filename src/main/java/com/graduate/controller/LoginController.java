package com.graduate.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.bean.User;
import com.graduate.service.UserService;
import com.graduate.util.JsonMsg;

@Controller
@RequestMapping(value = "/graduate")
public class LoginController {

	@Autowired
    UserService userService;
	
    /**
     * 登录：跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }

    /**
     * 对登录页面输入的用户名和密码做简单的判断
     * @param request
     * @return
     */
    @RequestMapping(value = "/dologin")
    @ResponseBody
    public JsonMsg dologin(HttpServletRequest request){
        String username = request.getParameter("username");//得到输入的用户名
        String password = request.getParameter("password");//得到输入的用户密码
        User user = userService.identity(username, password);//与数据库进行比对
        if (user == null || user.getId() == null){
            return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
        }
        request.getSession().setAttribute("currentUser", user);
        return JsonMsg.success();
    }

    /**
     * 退出登录：从主页面跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request){
    	request.getSession().removeAttribute("currentUser");
        return "login";
    }

    /**
     * 注册页面
     * @return
     */
    @RequestMapping(value = "/register")
    public ModelAndView register() {
    	ModelAndView mv = new ModelAndView("register");
    	return mv;
    }
    
    @RequestMapping(value = "/doRegister")
    @ResponseBody
    public JsonMsg doRegister(User user, HttpServletRequest request){
    	try {
    		user.setAuth("2"); //把用户权限设为会员
    		int res = userService.save(user);//将用户信息保存到数据库中
            if (res == 1){
            	request.getSession().setAttribute("currentUser", user);
                return JsonMsg.success();
            }else {
                return JsonMsg.fail();
            }
		} catch (Exception e) {//抛出异常
			e.printStackTrace();
			return JsonMsg.fail();
		}
    }
}
