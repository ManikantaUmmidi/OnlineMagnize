package com.ocm.beans;

public class Articles {
private int article_id;
private String category;
private String tag;
private String article;
private String poster_id;
private String status;
public int getArticle_id() {
	return article_id;
}
public void setArticle_id(int article_id) {
	this.article_id = article_id;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getTag() {
	return tag;
}
public void setTag(String tag) {
	this.tag = tag;
}
public String getArticle() {
	return article;
}
public void setArticle(String article) {
	this.article = article;
}
public String getPoster_id() {
	return poster_id;
}
public void setPoster_id(String poster_id) {
	this.poster_id = poster_id;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public Articles(int article_id, String category, String tag, String article, String poster_id, String status) {
	super();
	this.article_id = article_id;
	this.category = category;
	this.tag = tag;
	this.article = article;
	this.poster_id = poster_id;
	this.status = status;
}
public Articles()
{
	
}
}
