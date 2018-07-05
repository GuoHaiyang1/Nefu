package com.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class UserTask {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String responseInfo;
	private Date completeTime;
	private String state;
	@ManyToOne
	private User user;
	@ManyToOne
	private Task task;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getResponseInfo() {
		return responseInfo;
	}
	public void setResponseInfo(String responseInfo) {
		this.responseInfo = responseInfo;
	}
	public Date getCompleteTime() {
		return completeTime;
	}
	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
}
