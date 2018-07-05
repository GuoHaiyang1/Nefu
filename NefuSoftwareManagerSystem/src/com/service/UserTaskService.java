package com.service;

import java.text.ParseException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserTaskDao;
import com.entity.Task;
import com.entity.User;
import com.entity.UserTask;

@Service
@Transactional
public class UserTaskService {
	@Autowired
	private UserTaskDao userTaskDao;
	
	public void persist(UserTask userTask) {
		userTaskDao.persist(userTask);
	}
	public List<UserTask> listUserTaskDao() throws ParseException {
		return userTaskDao.list();
	}
	public void update(UserTask userTask) {
		userTaskDao.update(userTask);
	}
	public UserTask getUserTask(User user,Task task) {
		return userTaskDao.find(user,task);
	}
}
