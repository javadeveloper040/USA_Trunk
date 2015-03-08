package org.edu.uams.pojo.impl;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.edu.uams.pojo.api.Users;
import org.edu.uams.pojo.api.UsersRoleType;
import org.edu.uams.pojo.api.UsersRoles;

@Entity(name = "UsersRoles")
@Table(name = "user_roles")
public class UsersRolesEntity implements UsersRoles {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public static final  String  USER_ROLES_FIND_ALL="SELECT ur FROM UsersRoles ur";


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private long id;

	
	@ManyToOne(optional = false, targetEntity = UsersRoleTypeEntity.class)
	@JoinColumn(name = "users_role_type_id", referencedColumnName = "id", nullable = false )
	private UsersRoleType usersRoleType;
	
	@ManyToOne(optional = false, targetEntity = UsersEntity.class)
	@JoinColumn(name = "users_id", referencedColumnName = "id", nullable = false )
	private Users users;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public UsersRoleType getUsersRoleType() {
		return usersRoleType;
	}

	public void setUsersRoleType(UsersRoleType usersRoleType) {
		this.usersRoleType = usersRoleType;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}
	
}
