package com.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.entity.Invigilate;
import com.entity.User;
import com.entity.UserInvigilate;
@Repository
public class UserInvigilateDao extends GenericDao<UserInvigilate> {
	public List<UserInvigilate> findSomthing(Invigilate invigilate)
	{
		 String jpql = "FROM UserInvigilate u WHERE u.invigilate.id=?1";
		Query query=getEntityManager().createQuery(jpql);
		query.setParameter(1, invigilate.getId());
		@SuppressWarnings("unchecked")
		List<UserInvigilate> userInvigilates=query.getResultList();
		return userInvigilates;
	}
	public int number(User user)
	{
		int n=0;
		String jpql = "FROM UserInvigilate u WHERE u.user.user_id=?1";
		Query query=getEntityManager().createQuery(jpql);
		query.setParameter(1, user.getUser_id());
		@SuppressWarnings("unchecked")
		List<UserInvigilate> userInvigilates=query.getResultList();
		for(UserInvigilate userInvigilate:userInvigilates) {
			if(userInvigilate.getInvigilate().getState()==2)
			{
			n++;	
			}
		}
		return n;
	}
}
