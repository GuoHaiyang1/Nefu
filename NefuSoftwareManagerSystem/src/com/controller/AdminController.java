package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.User;
import com.service.UserService;
import com.util.MD5Util;



@Controller
@RequestMapping("/admin")
public class AdminController {
@Autowired
private UserService userService;
@GetMapping("/adminMange")
public void adminManager(HttpSession httpSession)
{
	List<User> users=userService.listUsers();
	httpSession.setAttribute("users", users);
	
}
@GetMapping("/updateUser/{user_id}")
public String updateUser(@PathVariable int user_id,HttpSession httpSession)
{
  User userModify=userService.find(user_id);
  httpSession.setAttribute("userModify", userModify);
  return "admin/updateUser";
}
@PostMapping("/updateUser")
public String updateUserModify(User user,HttpSession httpSession,RedirectAttributes redirectAttributes) {
	User user1=(User) httpSession.getAttribute("userModify");
	if(!(user1.getPassword().equals(user.getPassword())))
	{
		String ps=user.getPassword();
		user.setPassword(MD5Util.string2MD5(ps));
		
	}
	userService.userUpdate(user, user1.getUser_id());
	String adminModifyMessage="修改完成";
	redirectAttributes.addFlashAttribute("adminModifyMessage",adminModifyMessage);
	return "redirect:adminMange";
}
@GetMapping("/updateAuthority/{user_id}")
public String updateAythority(@PathVariable int user_id,RedirectAttributes redirectAttributes)
{
	String updateAythorityMessage="修改权限成功";
	userService.updateAythority(user_id);
	redirectAttributes.addFlashAttribute("updateAythorityMessage",updateAythorityMessage);
	return "redirect:/admin/adminMange";
}
@GetMapping("deleteUser/{user_id}")
public String deleteUser(@PathVariable int user_id,RedirectAttributes redirectAttributes)
{
	String deleteUseMessage="删除用户成功";
	userService.deleteUser(user_id);
	redirectAttributes.addFlashAttribute("deleteUseMessage",deleteUseMessage);
	return "redirect:/admin/adminMange";
}
@GetMapping("/addUser")
public void addUserget() {
	
}
@PostMapping("/addUser")
public String addUser(User user,RedirectAttributes redirectAttributes) {
	userService.persist(user);
	String addUserMessage="添加用户成功";
	redirectAttributes.addFlashAttribute("addUserMessage",addUserMessage);
	return "redirect:/admin/adminMange";
}
}
