package org.edu.uams.api;

import java.io.Serializable;

public interface UsersRoleType extends Serializable {
	
	public long getId() ;
	public void setId(long id);

	public String getCode();
	public void setCode(String code);

	public String getDescription();
	public void setDescription(String description) ;

}
