package com.service;


import java.util.Date;
import java.util.List;

import javax.persistence.PersistenceContext;

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
public class InvigilateService {
@Autowired
private InvigilateDao invigilateDao;
@Autowired
private UserInvigilateDao  userInvigilateDao;
@Autowired
private UserDao userDao;
@Autowired
private UserInvigilateService userInvigilateService;
public List<Invigilate> invigilateList(){
	return invigilateDao.list();
}
public void addInvigilate(String coursename,String address,int count,int state,Date date1,Date date2)
{
	Invigilate invigilate=new Invigilate();
	invigilate.setCoursename(coursename);
	invigilate.setAddress(address);
	invigilate.setCount(count);
	invigilate.setState(state);
	invigilate.setStartTime(date1);
	invigilate.setEndTime(date2);
	invigilateDao.persist(invigilate);
}
public Invigilate findInvigilateInformation(int id)
{
	return invigilateDao.find(id);
}
public List<UserInvigilate> listUserInvigilate()
{
	return userInvigilateDao.list();
}
public void addUserInvigilate(UserInvigilate userInvigilate,int id)
{
	userInvigilateDao.persist(userInvigilate);
	Invigilate invigilate=invigilateDao.find(id);
	invigilate.setState(1);
	invigilateDao.persist(invigilate);
}
public void invigilatePersist(Invigilate invigilate)
{
	
	invigilateDao.persist(invigilate);
}
public void changeState(int id)
{
	Invigilate invigilate=invigilateDao.find(id);
	invigilate.setState(2);
	invigilateDao.persist(invigilate);
}
public void sendMessage(int id1,int id2)
{
	User user=userDao.find(id1);
	Invigilate invigilate=invigilateDao.find(id2);
	List<UserInvigilate> userInvigilates=userInvigilateService.findInformations(id2);
	StringBuffer message=new StringBuffer("***发出短信***");
	message.append(user.getUsername());
	message.append("老师您好,您有刚分配的监考信息，监考时间：");
	message.append(invigilate.getStartTime());
	message.append("--");
	message.append(invigilate.getEndTime());
	message.append(",监考科目");
	message.append(invigilate.getCoursename());
	message.append(",监考地点：");
	message.append(invigilate.getAddress());
	message.append("，这场考试的监考老师有:");
	for(UserInvigilate userInvigilate:userInvigilates)
	{
		message.append(userInvigilate.getUser().getUsername());
		message.append(",");
	}
	message.append("您目前一共有");
	message.append(userInvigilateService.counts(user));
	message.append("次监考");
	System.out.println(message);
}
public void delete(int id)
{
	Invigilate invigilate=invigilateDao.find(id);
	invigilateDao.remove(invigilate);
}
}
