package com.seven.service;

import java.util.List;

import com.seven.domain.PageBean;
import com.seven.domain.ProductBean;

public interface ProductService {
	
	public ProductBean getProduct(int product_num);
	
	public void insertProduct(ProductBean productBean);
	
	public void updateProduct(ProductBean productBean);
	
	public void deleteProduct(ProductBean productBean);
	
	public List<ProductBean> getProductList();	
	public List<ProductBean> getProductList(PageBean pb);
	public List<ProductBean> getPriceList(PageBean pb);
	public List<ProductBean> getLowList(PageBean pb);
	public List<ProductBean> getHighList(PageBean pb);
	public List<ProductBean> getPopularList(PageBean pb);
	public Integer getProductCount();
	public List<ProductBean> getCategoryList(PageBean pb);
}
