package org.edu.uams.api;

import java.io.Serializable;
import java.util.Set;

public interface Users extends Serializable{


	public abstract long getUserId();

	public abstract void setUserId(long userId);

	public abstract String getUserName();

	public abstract void setUserName(String userName);

	public abstract String getPassWord();

	public abstract void setPassWord(String passWord);


	public Set<UsersRoles> getUsersRoles();

	public void setUsersRoles(Set<UsersRoles> usersRoles);


}
