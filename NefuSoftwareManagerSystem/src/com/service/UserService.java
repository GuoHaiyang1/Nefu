package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.InvigilateDao;
import com.dao.UserDao;
import com.entity.User;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private InvigilateDao invigilateDao;
	public void persist(User user)
	{
		userDao.persist(user);
	}
	public User getUser(String userName, String password) {
		return userDao.find(userName, password);
	}
	public void update(User user1,User user2) {
		userDao.update(user1, user2);
	}
	public List<User> listUsers() {
		return userDao.list();
	}
	public User find(int id) {
		User user=userDao.find(id);
		return user;
	}
	public void userUpdate(User user,int user_id)
	{
		User user1=find(user_id);
		user1.setUsername(user.getUsername());
		user1.setPassword(user.getPassword());
		if(user.getUser_info()!="")
		{
			user1.setUser_info(user.getUser_info());
		}
		if(user.getUser_title()!=null)
		{
			user1.setUser_title(user.getUser_title());
		}
		user1.setPhone(user.getPhone());
		if(user.getAuthority()!=0)
		{
			user1.setAuthority(user.getAuthority());
		}
		persist(user1);
	}
	public void updateAythority(int user_id)
	{
		User user1=find(user_id);
	     if(user1.getAuthority()==1)
	     {
	    	 user1.setAuthority(2);
	     }
	     else
	     {
	    	 user1.setAuthority(1);
	     }
	     persist(user1);
	}
	public void deleteUser(int user_id)
	{
		User user1=find(user_id);
		userDao.remove(user1);
	}
	public List<User> listUserOrder()
	{
		int n=0;
		User user=new User();
		List<User> users=userDao.list();
		if(users.isEmpty()||users.size()==1)
		{
			return users;
		}
		for(int i=0;i<users.size();i++)
			for(int j=i+1;j<users.size();j++)
			{
				if(users.get(i).getUserInvigilates().size()>users.get(j).getUserInvigilates().size())
				{
					System.out.println(users.get(j).getUserInvigilates().size());
					user=users.get(i);
					users.set(i, users.get(j));
					users.set(j,user);
				}
			}
		
		return users;
	}
}
