package com.seven.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seven.dao.Review_BoardDAO;
import com.seven.domain.PageBean;
import com.seven.domain.ProductBean;
import com.seven.domain.Review_boardBean;

@Service
public class Review_BoardServiceImpl implements Review_BoardService{

	@Inject
	private Review_BoardDAO review_BoardDAO;
	
	@Override
	public void insertReview_Board(Review_boardBean rb) {
		
		
		if(review_BoardDAO.getMaxReview_BoardNum()!=null) {
			rb.setReview_board_num(review_BoardDAO.getMaxReview_BoardNum()+1);
			
		}else {
			rb.setReview_board_num(1);
			
		}
		
		rb.setReview_board_date(new Timestamp(System.currentTimeMillis()));
		System.out.println(rb.getMember_id()+","+rb.getProduct_num()+","+rb.getReview_board_content());
		review_BoardDAO.insertReview_Board(rb);
	}

	@Override
	public List<Review_boardBean> Review_boardList(PageBean pb) {
		
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage()-1)*pb.getPageSize());
		
		return review_BoardDAO.Review_boardList(pb);
	}
	
	@Override
	public Integer getReview_BoardCount() {
		return review_BoardDAO.getReview_BoardCount() ;
	}	
	
	@Override
	public Review_boardBean getreview_Board(int num) {
		return review_BoardDAO.getreview_Board(num);
	}

	@Override
	public Review_boardBean numCheck(Review_boardBean rb) {
		return review_BoardDAO.numCheck(rb);
	}

	@Override
	public void updateReview_Board(Review_boardBean rb) {
		review_BoardDAO.updateReview_Board(rb);
	}

	@Override
	public void deleteReview_Board(Review_boardBean rb) {
		review_BoardDAO.deleteReview_Board(rb);
		
	}


}
