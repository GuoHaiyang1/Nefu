package com.dao;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.entity.Task;
@Repository
public class TaskDao extends GenericDao<Task> {
	public Task find(String taskTitle) {
		String jpql = "FROM Task task WHERE task.taskTitle=:taskTitle";
		Query query = getEntityManager().createQuery(jpql);
		query.setParameter("taskTitle", taskTitle);
		Task task = null;
		try {
			task = (Task) query.getSingleResult();
		} catch (NoResultException e) {
			// TODO: handle exception
		}
		return task;
	}
	public void update(Task task) {
		Task task2=getEntityManager().find(Task.class, task.getId());
		task2.setDeadline(task.getDeadline());
		task2.setTaskDescription(task.getTaskDescription());
		task2.setTaskTitle(task.getTaskTitle());
		task2.setType(task.getType());
	}
	
	//修改状态
	public void change(int id) {
		Task task=getEntityManager().find(Task.class, id);
		task.setState("关闭");
	}
}
