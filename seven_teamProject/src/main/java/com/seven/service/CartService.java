package com.seven.service;

import java.util.List;

import com.seven.domain.CartBean;
import com.seven.domain.ProductBean;



public interface CartService {
	
	public List<CartBean> getCartList(String id);
	
	public void deleteCart(CartBean cb);
	
	public List<ProductBean> getProductList(String id);
	
	public ProductBean ProductCheck(ProductBean pb);
	
	public void insertCart(CartBean cb);
	
	public void cartupdate(CartBean cb);
	
	public CartBean cartcheck(CartBean cb);
	
	public void updateCheckCount(CartBean cb);
	
	public void cartAllDelete(CartBean cb);
	
	
	
	
}
