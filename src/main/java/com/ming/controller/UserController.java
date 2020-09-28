package com.ming.controller;
import com.ming.pojo.User;
import com.ming.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-09-21 21:33
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public ModelAndView login(@RequestParam("name") String username, @RequestParam("pass") String password, @RequestParam("property") String grade, HttpServletRequest request) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setGrade(Integer.parseInt(grade));
        User loginUser = userService.login(user);
        System.out.println(loginUser.toString());

        ModelAndView mv = new ModelAndView();
        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", loginUser);

            switch (loginUser.getGrade()) {
                case 0: {
                    mv.setViewName("/user");
                    break;
                }
                case 1: {
                    mv.setViewName("/lawyer");
                    break;
                }
                default: {
                    mv.setViewName("/manager");
                    break;
                }
            }
        } else {
            //登录失败
            //提示信息
            mv.addObject("login_msg", "用户名或密码错误！");
            mv.setViewName("login");
            //跳转登录页面
        }

        return mv;
    }

}
