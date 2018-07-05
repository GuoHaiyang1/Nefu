package com.dao;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import com.entity.User;
import com.util.MD5Util;

@Repository
public class UserDao extends GenericDao<User> {
	public User find(String userName, String password) {
		String jpql = "FROM User u WHERE u.username=:userName AND u.password=:password";
		Query query = getEntityManager().createQuery(jpql);
		query.setParameter("userName", userName);
		query.setParameter("password", password);
		User user = null;
		try {
			user = (User) query.getSingleResult();
		} catch (NoResultException e) {
			// TODO: handle exception
		}
		return user;
	}
	public void authordeleteuser(int user_id)
	{   String jpql = "FROM User u WHERE u.user_id=?1";
		Query query=getEntityManager().createQuery(jpql);
		query.setParameter(1, user_id);
		User user=null;
		try {
			user = (User) query.getSingleResult();
		} catch (NoResultException e) {
			// TODO: handle exception
		}
		remove(user);
	}
	public void update(User user1,User user)
	{
		User user2=find(user.getUser_id());
		user2.setUsername(user1.getUsername());
		System.out.println(MD5Util.convertMD5("14e1b600b1fd579f47433b88e8d85291"));
		user2.setPassword(user1.getPassword());
		if(user1.getUser_info()!="")
		{
			user2.setUser_info(user1.getUser_info());
		}
		if(user1.getUser_title()!=null)
		{
			user2.setUser_title(user1.getUser_title());
		}
		user2.setPhone(user1.getPhone());
	}
}
