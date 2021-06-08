package com.seven.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.seven.domain.PageBean;
import com.seven.dao.ProductDAO;
import com.seven.domain.PageBean;
import com.seven.domain.ProductBean;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDAO productDAO;

	@Override
	public void insertProduct(ProductBean productBean) {
		if(productDAO.getMaxProduct_num() != null) {
			productBean.setProduct_num(productDAO.getMaxProduct_num() + 1);			
		}else {
			productBean.setProduct_num(1);
		}	// 상품번호가 존재한다면 최대값에서 +1, 상품번호가 존재하지 않으면 번호를 1로 설정
		productBean.setProduct_detail_date(new Timestamp(System.currentTimeMillis()));
		productDAO.insertProduct(productBean);
		
	}

	@Override
	public ProductBean getProduct(int product_num) {		
		return productDAO.getProduct(product_num);
	}
	
	@Override
	public void deleteProduct(ProductBean productBean) {
		productDAO.deleteProduct(productBean);		
	}

	

//	@Override
//	public void updateProduct(ProductBean productBean) {
//	public List<ProductBean> getProductList(PageBean pb) {
//
//	}

//	@Override
//	public void deleteProduct(ProductBean productBean) {
//				pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
//				
//				pb.setStartRow((pb.getCurrentPage()-1)*pb.getPageSize());
//		
//		return productDAO.getProductList(pb);
//	}




	@Override
	public Integer getProductCount() {
		
		return productDAO.getProductCount();
	}
	
	@Override
	public List<ProductBean> getProductList(PageBean pb) {
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage()-1 ) * pb.getPageSize());
		
		return productDAO.getProductList(pb);
	}
	


	@Override
	public List<ProductBean> getPriceList(PageBean pb) {
		
		return productDAO.getPriceList(pb);
	}



	@Override
	public List<ProductBean> getLowList(PageBean pb) {
		
		return productDAO.getLowList(pb);
	}



	@Override
	public List<ProductBean> getHighList(PageBean pb) {
		
		return productDAO.getHighList(pb);
	}



	@Override
	public List<ProductBean> getPopularList(PageBean pb) {
		
		return productDAO.getPopularList(pb);
	}

	@Override
	public void updateProduct(ProductBean productBean) {
		productDAO.updateProduct(productBean);
	}

	@Override
	public List<ProductBean> getProductList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ProductBean> getCategoryList(PageBean pb) {
		
		return productDAO.getCategoryList(pb);
	}




}
