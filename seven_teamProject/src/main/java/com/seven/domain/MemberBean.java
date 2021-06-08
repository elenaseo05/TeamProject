package com.seven.domain;

import java.sql.Timestamp;

public class MemberBean {
	private String member_id;
	private String member_pass;
	private String member_name;
	private String member_email;
	private String member_address;
	private int member_zipcode;
	private String member_address2;
	private String member_phone;
	private String startDate;
	private String endDate;
	private Timestamp member_birth;
	private Timestamp member_joindate;
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public String getMember_name() {
		return member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public String getMember_address() {
		return member_address;
	}
	public int getMember_zipcode() {
		return member_zipcode;
	}
	public String getMember_address2() {
		return member_address2;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public Timestamp getMember_birth() {
		return member_birth;
	}
	public Timestamp getMember_joindate() {
		return member_joindate;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public void setMember_zipcode(int member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public void setMember_birth(Timestamp member_birth) {
		this.member_birth = member_birth;
	}
	public void setMember_joindate(Timestamp member_joindate) {
		this.member_joindate = member_joindate;
	}
	
	
	
	
	
}
