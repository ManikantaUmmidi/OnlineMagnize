package com.ocm.beans;

import java.util.Date;

public class Articles_status {
private int article_id;
private Date date_of_post;
private int rating;
private int count;
private String status;
private String reason;
private String reviewedby;
public Articles_status(int article_id, Date date_of_post, int rating, int count, String status, String reason,
		String reviewedby) {
	super();
	this.article_id = article_id;
	this.date_of_post = date_of_post;
	this.rating = rating;
	this.count = count;
	this.status = status;
	this.reason = reason;
	this.reviewedby = reviewedby;
}
public int getArticle_id() {
	return article_id;
}
public void setArticle_id(int article_id) {
	this.article_id = article_id;
}
public Date getDate_of_post() {
	return date_of_post;
}
public void setDate_of_post(Date date_of_post) {
	this.date_of_post = date_of_post;
}
public int getRating() {
	return rating;
}
public void setRating(int rating) {
	this.rating = rating;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getReason() {
	return reason;
}
public void setReason(String reason) {
	this.reason = reason;
}
public String getReviewedby() {
	return reviewedby;
}
public void setReviewedby(String reviewedby) {
	this.reviewedby = reviewedby;
}
public Articles_status()
{
	
}
}
