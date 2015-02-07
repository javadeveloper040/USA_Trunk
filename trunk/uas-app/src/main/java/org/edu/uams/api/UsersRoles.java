package org.edu.uams.api;

import java.io.Serializable;

public interface UsersRoles extends Serializable {

	public long getId();

	public void setId(long id);

	public UsersRoleType getUsersRoleType();

	public void setUsersRoleType(UsersRoleType usersRoleType);

	public Users getUsers();

	public void setUsers(Users users);

}
