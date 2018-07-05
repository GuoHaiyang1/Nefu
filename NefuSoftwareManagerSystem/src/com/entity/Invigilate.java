package com.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Invigilate {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String address;
	private Date startTime;
	private Date endTime;
	private String coursename;
	private int count;
	private int state;/*添加了状*/
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@OneToMany(mappedBy="invigilate")
	private Set<UserInvigilate> userInvigilates;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Set<UserInvigilate> getUserInvigilates() {
		return userInvigilates;
	}
	public void setUserInvigilates(Set<UserInvigilate> userInvigilates) {
		this.userInvigilates = userInvigilates;
	}
}
