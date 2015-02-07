package org.edu.uams.pojo;


import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.edu.uams.api.Users;
import org.edu.uams.api.UsersRoles;

@Entity(name = "UserMaster")
@NamedQueries( { 
	@NamedQuery(name = UsersEntity.FIND_BY_USERNAME, query = "select u from UserMaster u where u.userName = :username")
})
@Table(name = "user_master")
public class UsersEntity implements Users {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final String FIND_BY_USERNAME = "findByUsername";


	public static final  String  USER_MASTER_FIND_ALL="SELECT u FROM UserMaster u";


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private long id;

	@Column(name = "user_name", unique = true, nullable = false, length = 200)
	private String userName;

	@Column(name = "pass_word", nullable = false, length = 10)
	private String passWord;



	@OneToMany(mappedBy = "users", fetch = FetchType.LAZY, targetEntity = UsersRolesEntity.class)
	private Set<UsersRoles> usersRoles;

	public Set<UsersRoles> getUsersRoles() {
		return usersRoles;
	}

	public void setUsersRoles(Set<UsersRoles> usersRoles) {
		this.usersRoles = usersRoles;
	}

	public long getUserId() {
		return id;
	}


	public void setUserId(long userId) {
		this.id = userId;
	}


	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassWord() {
		return passWord;
	}


	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

}
