package org.edu.uams.business;

import java.io.Serializable;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;

import org.edu.uams.api.AbstractDao;
import org.edu.uams.util.EntityManagerFactoryUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Scope("singleton")
@Repository
@Transactional
public  abstract class AbstractDaoImpl<T extends Serializable,E extends T> implements AbstractDao<T>{


	protected EntityManager em=EntityManagerFactoryUtil.getEntityManager();

	public EntityManager getEntityManager()
	{
		return em;
	}

	protected Class<? extends T> entityClass;


	public AbstractDaoImpl(final Class<? extends T> paramEntityClass) {
		if (paramEntityClass!=null) {
			this.entityClass=paramEntityClass;
		}
	}
	@Override
	public T persist(T entity) {
		EntityTransaction transaction = null;
		try {
			transaction = em.getTransaction();
			transaction.begin();
			this.em.persist(entity);
			transaction.commit();
		} catch (Exception e) {
			if(transaction != null)
			{
				transaction.getRollbackOnly();
			}
		}


		return entity;
	}
	@Override
	public T update(T entity) {

		EntityTransaction transaction = null;
		T updatedEntity = null;
		try {
			transaction = em.getTransaction();
			transaction.begin();
			updatedEntity = this.em.merge(entity);
			transaction.commit();
		} catch (Exception e) {
			if(transaction != null)
			{
				transaction.getRollbackOnly();
			}
		}
		return updatedEntity;
	}
	@Override
	public void delete(T entity) {
		if (entity==null) {
			return;
		}
		EntityTransaction transaction = null;
		try {
			transaction = em.getTransaction();
			transaction.begin();
			this.em.remove(entity);
			transaction.commit();
		} catch (Exception e) {
			if(transaction != null)
			{
				transaction.getRollbackOnly();
			}
		}
	}

	@Override
	public T findByPrimaryKey(long id) {

		return this.em.find(entityClass, id);
	}



}
