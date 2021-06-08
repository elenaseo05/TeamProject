package com.seven.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seven.dao.WishDAO;
import com.seven.domain.ProductBean;
import com.seven.domain.WishBean;

@Service
public class WishServiceImpl implements WishService {

	@Inject
	private WishDAO wishDAO;
	
	//----------------------서예은--------------------
//	@Override
//	public List<WishBean> getWishList(String member_id) {  // wish 테이블의 정보만 가져옴 -> product관련 정보 없음
//		// wishList 
//		System.out.println("WishServiceImpl | List<WishBean> getWishList(String id) ");
//		return wishDAO.getWishList(member_id);
//	}
	
	@Override
	public List<ProductBean> getWishProductList(String member_id) {
		// wishList Product 정보 
		System.out.println("WishServiceImpl | List<ProductBean> getWishProductList(String member_id) ");
		return wishDAO.getWishProductList(member_id);
	}

	@Override
	public WishBean wishCheck(WishBean wishB) {
		// wish 테이블에 같은아이디에, product_num이 존재하는지 확인 
		// 있으면 true, 없으면 false 
		System.out.println("WishServiceImpl | WishBean wishCheck(WishBean wishB) ");
		return wishDAO.wishCheck(wishB);
	}

	@Override
	public void wishDelete(WishBean wishB) {
		// wish 테이블에서 동일 id, product_num 삭제 | 리턴 값 없음
		System.out.println("WishServiceImpl | public void wishDelete(WishBean wishB) ");
		wishDAO.wishDelete(wishB);
	}

	@Override
	public void wishInsert(WishBean wishB) {
		System.out.println("WishServiceImpl | public void wishInsert(WishBean wishB) ");
		// 추가한 날짜 주입 
		wishB.setWish_date(new Timestamp(System.currentTimeMillis()));
		wishDAO.wishInsert(wishB);
	}
	
	
	//----------------------서예은--------------------
}
