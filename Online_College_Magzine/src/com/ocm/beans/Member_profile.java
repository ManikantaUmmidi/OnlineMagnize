package com.ocm.beans;

public class Member_profile {
private String mem_login_id;
private String passsword;
private 	String name;
private 	String email;
private String mobile;
private String address;
private String status;
public String getMem_login_id() {
	return mem_login_id;
}
public void setMem_login_id(String mem_login_id) {
	this.mem_login_id = mem_login_id;
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
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public Member_profile(String mem_login_id, String passsword, String name, String email, String mobile, String address,
		String status) {
	super();
	this.mem_login_id = mem_login_id;
	this.passsword = passsword;
	this.name = name;
	this.email = email;
	this.mobile = mobile;
	this.address = address;
	this.status = status;
}
public Member_profile()
{
}
}


