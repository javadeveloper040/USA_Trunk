package org.edu.uams.business;

import java.io.Serializable;

import org.edu.uams.api.AbstractDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;


public  abstract class AbstractDaoImpl<T extends Serializable,E extends T> implements AbstractDao<T>{


	@Autowired
	private SessionFactory sessionFactory;
	
	protected Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session getSession() {
            if(session == null)
            {
                session=sessionFactory.openSession();
            }
		return session;
	}
	
	protected Class<? extends T> entityClass;


	public AbstractDaoImpl(final Class<? extends T> paramEntityClass) {
		//session=getSession();
		if (paramEntityClass!=null) {
			this.entityClass=paramEntityClass;
		}
	}
	
	public T persist(T entity) {
		Transaction transaction = this.getSession().getTransaction();
		transaction.begin();
		this.getSession().save(entity);
		transaction.commit();
		return entity;
	}

	public T update(T entity) {
		Transaction transaction = this.getSession().getTransaction();
		transaction.begin();
		this.getSession().merge(entity);
		transaction.commit();
		return entity;
	}

	public void delete(T entity) {
		if (entity==null) {
			return;
		}
		Transaction transaction = this.getSession().getTransaction();
		transaction.begin();
		this.getSession().delete(entity);
		transaction.commit();
	}

	@SuppressWarnings("unchecked")
	public T findByPrimaryKey(long id) {
		Transaction transaction = this.getSession().getTransaction();
		transaction.begin();
		return (T) getSession().get(entityClass, id);
	}

	

}
