package com.seven.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.seven.domain.CartBean;
import com.seven.domain.OrdersBean;
import com.seven.domain.ProductBean;

@Repository
public class OrdersDAOImpl implements OrdersDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.seven.mapper.OrdersMapper";

	@Override
	public List<OrdersBean> getOrderList(String member_id) {

		return sqlSession.selectList(namespace + ".getOrderList", member_id );
	}

	@Override
	public List<ProductBean> getProductOrderList(String member_id) {
		return sqlSession.selectList(namespace + ".getProductOrderList", member_id );
	}

	@Override
	public void insertOrders(OrdersBean ob) {
		// TODO Auto-generated method stub
		System.out.println(ob.getOrders_payment());
		sqlSession.insert(namespace + ".insertOrders",ob);
	}

	@Override
	public void deleteOrders(OrdersBean ob) {
		// TODO Auto-generated method stub
		
		sqlSession.delete(namespace+".deleteOrders",ob);
		
	}

	@Override
	public void cartAllDelete(CartBean cb) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".cartAllDelete",cb);
		
	}

	@Override
	public Integer getMaxNum() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}
	
	@Override
	public OrdersBean getPaymentinfo(OrdersBean orderBean) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getPaymentinfo", orderBean);
	}

	@Override
	public void updateStatus(OrdersBean orderBean) {
		// 배송 상태 업데이트 공통 
		sqlSession.update(namespace + ".updateStatus", orderBean);
	}
	
	
}
