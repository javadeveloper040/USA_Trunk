package org.edu.uams.business.impl;

import java.util.List;
import javax.persistence.TypedQuery;

import org.edu.uams.business.api.UsersDao;
import org.edu.uams.pojo.api.Users;
import org.edu.uams.pojo.impl.UsersEntity;

public class UsersDaoImpl extends AbstractDaoImpl<Users,UsersEntity> implements UsersDao{

	public UsersDaoImpl() {
		super(UsersEntity.class);
	}

	@SuppressWarnings("unchecked")
	public List<Users> findAll() {
		TypedQuery<Users> query = this.em.createNamedQuery(UsersEntity.USER_MASTER_FIND_ALL,Users.class);
		return query.getResultList();
		
	
	}
        
        @SuppressWarnings("unchecked")
	public Users findByUserName(String username) {
           
           TypedQuery<Users> query = this.em.createNamedQuery(UsersEntity.FIND_BY_USERNAME,Users.class);
            query.setParameter("userName", username);
		return query.getSingleResult();
	}
}
