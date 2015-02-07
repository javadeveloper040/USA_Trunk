package org.edu.uams.business;

import java.util.List;

import org.edu.uams.api.UsersDao;
import org.edu.uams.api.Users;
import org.edu.uams.pojo.UsersEntity;
import org.hibernate.Query;
import org.springframework.stereotype.Component;

@Component("UsersDao")
public class UsersDaoImpl extends AbstractDaoImpl<Users,UsersEntity> implements UsersDao{

	public UsersDaoImpl() {
		super(UsersEntity.class);
	}

	@SuppressWarnings("unchecked")
	public List<Users> findAll() {
		Query query = this.getSession().createQuery(UsersEntity.USER_MASTER_FIND_ALL);
		return query.list();
		
	
	}
        
        @SuppressWarnings("unchecked")
	public Users findByUserName(String username) {
            
		Query query = this.getSession().getNamedQuery(UsersEntity.FIND_BY_USERNAME);
                query.setParameter("username", username);
            List userList = query.list();
            if(userList != null && userList.size() > 0)
            {
                return (Users)userList.get(0);
            }
           return null;
	}
}
