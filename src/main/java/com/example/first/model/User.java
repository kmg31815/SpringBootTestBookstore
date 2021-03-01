package com.example.first.model;

public class User {
	
	private String user = "sherry";
	private String password = "123456";
	
	public User(String user, String pass) {
		this.user = user;
		this.password = pass;
	}
	
	public User() {
		
	}
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
