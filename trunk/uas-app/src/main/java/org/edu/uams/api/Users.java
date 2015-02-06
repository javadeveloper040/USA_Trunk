package org.edu.uams.api;

import java.io.Serializable;

public interface Users extends Serializable{
	

	public abstract long getUserId();

	public abstract void setUserId(long userId);

	public abstract String getUserName();

	public abstract void setUserName(String userName);

	public abstract String getPassWord();

	public abstract void setPassWord(String passWord);

	public abstract String getName();

	public abstract void setName(String name);

	public abstract String getAddress();

	public abstract void setAddress(String address);

	public abstract String getGender();

	public abstract void setGender(String gender);

	public abstract String getEmail();

	public abstract void setEmail(String email);

}
