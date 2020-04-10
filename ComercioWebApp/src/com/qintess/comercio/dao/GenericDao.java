package com.qintess.comercio.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Repository
@EnableTransactionManagement
public class GenericDao<T, ID extends Serializable> {

	@Autowired
	SessionFactory sessionFactory;
	
	// List<Produto>
	protected Session session;
	
	public GenericDao() {
	}
	
	@Transactional
	public T persistir(T entidade) {
		Session session = sessionFactory.getCurrentSession(); 
		session.persist(entidade);
		return entidade;
	}
	
	@Transactional
	public T atualizar(T entidade) {
		Session session = sessionFactory.getCurrentSession(); 
		session.merge(entidade);
		return entidade;
	}
	
	@Transactional
	public T encontrarPorId(Class<T> persistedClass, ID id) {
		Session session = sessionFactory.getCurrentSession(); 
		return session.find(persistedClass, id);
	}
	
	@Transactional
	public List<T> encontrarTodos(Class<T> persistedClass){
		Session session = sessionFactory.getCurrentSession(); 
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<T> query = builder.createQuery(persistedClass);
		query.from(persistedClass);
		return session.createQuery(query).getResultList();
	}
	
	@Transactional
	public void deletar(T entity) {
		Session session = sessionFactory.getCurrentSession(); 
		session.remove(entity);
	}
	
}
