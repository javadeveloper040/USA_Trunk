package org.edu.uams.api;


public interface UsersDao extends AbstractDao<Users> {
	
    public Users findByUserName(String username);
}
