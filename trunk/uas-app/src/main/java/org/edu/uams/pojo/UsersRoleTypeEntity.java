package org.edu.uams.pojo;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.edu.uams.api.UsersRoleType;

@Entity(name = "UsersRoleType")
@Table(name = "users_role_type")
public class UsersRoleTypeEntity implements UsersRoleType {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public static final  String  USER_ROLE_TYPE_FIND_ALL="SELECT urt FROM UsersRoleType urt";


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private long id;

	@Column(name = "user_name", unique = true, nullable = false, length = 10)
	private String code;

	@Column(name = "pass_word", nullable = false, length = 200)
	private String description;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	
}
