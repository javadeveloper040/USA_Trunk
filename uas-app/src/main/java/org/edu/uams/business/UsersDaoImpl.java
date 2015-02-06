package org.edu.uams.business;

import java.util.List;

import org.edu.uams.api.UserDao;
import org.edu.uams.api.Users;
import org.edu.uams.pojo.UsersEntity;
import org.hibernate.Query;


public class UsersDaoImpl extends AbstractDaoImpl<Users,UsersEntity> implements UserDao{

	public UsersDaoImpl() {
		super(UsersEntity.class);
	}

	@SuppressWarnings("unchecked")
	public List<Users> findAll() {
		Query query = session.createQuery(UsersEntity.USER_MASTER_FIND_ALL);
		return query.list();
		
	
	}


	
	


	





}
