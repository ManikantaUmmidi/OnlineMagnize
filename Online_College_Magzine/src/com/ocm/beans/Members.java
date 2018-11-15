package com.ocm.beans;

public class Members {
private String unique_id;
private String type;
public Members(String unique_id, String type) {
	super();
	this.unique_id = unique_id;
	this.type = type;
}
public String getUnique_id() {
	return unique_id;
}
public void setUnique_id(String unique_id) {
	this.unique_id = unique_id;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public Members()
{
	
}
}
