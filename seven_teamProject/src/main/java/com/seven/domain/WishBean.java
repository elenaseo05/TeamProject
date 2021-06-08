package com.seven.domain;

import java.sql.Timestamp;

public class WishBean {
	
	private Timestamp wish_date;
	private String member_id;
	private int review_board_num;
	private int product_num;
	
	
	public Timestamp getWish_date() {
		return wish_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public int getReview_board_num() {
		return review_board_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setWish_date(Timestamp wish_date) {
		this.wish_date = wish_date;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public void setReview_board_num(int review_board_num) {
		this.review_board_num = review_board_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	@Override
	public String toString() {
		// JSON 으로 return
//		{ "wish_date":"2020-02-01", "member_id":"kim"},
		return "wish_date :" + wish_date + ", member_id : " + member_id + 
				", review_board_num : " + review_board_num 
				+ ", product_num : " + product_num;
	}
	
	

	

	
	

}
