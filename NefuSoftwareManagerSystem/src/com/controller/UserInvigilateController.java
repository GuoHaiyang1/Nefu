package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.entity.UserInvigilate;
import com.service.InvigilateService;

@Controller
public class UserInvigilateController {
@Autowired
private InvigilateService invigilateService;
@GetMapping("/HanderInformation")
public void handerInformation(HttpSession httpSession)
{
	List<UserInvigilate> userInvigilates=invigilateService.listUserInvigilate();
	httpSession.setAttribute("handerInformation",userInvigilates);
}
}
