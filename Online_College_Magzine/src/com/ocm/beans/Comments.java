package com.ocm.beans;

public class Comments {
private int article_id;
private String comments;
private String  givenby;
public Comments(int article_id, String comments, String givenby) {
	super();
	this.article_id = article_id;
	this.comments = comments;
	this.givenby = givenby;
}
public int getArticle_id() {
	return article_id;
}
public void setArticle_id(int article_id) {
	this.article_id = article_id;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}
public String getGivenby() {
	return givenby;
}
public void setGivenby(String givenby) {
	this.givenby = givenby;
}
public Comments()
{
	
}

}
