package com.seven.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.seven.domain.PageBean;
import com.seven.domain.ProductBean;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	public static final String productspace = "com.seven.mapper.ProductMapper";
	
	//		●상품번호 최대값 찾기 시작 ↓↓
	@Override
	public Integer getMaxProduct_num() {		
		return sqlSession.selectOne(productspace + ".getMaxProduct_num");
	}
	//		●상품번호 최대값 찾기  끝 ↑↑
	
	
	//		●상품등록 시작 ↓↓
	@Override
	public void insertProduct(ProductBean pb) {		
		sqlSession.insert(productspace + ".insertProduct", pb);		
	}
	//		●상품등록 끝 ↑↑
	
	
	//		●상품수정 시작 ↓↓
	@Override
	public void updateProduct(ProductBean pb) {		
		sqlSession.update(productspace + ".updateProduct", pb);		
	}
	//		●상품수정 끝 ↑↑
	
	
	//		●상품삭제 시작 ↓↓
	@Override
	public void deleteProduct(ProductBean pb) {
		sqlSession.delete(productspace + ".deleteProduct", pb);
	}
	//		●상품삭제 끝 ↑↑
	
	
	//		●상품정보 불러오기 시작 ↓↓
	@Override
	public ProductBean getProduct(int product_num) {		
		return sqlSession.selectOne(productspace + ".getProduct", product_num);	
	}
	//		●상품정보 불러오기 끝 ↑↑
	
	
	//		●상품목록 불러오기 시작 ↓↓
	@Override
	public List<ProductBean> getProductList() {
		return null;
	}
	//		●상품목록 불러오기 끝 ↑↑
	
	
	//		●상품 개수 불러오기 시작 ↓↓
	@Override
	public Integer getProductCount() {		
		return sqlSession.selectOne(productspace+".getProductCount");
	}
	//		●상품 개수 불러오기 끝 ↑↑
	
	
	//		●상품목록 불러오기(PageBean pb) 시작 ↓↓
	@Override
	public List<ProductBean> getProductList(PageBean pb) {
		return sqlSession.selectList(productspace + ".getProductList", pb);
	}
	//		●상품목록 불러오기(PageBean pb) 끝 ↑↑
	
	
	//		●getPriceList 시작 ↓↓
	@Override
	public List<ProductBean> getPriceList(PageBean pb) {
		return sqlSession.selectList(productspace+".getPriceList", pb);		
	}
	//		●getPriceList 끝 ↑↑


	//		●낮은 가격순 정렬 시작 ↓↓
	@Override
	public List<ProductBean> getLowList(PageBean pb) {		
		return sqlSession.selectList(productspace+".getLowList", pb);
	}
	//		●낮은 가격순 정렬 끝 ↑↑
	
	
	//		●높은 가격순 정렬 시작 ↓↓
	@Override
	public List<ProductBean> getHighList(PageBean pb) {		
		return sqlSession.selectList(productspace+".getHighList", pb);
	}
	//		●높은 가격순 정렬 끝 ↑↑
	
	
	//		●인기순 정렬 시작 ↓↓
	@Override
	public List<ProductBean> getPopularList(PageBean pb) {		
		return sqlSession.selectList(productspace+".getPopularList", pb);
	}
	//		●인기순 정렬 끝 ↑↑
	

	//		●카테고리 별 불러오기 시작 ↓↓
	@Override
	public List<ProductBean> getCategoryList(PageBean pb) {		
		return sqlSession.selectList(productspace+".getCategoryList",pb);
	}
	//		●카테고리 별 불러오기 끝 ↑↑
	
	
}
