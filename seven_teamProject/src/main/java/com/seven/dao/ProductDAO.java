package com.seven.dao;

import java.util.List;

import com.seven.domain.PageBean;
import com.seven.domain.ProductBean;

public interface ProductDAO {	

	public void insertProduct(ProductBean pb);
	
	public Integer getMaxProduct_num();	
	
	public void updateProduct(ProductBean pb);

	public void deleteProduct(ProductBean pb);

	public ProductBean getProduct(int product_num);	
	
	public List<ProductBean> getProductList();
	
	public Integer getProductCount();	
	public List<ProductBean> getProductList(PageBean pb);
	public List<ProductBean> getPriceList(PageBean pb);
	public List<ProductBean> getLowList(PageBean pb);
	public List<ProductBean> getHighList(PageBean pb);
	public List<ProductBean> getPopularList(PageBean pb);
	public List<ProductBean> getCategoryList(PageBean pb);

}
