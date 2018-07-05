package com.entity;

public class Authority {
	public static final int USER=1;
	public static final int ADMIN=2;
	private int id;
	public Authority(int id) {
		super();
		this.id=id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public static int getUser() {
		return USER;
	}
	public static int getAdmin() {
		return ADMIN;
	}
}
