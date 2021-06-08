package com.seven.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.seven.domain.PageBean;
import com.seven.domain.ProductBean;
import com.seven.domain.Review_boardBean;

@Repository
public class Review_BoardDAOImpl implements Review_BoardDAO{

	//마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.seven.mapper.review_BoardMapper";
	
	@Override
	public void insertReview_Board(Review_boardBean rb) {
		sqlSession.insert(namespace+".insertReview_Board",rb);
	}

	@Override
	public Integer getMaxReview_BoardNum() {
		return sqlSession.selectOne(namespace+".getMaxReview_BoardNum");
	}
	
	@Override
	public List<Review_boardBean> Review_boardList(PageBean pb) {
		return sqlSession.selectList(namespace+".Review_boardList", pb);
	}
	
	@Override
	public Integer getReview_BoardCount() {
		return sqlSession.selectOne(namespace+".getReview_BoardCount");
	}

	@Override
	public Review_boardBean getreview_Board(int num) {
		return sqlSession.selectOne(namespace+".getreview_Board", num);
	}

	@Override
	public Review_boardBean numCheck(Review_boardBean rb) {
		return sqlSession.selectOne(namespace+".numCheck", rb);
	}

	@Override
	public void updateReview_Board(Review_boardBean rb) {
		sqlSession.update(namespace+".updateReview_Board", rb);
	}

	@Override
	public void deleteReview_Board(Review_boardBean rb) {
		sqlSession.delete(namespace+".deleteReview_Board", rb);
		
	}


	
	

}
