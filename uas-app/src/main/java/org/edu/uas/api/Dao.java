package org.edu.uas.api;

import java.io.Serializable;
import java.util.List;

public interface Dao<T extends Serializable> {

	public void delete(T entity);

	public T findByPrimaryKey(long id);

	public List<T> findAll();

	public T persist(T entity);

	public T update(T entity);

}