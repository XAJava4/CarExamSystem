package com.java4.des.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="mxy_user")
public class User extends IdEntity implements Serializable {
	@NotBlank(message="用户名不为空")
	private String username;
	@NotBlank
	@Length(min=6,max=8,message="密码6-8")
	private String password;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String userName) {
		this.username = userName;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
