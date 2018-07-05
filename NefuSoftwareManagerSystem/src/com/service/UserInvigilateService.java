package com.service;

import java.util.List;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.InvigilateDao;
import com.dao.UserDao;
import com.dao.UserInvigilateDao;
import com.entity.Invigilate;
import com.entity.User;
import com.entity.UserInvigilate;
@Service
@Transactional
public class UserInvigilateService {
	@Autowired
	private UserInvigilateDao userInvigilateDao;
	@Autowired
	private InvigilateDao invigilateDao;
	public List<UserInvigilate> findInformations(int id)
	{
		Invigilate invigilate=invigilateDao.find(id);
		List<UserInvigilate> userInvigilates=userInvigilateDao.findSomthing(invigilate);
		return userInvigilates;
	     
	}
	public int counts(User user) {
		int m=user.getUserInvigilates().size();
		return m-userInvigilateDao.number(user);
	}
	public void persistUserInvigilate(UserInvigilate userInvigilate,int id) {
		UserInvigilate userInvigilate2=userInvigilateDao.find(id);
		userInvigilate2.setUser(userInvigilate.getUser());
		userInvigilateDao.persist(userInvigilate2);
	}
	public void deleteUserInvigilate(int id) {
		Invigilate invigilate=invigilateDao.find(id);
		List<UserInvigilate> userInvigilates=userInvigilateDao.findSomthing(invigilate);
		for(UserInvigilate userInvigilate:userInvigilates)
		{
			userInvigilateDao.remove(userInvigilateDao.find(userInvigilate.getId()));
		}
		invigilateDao.remove(invigilateDao.find(id));
	}
}
