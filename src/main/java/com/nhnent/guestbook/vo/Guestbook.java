package com.nhnent.guestbook.vo;

import java.util.Date;


public class Guestbook {
	private int number;
	private String email;
	private String password;
	private String content;
	private Date updateTime;
	private Date registTime;
	public int getNumber() {
		return number;
	}
	public Guestbook setNumber(int number) {
		this.number = number;
		return this;
	}
	public String getEmail() {
		return email;
	}
	public Guestbook setEmail(String email) {
		this.email = email;
		return this;
	}
	public String getPassword() {
		return password;
	}
	public Guestbook setPassword(String password) {
		this.password = password;
		return this;
	}
	public String getContent() {
		return content;
	}
	public Guestbook setContent(String content) {
		this.content = content;
		return this;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public Guestbook setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
		return this;
	}
	public Date getRegistTime() {
		return registTime;
	}
	public Guestbook setRegistTime(Date registTime) {
		this.registTime = registTime;
		return this;
	}
}
