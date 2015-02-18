package org.edu.uams.business;

import java.util.List;
import javax.persistence.TypedQuery;

import org.edu.uams.api.UsersDao;
import org.edu.uams.api.Users;
import org.edu.uams.pojo.UsersEntity;
import org.springframework.stereotype.Component;

@Component("UsersDao")
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
