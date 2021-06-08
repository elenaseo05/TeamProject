package com.seven.dao;

import java.util.List;

import com.seven.domain.MemberBean;
import com.seven.domain.PageBean;

public interface MemberDAO {
	
	public void insertMember(MemberBean mb);
	
	public MemberBean userCheck(MemberBean mb);
	
	public MemberBean getMember(String member_id);
	
	public void updateMember(MemberBean mb);
	
	public void deleteMember(MemberBean mb);
	
	public List<MemberBean> getMemberList();
	
	public List<MemberBean> getMemberList_byPeriod(MemberBean mb);
	
	public List<MemberBean> getMemberList_byId(MemberBean mb);
	
	public List<MemberBean> getMemberList_byName(MemberBean mb);
	
	public int updatePw(MemberBean mb) throws Exception;

	public MemberBean idCheck(String member_id);
	

	public MemberBean idCheck2(String member_id);
	

}

