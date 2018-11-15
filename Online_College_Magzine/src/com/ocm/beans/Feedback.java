package com.ocm.beans;

public class Feedback {
private int fb_id;
private String feedback;
private String givenby;
public Feedback(int fb_id, String feedback, String givenby) {
	super();
	this.fb_id = fb_id;
	this.feedback = feedback;
	this.givenby = givenby;
}
public int getFb_id() {
	return fb_id;
}
public void setFb_id(int fb_id) {
	this.fb_id = fb_id;
}
public String getFeedback() {
	return feedback;
}
public void setFeedback(String feedback) {
	this.feedback = feedback;
}
public String getGivenby() {
	return givenby;
}
public void setGivenby(String givenby) {
	this.givenby = givenby;
}
public Feedback() {

}
}
