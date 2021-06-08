package com.seven.dao;

import java.util.List;

import com.seven.domain.CartBean;
import com.seven.domain.OrdersBean;
import com.seven.domain.ProductBean;


public interface CartDAO {
	public List<CartBean> getCartList(String id);
	
	public void deleteCart(CartBean cb);
	
	public ProductBean getProduct(int num);
	
	public ProductBean ProductCheck(ProductBean pb);
	
	
	public void insertCart(CartBean cb);
	
	public void cartupdate(CartBean cb);
	
	public CartBean cartcheck(CartBean cb);
	
	public void updateCheckCount(CartBean cb);
	
	public void cartAllDelete(CartBean cb);
	
	public Integer getMaxCartNum();
	
	
	
	
}
