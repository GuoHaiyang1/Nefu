package com.entity;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int user_id;
	@Size(min=2,max=20,message="您输入的值为${validatedValue},用户名长度必须大于{min},小于{max}")
	private String username;
	@NotNull
	private String password;
	@NotNull
	private String user_title;
	@NotNull
	private String user_info;
	@Size(min=7,max=11,message="您输入的值为${validatedValue},手机号码长度必须大于{min},小于{max}")
	private String phone;
	private int authority;
	@OneToMany(mappedBy="user")
	private Set<UserInvigilate> userInvigilates;
	@OneToMany(mappedBy="user")
	private Set<UserTask> userTasks;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_title() {
		return user_title;
	}
	public void setUser_title(String user_title) {
		this.user_title = user_title;
	}
	public String getUser_info() {
		return user_info;
	}
	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Set<UserInvigilate> getUserInvigilates() {
		return userInvigilates;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public void setUserInvigilates(Set<UserInvigilate> userInvigilates) {
		this.userInvigilates = userInvigilates;
	}
	public Set<UserTask> getUserTasks() {
		return userTasks;
	}
	public void setUserTasks(Set<UserTask> userTasks) {
		this.userTasks = userTasks;
	}
}
