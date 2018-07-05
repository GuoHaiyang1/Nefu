package com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.Task;
import com.service.TaskService;
@Validated
@Controller
@RequestMapping("/admin")
public class TaskController {
	@Autowired
	private TaskService taskService;
	@GetMapping("/TaskManager")
	public void taskManager(HttpSession session) {
		//从数据库所有的task，以便修改信息
		List<Task> tasks=taskService.listTask();
		session.setAttribute("tasks", tasks);
	}
	
	
	//创建任务
	@PostMapping("/createTask")
	public String createTask(@Size(min=2,max=10) String taskTitle,@NotNull String taskDescription,@NotNull String type,@NotNull String deadline,RedirectAttributes attributes) throws ParseException {
		//task持久化
		Task task1=taskService.getTask(taskTitle);
		String resulte="任务创建成功";
		if (task1==null) {
			SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date=sf.parse(deadline);
			Task task=new Task();
			task.setTaskTitle(taskTitle);
			task.setDeadline(date);
			task.setTaskDescription(taskDescription);
			task.setType(type);
			task.setState("开启");
			taskService.persist(task);
			//返回消息显示创建任务成功
			attributes.addFlashAttribute("result",resulte);
			return "redirect:TaskManager";
		}//返回消息提示任务重复
		else {
			resulte="任务名重复";
			attributes.addFlashAttribute("result",resulte);
			return "redirect:TaskManager";
		}
	}
	
	
	//修改任务信息
	@PostMapping("/updateTask")
	public String updateTask(int id,@Size(min=2,max=10) String taskTitle,@NotNull String taskDescription,@NotNull String type,@NotNull String deadline,RedirectAttributes attributes) throws ParseException {
		
		//先根据选择的taskTitle确定修改的对象，后进行修改
		Task task=new Task();
		task.setId(id);
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=sf.parse(deadline);
		task.setDeadline(date);
		task.setTaskTitle(taskTitle);
		task.setType(type);
		task.setTaskDescription(taskDescription);
		taskService.update(task);
		String result2="修改成功";
		attributes.addFlashAttribute("result2",result2);
		return "redirect:TaskManager";
	}
	
	//获取a标签传入的值，改变选中task的state
	@GetMapping("/{id}")
	public String changestate(@PathVariable int id) {
		taskService.changestate(id);
		return "redirect:TaskManager";
	}
}
