package com.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Excepton.MyException;
import com.entity.File;
import com.entity.Task;
import com.entity.User;
import com.service.FileService;
import com.service.TaskService;
import com.service.UserTaskService;
import com.util.FileUtils;

@Controller
public class UserTask {
	@Autowired
	private TaskService taskService;
	@Autowired
	private UserTaskService userTaskservice;
	@GetMapping("task")
	public void task(HttpSession session) {
		List<Task> tasks=taskService.listTask();
		session.setAttribute("tasks2", tasks);
	}
	
	
	//根据传递的id匹配session中的task，将各个属性字段存入usertask表中
	@SuppressWarnings("unchecked")
	@GetMapping("/{id}")
	public String task(@PathVariable int id,HttpServletRequest request,RedirectAttributes attributes) {
		
		//查找当前用户和选择的任务，封装到用户任务表中
		com.entity.UserTask userTask=null;
		User user=(User) request.getSession().getAttribute("user");
		List<Task> tasks=(List<Task>) request.getSession().getAttribute("tasks2");
		Task task=new Task();
		tasks.forEach(t->{
			if(t.getId()==id) {
				task.setId(t.getId());
				task.setTaskTitle(t.getTaskTitle());
				task.setType(t.getType());
				task.setDeadline(t.getDeadline());
				task.setTaskDescription(t.getTaskDescription());
			}
		});
		if(userTaskservice.getUserTask(user, task)!=null) {
			String result="任务选择重复";
			attributes.addFlashAttribute("result",result);
		}
		else {
			userTask=new com.entity.UserTask();
			userTask.setUser(user);
			userTask.setTask(task);
			userTask.setState("未完成");
			userTaskservice.persist(userTask);
		}
			return "redirect:task";
	
	}
	
	//工作跳转处理,跳转时判断是否已经超过了任务的截至时间，超过了显示提示，并将对应的用户任务表的状态改为未按时完成
	@SuppressWarnings("unchecked")
	@GetMapping("/work/{id}")
	public String work(@PathVariable int id,HttpServletRequest request) {
		String warn="";
		User user=(User) request.getSession().getAttribute("user");
		List<Task> tasks=(List<Task>) request.getSession().getAttribute("tasks2");
		Task task=new Task();
		tasks.forEach(t->{
			if(t.getId()==id) {
				task.setId(t.getId());
				task.setTaskTitle(t.getTaskTitle());
				task.setType(t.getType());
				task.setDeadline(t.getDeadline());
				task.setTaskDescription(t.getTaskDescription());
			}
		});
		com.entity.UserTask userTask=userTaskservice.getUserTask(user, task);
		Date date=new Date();
		if(task.getDeadline().getTime()<date.getTime()) {
			warn="你已经超过截止时间了";
			if(userTask.getState().equals("")) {	
			userTask.setState("未按时完成");
			}
			userTaskservice.update(userTask);
		}else {
			warn="";
		}
		request.getSession().setAttribute("warn", warn);
		request.getSession().setAttribute("task",task);
		if (task.getType().equals("文档")) {
			return "redirect:upload";
		}else if (task.getType().equals("回复")) {
			return "redirect:response";
		}else {
			return "redirect:../task";
		}
	}
	
	//查询当前所有用户任务列表
	@PostMapping("select1")
	public String select1(HttpSession session) throws Exception {
		List<com.entity.UserTask> userTasks=userTaskservice.listUserTaskDao();
		Date date=new Date();
		List<com.entity.UserTask> userTasks2=new ArrayList<com.entity.UserTask>();
		userTasks.forEach(ut->{
			if(ut.getTask().getDeadline().getTime()>date.getTime()) {
				userTasks2.add(ut);
			}
		});
		session.setAttribute("userTasks", userTasks2);
		return "redirect:task";
	}
	
	//查询历史所有任务用户表
	@PostMapping("select2")
	public String select2(HttpSession session) throws Exception {
		List<com.entity.UserTask> userTasks=userTaskservice.listUserTaskDao();
		Date date=new Date();
		List<com.entity.UserTask> userTasks2=new ArrayList<com.entity.UserTask>();
		userTasks.forEach(ut->{
			if(ut.getTask().getDeadline().getTime()<date.getTime()) {
				userTasks2.add(ut);
			}
		});
		session.setAttribute("userTasks2", userTasks2);
		return "redirect:task";
	}
	
	
	@GetMapping("work/upload")
	public void upload(HttpSession session) {
		session.setAttribute("files", FileService.files);
	}
	
	@GetMapping("work/response")
	public void response() {}
	
	//接受response表单传送过来的数据，与当前时间比较，检查是否为超时完成
	@PostMapping("work/response")
	public String response(String responseInfo,HttpServletRequest request,RedirectAttributes attributes) throws Exception {
		Task task=(Task) request.getSession().getAttribute("task");
		User user=(User) request.getSession().getAttribute("user");
		com.entity.UserTask userTask=userTaskservice.getUserTask(user, task);
		String res="保存成功";
		if (responseInfo.equals("")) {
			res="未回复任何信息";
			attributes.addFlashAttribute("complete", res);
			return "redirect:response";
		}else {
			userTask.setResponseInfo(responseInfo);
		}
		Date date=new Date();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date1=simpleDateFormat.format(date);
		Date date2=simpleDateFormat.parse(date1);
		userTask.setCompleteTime(date2);
		if (userTask.getTask().getDeadline().getTime()<date.getTime()) {
			userTask.setState("超时完成");
		}
		else {
			userTask.setState("按时完成");
		}
		userTaskservice.update(userTask);
		attributes.addFlashAttribute("complete",res);
		return "redirect:response";
	}
	
	@Autowired
	private FileService fileService;
	//upload上传文件保存
	@PostMapping("work/upload")
	public String upload(MultipartFile file, RedirectAttributes redirectAttributes,HttpServletRequest request) throws Exception {
		Task task=(Task) request.getSession().getAttribute("task");
		User user=(User) request.getSession().getAttribute("user");
		com.entity.UserTask userTask=userTaskservice.getUserTask(user, task);
		String result="上传文件成功";
		if (!file.isEmpty()) {
			try {
				fileService.addFile(file.getBytes(), file.getOriginalFilename());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				throw new MyException("上传文件读取错误！" + e.getMessage());
			}
			redirectAttributes.addFlashAttribute("fileName", file.getOriginalFilename());
			redirectAttributes.addFlashAttribute("fileSize", file.getSize());
			userTask.setResponseInfo("已上传文档");
		}else {
			result="未上传文件";
			redirectAttributes.addFlashAttribute("fileupload", result);
			return "redirect:upload";
		}
		Date date=new Date();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date1=simpleDateFormat.format(date);
		Date date2=simpleDateFormat.parse(date1);
		userTask.setCompleteTime(date2);
		if (userTask.getTask().getDeadline().getTime()<date.getTime()) {
			userTask.setState("超时完成");
		}
		else {
			userTask.setState("按时完成");
		}
		userTaskservice.update(userTask);
		redirectAttributes.addFlashAttribute("fileupload",result);
		file = null;
		return "redirect:upload";
	}
	
	//下载文件
	@PostMapping("work/download")
	public String download(MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				fileService.addLecture(file.getBytes(), file.getOriginalFilename());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				throw new MyException("上传文件读取错误！" + e.getMessage());
			}
		}	
		return "redirect:upload";
	}
	//运行或者保存文件
	@GetMapping("work/file/{fileid}")
	public ResponseEntity<byte[]> download(@PathVariable int fileid) {
		File file = fileService.getFile(fileid);
		Path path = Paths.get(file.getFilename());
		return FileUtils.toResponseEntity(path);
	}
}
