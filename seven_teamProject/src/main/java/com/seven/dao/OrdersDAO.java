package com.seven.dao;

import java.util.List;

import com.seven.domain.CartBean;
import com.seven.domain.OrdersBean;
import com.seven.domain.ProductBean;

public interface OrdersDAO {

	List<OrdersBean> getOrderList(String member_id);


	List<ProductBean> getProductOrderList(String member_id); 
	
	public void insertOrders(OrdersBean ob);
	
	public void deleteOrders(OrdersBean ob);
	
	public void cartAllDelete(CartBean cb);
	
	public Integer getMaxNum();
	
	OrdersBean getPaymentinfo(OrdersBean orderBean);

	public void updateStatus(OrdersBean orderBean);
	

}