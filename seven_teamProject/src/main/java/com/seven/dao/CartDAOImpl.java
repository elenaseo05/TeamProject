package com.seven.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.seven.domain.CartBean;
import com.seven.domain.ProductBean;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	public static final String cartspace = "com.seven.mapper.CartsMapper";	
	// memberspace → sql구문을 담고 있는 전체 바구니 ( src/main/resources/mappers/memberMapper.xml )

	@Override
	public List<CartBean> getCartList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(cartspace+".getCartList",id);
	}

	@Override
	public void deleteCart(CartBean cb) {
		// TODO Auto-generated method stub
		sqlSession.delete(cartspace+".deleteCart",cb);
	}

	@Override
	public ProductBean getProduct(int num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(cartspace+".getProduct",num );
	}

	@Override
	public ProductBean ProductCheck(ProductBean pb) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(cartspace+".ProductCheck",pb);
	}

	@Override
	public void insertCart(CartBean cb) {
		
		
		sqlSession.insert(cartspace + ".insertCart",cb);
		
	}

	@Override
	public void cartupdate(CartBean cb) {
		// TODO Auto-generated method stub
		sqlSession.update(cartspace + ".cartupdate",cb);
		
	}

	@Override
	public CartBean cartcheck(CartBean cb) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(cartspace+".cartcheck",cb);
	}

	@Override
	public void updateCheckCount(CartBean cb) {
		// TODO Auto-generated method stub
		sqlSession.update(cartspace + ".updateCheckCount",cb);
	}

	@Override
	public void cartAllDelete(CartBean cb) {
		// TODO Auto-generated method stub
		sqlSession.delete(cartspace+".cartAllDelete",cb);
		
	}

	@Override
	public Integer getMaxCartNum() {
		// TODO Auto-generated method stub
		
		
		return sqlSession.selectOne(cartspace+ ".getMaxCartNum");
	}
}
