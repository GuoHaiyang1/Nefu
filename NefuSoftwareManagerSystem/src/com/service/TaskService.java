package com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.TaskDao;
import com.entity.Task;

@Service
@Transactional
public class TaskService {
	@Autowired
	private TaskDao taskDao;
	//新建任务
	public void persist(Task task) {
		taskDao.persist(task);
	}
	//更新任务
	public void  update(Task task) {
		taskDao.update(task);
	}
	
	public Task getTask(String taskTitle) {
		return taskDao.find(taskTitle);
	}
	public List<Task> listTask() {
		return taskDao.list();
	}
	
	//根据传入的id，查找到相应的task，将state改为关闭状态
	public void changestate(int id) {
		taskDao.change(id);
	}
}
