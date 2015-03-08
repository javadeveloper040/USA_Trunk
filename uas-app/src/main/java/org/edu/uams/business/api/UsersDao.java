package org.edu.uams.business.api;

import org.edu.uams.pojo.api.Users;


public interface UsersDao extends AbstractDao<Users> {
	
    public Users findByUserName(String username);
}
