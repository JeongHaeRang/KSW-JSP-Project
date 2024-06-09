package com.KSW.web.dto;

import java.sql.Date;

public class ReviewDTO {
	private String replynum;
	private String isbn;
	private String userid;
	private Date replyinsertdate;
	private int replygrade;
	private String reply;
	public String getReplynum() {
		return replynum;
	}
	public void setReplynum(String replynum) {
		this.replynum = replynum;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getReplyinsertdate() {
		return replyinsertdate;
	}
	public void setReplyinsertdate(Date replyinsertdate) {
		this.replyinsertdate = replyinsertdate;
	}
	public int getReplygrade() {
		return replygrade;
	}
	public void setReplygrade(int replygrade) {
		this.replygrade = replygrade;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
}	
