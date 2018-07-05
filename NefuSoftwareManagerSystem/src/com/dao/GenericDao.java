package com.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
/**
 * 基于泛型的通用Dao层实现
 * @author BO
 *
 * @param <T>
 */
@Repository
public abstract class GenericDao<T> {
	@PersistenceContext
	private EntityManager entityManager;
	private Class<T> clazz;
	/**
	 * 使用反射获取子类声明的具体泛型类型，使子类无需传入泛型类型参数
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public GenericDao() {
		Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        clazz = (Class) pt.getActualTypeArguments()[0];
	}
	public void merge(T entity) {
		// TODO Auto-generated method stub
		entityManager.merge(entity);
	}
	public void flush() {
		entityManager.flush();
	}
	public void refresh(T entity) {
		entityManager.refresh(entity);
	}
	public void persist(T entity) {
		// TODO Auto-generated method stub
		entityManager.persist(entity);
	}
	public void remove(T entity) {
		// TODO Auto-generated method stub
		entityManager.remove(entity);
	}
	public void clear() {
		entityManager.clear();
	}

	public T find(int id) {
		// TODO Auto-generated method stub
		return (T) entityManager.find(clazz, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<T> list() {
		// TODO Auto-generated method stub
		String jpql = "FROM " +clazz.getName();
		Query query = entityManager.createQuery(jpql);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<T> list(int firstResult, int maxResults) {
		String jpql = "FROM " +clazz.getName();
		Query query = entityManager.createQuery(jpql);
		query.setFirstResult(firstResult).setMaxResults(maxResults);
		return query.getResultList();
	}
	// 为子类提供EntityManager
	public EntityManager getEntityManager() {
		return entityManager;
	}
}
