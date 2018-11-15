package com.ocm.beans;

public class Moderator_profile {

	private String mod_login_id;
	private String passsword;
	private 	String name;
	private 	String email;
	private String mobile;
	private String category;
	public Moderator_profile(String mod_login_id, String passsword, String name, String email, String mobile,
			String category) {
		super();
		this.mod_login_id = mod_login_id;
		this.passsword = passsword;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.category = category;
	}
	public Moderator_profile()
	{
		
	}
	public String getMod_login_id() {
		return mod_login_id;
	}
	public void setMod_login_id(String mod_login_id) {
		this.mod_login_id = mod_login_id;
	}
	public String getPasssword() {
		return passsword;
	}
	public void setPasssword(String passsword) {
		this.passsword = passsword;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	
	
}