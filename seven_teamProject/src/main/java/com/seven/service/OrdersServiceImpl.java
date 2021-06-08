package com.seven.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seven.dao.OrdersDAO;
import com.seven.domain.CartBean;
import com.seven.domain.OrdersBean;
import com.seven.domain.ProductBean;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Inject
	private OrdersDAO ordersDAO;


	
	@Override
	public OrdersBean getPaymentinfo(OrdersBean orderBean) {
		// TODO Auto-generated method stub
		return ordersDAO.getPaymentinfo(orderBean);
	}


	@Override
	public void updateStatus(OrdersBean orderBean) {
		// TODO Auto-generated method stub
		ordersDAO.updateStatus(orderBean);
	}


	@Override
	public List<OrdersBean> getOrderList(String member_id) {
		
		
		return ordersDAO.getOrderList(member_id);
	}


	@Override
	public List<ProductBean> getProductOrderList(String member_id) {
		return ordersDAO.getProductOrderList(member_id);
	}


	@Override
	public void insertOrders(OrdersBean ob) {
		// TODO Auto-generated method stub
		if(ordersDAO.getMaxNum()!=null) {
			ob.setOrders_num(ordersDAO.getMaxNum()+1);
		}else {
			ob.setOrders_num(1);
		}
		ordersDAO.insertOrders(ob);
		
	}


	@Override
	public void deleteOrders(OrdersBean ob) {
		// TODO Auto-generated method stub
		ordersDAO.deleteOrders(ob);
		
	}


	@Override
	public void cartAllDelete(CartBean cb) {
		// TODO Auto-generated method stub
		
		ordersDAO.cartAllDelete(cb);
		
	}
}