package com.zxjl.controller;

import bean.Content;
import bean.Page;
import bean.User;
import dao.UserDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.PageService;
import service.UserService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
public class UserControl extends HttpServlet {
    UserService userService=new UserService();
    UserDao userDao=new UserDao();
    @RequestMapping("/login")
    public ModelAndView login(User user) {
        String viewName1="login";
        String viewName2="fancy";
        ModelAndView modelAndView1=new ModelAndView(viewName1);
        ModelAndView modelAndView2=new ModelAndView(viewName2);
        User userDB = userDao.Validate(user);
        if (userDB!= null) {
            modelAndView2.addObject("user",userDB);
            PageService pageService=new PageService();
            Page<Content> page1=pageService.getPage("1","4");
            modelAndView2.addObject("page",page1);
            return modelAndView2;

        } else {
            modelAndView1.addObject("userMsg","用户名或密码错误！");
           return modelAndView1;
    }
    }
    @RequestMapping("/register")
    public ModelAndView register(User user){
        String viewName1="register";
        String viewName2="registerSuccess";
        ModelAndView modelAndView1=new ModelAndView(viewName1);
        ModelAndView modelAndView2=new ModelAndView(viewName2);
        boolean b=userService.register(user);
        if (b==false){
            modelAndView1.addObject("user",user);
            modelAndView1.addObject("userMsg","用户已存在！");
            return modelAndView1;
        }else {
            modelAndView2.addObject("user",user);
            return modelAndView2;
        }
    }
    @RequestMapping(value = "/user",method = RequestMethod.GET)
      public String editInformation(Map<String,Object> map){
        map.put("user",new User());
        return "loginSuccess";
      }
      @RequestMapping("/editInformation")
      public  String editInformation(User user){
        UserDao userDao=new UserDao();
        boolean b=userDao.saveUser(user);
        if (b){
        user.setUserMsg("资料保存成功！");
        return  "personal";}
        else {
            user.setUserMsg("资料保存失败！");
            return "personal";
        }
      }
}
