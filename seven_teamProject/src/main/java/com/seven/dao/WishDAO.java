package com.seven.dao;

import java.util.List;

import com.seven.domain.ProductBean;
import com.seven.domain.WishBean;

public interface WishDAO {

	//----------------------서예은--------------------
//	public List<WishBean> getWishList(String member_id); // wish 테이블의 정보만 가져옴 -> product관련 정보 없음
	
	public List<ProductBean> getWishProductList(String member_id);
	
	public WishBean wishCheck(WishBean wishB);
	
	public void wishDelete(WishBean wishB);
	
	public void wishInsert(WishBean wishB);
	//----------------------서예은--------------------
	
}
