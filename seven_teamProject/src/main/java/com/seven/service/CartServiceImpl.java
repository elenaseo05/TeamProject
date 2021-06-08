package com.seven.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seven.dao.CartDAO;
import com.seven.domain.CartBean;
import com.seven.domain.ProductBean;

@Service
public class CartServiceImpl implements CartService{
	
	@Inject
	private CartDAO cartDAO;
	
	@Override
	public List<CartBean> getCartList(String id) {
		// TODO Auto-generated method stub
		
		List<CartBean> cbList=cartDAO.getCartList(id);
		for(int i=0; i < cbList.size(); i++) {
			CartBean cb=cbList.get(i);
			int num=cb.getProduct_num();
			
			
		ProductBean pb=cartDAO.getProduct(num);
		cb.setProduct_price(pb.getProduct_price());
		cb.setProduct_title(pb.getProduct_title());
		cb.setProduct_image(pb.getProduct_image());
		
		}
		
		return cbList;
	}

	@Override
	public void deleteCart(CartBean cb) {
		// TODO Auto-generated method stub
		cartDAO.deleteCart(cb);
	}

	@Override
	public List<ProductBean> getProductList(String id) {
		List<CartBean> cbList=cartDAO.getCartList(id);
		List<ProductBean> pbList=new ArrayList<ProductBean>();
		for(int i=0; i < cbList.size(); i++) {
			CartBean cb=cbList.get(i);
			int num=cb.getProduct_num();
			
			
			pbList.add(cartDAO.getProduct(num));
		}
		return pbList;
	}

	@Override
	public ProductBean ProductCheck(ProductBean pb) {
		// TODO Auto-generated method stub
		return cartDAO.ProductCheck(pb);
	}

	@Override
	public void insertCart(CartBean cb) {
		// TODO Auto-generated method stub
		System.out.println("dddddd");
		if(cartDAO.getMaxCartNum()!=null) {
			cb.setCart_num(cartDAO.getMaxCartNum()+1);
		}else {
			cb.setCart_num(1);
		}
		cartDAO.insertCart(cb);
	}

	@Override
	public void cartupdate(CartBean cb) {
		// TODO Auto-generated method stub
		
		cartDAO.cartupdate(cb);
		
	}

	@Override
	public CartBean cartcheck(CartBean cb) {
		// TODO Auto-generated method stub
		return cartDAO.cartcheck(cb);
	}

	@Override
	public void updateCheckCount(CartBean cb) {
		// TODO Auto-generated method stub
		cartDAO.updateCheckCount(cb);
	}

	@Override
	public void cartAllDelete(CartBean cb) {
		// TODO Auto-generated method stub
		
		cartDAO.cartAllDelete(cb);
		
	}

	

	
	
}
