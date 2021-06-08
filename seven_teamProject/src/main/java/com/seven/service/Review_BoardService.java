package com.seven.service;

import java.util.List;

import com.seven.domain.PageBean;
import com.seven.domain.ProductBean;
import com.seven.domain.Review_boardBean;

public interface Review_BoardService {

	// 추상메서드
	public void insertReview_Board(Review_boardBean rb);

	public List<Review_boardBean> Review_boardList(PageBean pb);
	
	public Integer getReview_BoardCount();

	public Review_boardBean getreview_Board(int num);

	public Review_boardBean numCheck(Review_boardBean rb);

	public void updateReview_Board(Review_boardBean rb);

	public void deleteReview_Board(Review_boardBean rb);


}
