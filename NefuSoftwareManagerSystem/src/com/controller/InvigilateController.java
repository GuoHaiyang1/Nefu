package com.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.UserInvigilateDao;
import com.entity.Invigilate;
import com.entity.User;
import com.entity.UserInvigilate;
import com.service.InvigilateService;
import com.service.UserInvigilateService;
import com.service.UserService;

@Controller
@Validated
@RequestMapping("/admin")
public class InvigilateController {
@Autowired
private InvigilateService invigilateService;
@Autowired
private UserService userService;
@Autowired
private UserInvigilateDao userInvigilateDao;
@Autowired
private UserInvigilateService userInvigilateService;
@GetMapping("/invigilate")
public void invigilateInformation(HttpSession httpSession)
{
	List<Invigilate> invigilates=invigilateService.invigilateList();
	httpSession.setAttribute("invigilates", invigilates);
}
@GetMapping("/addInvigilate")
public void addInvigilate() {
	
}
@PostMapping("/addInvigilate")
public String addInvigilateImformation(@NotNull String coursename,@NotNull String address,@Min(2) @Max(4) int count,int state,@NotNull String startTime,@NotNull String endTime,RedirectAttributes redirectAttributes,@SessionAttribute List<Invigilate> invigilates) 
{
	Date date1=new Date();
	DateFormat smt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	try {
		date1=smt.parse(startTime);
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	Date date2=new Date();
	try {
		date2=smt.parse(endTime);
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(invigilates!=null)
	{
		if(!invigilates.isEmpty())
		{
			for(Invigilate invigilate:invigilates)
			{
				if(invigilate.getAddress().equals(address))
				{
					if(!(invigilate.getEndTime().compareTo(date1)<=0||invigilate.getStartTime().compareTo(date2)>=0))
					{
						String addInvigilateError="考试地点时间分配有重复，添加考试失败";
						redirectAttributes.addFlashAttribute("addInvigilateError",addInvigilateError);
						return "redirect:invigilate";
					}
				}
			}
		}
	}
	invigilateService.addInvigilate(coursename,address,count,state,date1,date2);
	String addInvigilateMessage="成功添加考试信息";
	redirectAttributes.addFlashAttribute("addInvigilateMessage",addInvigilateMessage);
	return "redirect:invigilate";
	
}
@GetMapping("invigilateHander/{id}")
public String invigilateHander(@PathVariable int id,RedirectAttributes redirectAttributes) {
	Invigilate invigilateHandeInformation=invigilateService.findInvigilateInformation(id);
	List<User> invigilateUsers=userService.listUserOrder();
	redirectAttributes.addFlashAttribute("invigilateHandeInformation",invigilateHandeInformation);
	redirectAttributes.addFlashAttribute("invigilateUsers",invigilateUsers);
    return "redirect:/admin/invihilateHand";
}
@GetMapping("/invihilateHand")
public void invigilateHand() {
	
}
@PostMapping("/invihilateHand")
public String invigilateHandPost(@RequestParam("users") int[] userids,int id,int sendUser,RedirectAttributes redirectAttributes) {
List<UserInvigilate> invigilates=invigilateService.listUserInvigilate();
Invigilate invigilate1=invigilateService.findInvigilateInformation(id);
if(invigilate1.getCount()!=userids.length)
{
	String countError="监考老师人数分配有误";
	redirectAttributes.addFlashAttribute("countError",countError);
	return "redirect:invigilate";
}
if(invigilates!=null)
{
	if(!invigilates.isEmpty())
	{
		for(UserInvigilate invigilate:invigilates)
		{
			if(!(invigilate.getInvigilate().getEndTime().compareTo(invigilate1.getStartTime())<=0||invigilate.getInvigilate().getStartTime().compareTo(invigilate1.getEndTime())>=0))
			{
				for(int userid:userids)
				{
					User user=userService.find(userid);
					if(invigilate.getUser().getUser_id()==user.getUser_id())
					{
						String handerError="老师安排的有冲突";
						redirectAttributes.addFlashAttribute("handerError", handerError);
					}
				}
			}
        }
   }
	
}

for(int userid:userids)
{
	User user=userService.find(userid);
	UserInvigilate userInvigilate=new UserInvigilate();
	userInvigilate.setInvigilate(invigilate1);
	userInvigilate.setUser(user);
    invigilateService.addUserInvigilate(userInvigilate,id);
}
String succeedHander="分配成功";
invigilateService.sendMessage(sendUser, id);
redirectAttributes.addFlashAttribute("succeedHander",succeedHander);
return "redirect:invigilate";
}
@GetMapping("/seeInformation")
public void seeInformation(HttpSession httpSession) {
	List<UserInvigilate> userInvigilates=invigilateService.listUserInvigilate();
	httpSession.setAttribute("seeInformation",userInvigilates);
}
@GetMapping("/modify/{id}")
public String modify(@PathVariable int id,HttpSession httpSession) {
	UserInvigilate userInvigilate=userInvigilateDao.find(id);
	httpSession.setAttribute("modifySession", userInvigilate);
	List<User> users=userService.listUserOrder();
	httpSession.setAttribute("usersSession",users);
	return "/admin/modify";
}
@GetMapping("/modify")
public void mmm(@SessionAttribute UserInvigilate modifySession,@SessionAttribute List<User> usersSession,HttpSession httpSession)
{
	httpSession.setAttribute("modifySession", modifySession);
	httpSession.setAttribute("usersSession", usersSession);
}
@PostMapping("/succeedModify")
public String succeedModify(@RequestParam("users") int[] userids,int sendUser,int id,RedirectAttributes redirectAttributes) {
	List<UserInvigilate> userInvigilates=userInvigilateService.findInformations(id);
	Invigilate invigilate1=invigilateService.findInvigilateInformation(id);
	if(invigilate1.getCount()!=userids.length)
	{
		String countError="监考老师人数分配有误";
		redirectAttributes.addFlashAttribute("countError",countError);
		return "redirect:modify";
	}
	List<User> users=new ArrayList<User>();
	for(int userid:userids)
	{
		User user=userService.find(userid);
		users.add(user);
	}
	for(int i=0;i<userInvigilates.size();i++)
	{
		userInvigilates.get(i).setUser(users.get(i));
		userInvigilateService.persistUserInvigilate(userInvigilates.get(i),userInvigilates.get(i).getId());
	}
	
	invigilateService.sendMessage(sendUser, id);
	String succeedModifyMessage="重新分配成功";
	redirectAttributes.addFlashAttribute("succeedModifyMessage",succeedModifyMessage);
	return "redirect:/admin/seeInformation";
}
@GetMapping("/deleteInvigilateInformation/{id}")
public String deleteInvigilateInformation(@PathVariable int id,HttpSession httpSession)
{
	invigilateService.delete(id);
	String deleteInvigilateInformation="删除考试成功";
	httpSession.setAttribute("deleteInvigilateInformation", deleteInvigilateInformation);
	return "redirect:/admin/invigilate";
	
}
@GetMapping("deleteUserInvigilate/{id}")
public String delete(@PathVariable int id)
{
   userInvigilateService.deleteUserInvigilate(id);
   return "redirect:/admin/seeInformation";
}
}
