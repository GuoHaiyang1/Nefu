package com.dao;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.entity.Task;
import com.entity.User;
import com.entity.UserTask;
@Repository
public class UserTaskDao extends GenericDao<UserTask> {
	public UserTask find(User user,Task task) {
		String jpql = "FROM UserTask userTask WHERE userTask.task.id=:task_id AND userTask.user.user_id=:user_id";
		Query query = getEntityManager().createQuery(jpql);
		query.setParameter("task_id",task.getId() );
		query.setParameter("user_id",user.getUser_id() );
		UserTask userTask2 = null;
		try {
			userTask2 = (UserTask) query.getSingleResult();
		} catch (NoResultException e) {
			// TODO: handle exception
		}
		return userTask2;
	}
	public void update(UserTask userTask) {
		UserTask userTask2=getEntityManager().find(UserTask.class, userTask.getId());
		userTask2.setCompleteTime(userTask.getCompleteTime());
		userTask2.setResponseInfo(userTask.getResponseInfo());
		userTask2.setState(userTask.getState());
		userTask2.setTask(userTask.getTask());
		userTask2.setUser(userTask.getUser());
	}
}
