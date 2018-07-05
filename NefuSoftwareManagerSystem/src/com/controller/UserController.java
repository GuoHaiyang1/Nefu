package com.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.User;
import com.service.UserService;
import com.util.MD5Util;
@Validated
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	//用户注册
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(@Valid User user,RedirectAttributes attributes) {
		User user2=userService.getUser(user.getUsername(),MD5Util.string2MD5(user.getPassword()));
		String result="该用户已存在";
		if(user2==null) {
		if(user.getUser_title().equals("teacher")) {
			user.setAuthority(1);
		}else if(user.getUser_title().equals("director")) {
			user.setAuthority(2);
		}else {
			return "redirect:register";
		}
		String a=user.getPassword();
		user.setPassword(MD5Util.string2MD5(a));
		userService.persist(user);
		}else {
			attributes.addFlashAttribute("result",result);
			return "redirect:register";
			
		}
		return "redirect:login";
	}
	
	//用户登录
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(String username,String password,RedirectAttributes attributes,HttpSession session) {
		String ps=password;
		password=MD5Util.string2MD5(ps);
		User user=userService.getUser(username, password);
		String result="用户名或密码错误";
		if(user==null) {
			attributes.addFlashAttribute("result",result);
			return "redirect:login";
		}
		else {
			session.setAttribute("user", user);
			attributes.addFlashAttribute("user",user);
		}
		return "redirect:index";
	}
	
	//主页面选项
	@GetMapping("/index")
	public void index() {}
	
	
	//退出系统将sesssion清空
	@GetMapping("/return")
		public String quit(HttpSession session) {
			session.invalidate();
			return "redirect:login";
		}
	
	@GetMapping("/userManager")
	public void userManager(){
	}
	@PostMapping("/userManager")
	public String userManagerpost(User user1,@SessionAttribute User user,RedirectAttributes redirectAttributes,HttpSession session){
		if(!user1.getPassword().equals(user.getPassword()))
		{	
		String ps=MD5Util.string2MD5(user1.getPassword());
		user1.setPassword(ps);
		}
		userService.update(user1,user);
		String succeedmessage="保存成功";
		redirectAttributes.addFlashAttribute("succeedmessage",succeedmessage);
		User user3=userService.find(user.getUser_id());
		session.setAttribute("user", user3);
		return "redirect:userManager";
	}
}
