package com.seven.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.seven.domain.MemberBean;
import com.seven.domain.PageBean;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	public static final String memberspace = "com.seven.mapper.MemberMapper";	
	// memberspace → sql구문을 담고 있는 전체 바구니 ( src/main/resources/mappers/memberMapper.xml )
	
	@Override
	public void insertMember(MemberBean mb) {
		sqlSession.insert(memberspace+".insertMember", mb);						
	// memberspace.+"실행할 sql구문의 id값" (src/main/resources/mappers/memberMapper.xml 파일에서 확인할 수 있어요!)
	}

	@Override
	public MemberBean userCheck(MemberBean mb) {
		return sqlSession.selectOne(memberspace+".userCheck", mb);
	}

	@Override
	public MemberBean getMember(String member_id) {
		return sqlSession.selectOne(memberspace+".getMember", member_id);
	}

	@Override
	public void updateMember(MemberBean mb) {
		sqlSession.update(memberspace+".updateMember", mb);	
	}

	@Override
	public void deleteMember(MemberBean mb) {
		sqlSession.delete(memberspace+".deleteMember", mb);
	}

	@Override
	public List<MemberBean> getMemberList() {
		return sqlSession.selectList(memberspace+".getMemberList");
	}
	
	@Override
	public List<MemberBean> getMemberList_byPeriod(MemberBean mb) {
		return sqlSession.selectList(memberspace+".getMemberList_byPeriod", mb);
	}
	
	@Override
	public List<MemberBean> getMemberList_byId(MemberBean mb) {
		return sqlSession.selectList(memberspace+".getMemberList_byId", mb);
	}
	
	@Override
	public List<MemberBean> getMemberList_byName(MemberBean mb) {
		return sqlSession.selectList(memberspace+".getMemberList_byName", mb);
	}


	//비밀번호변경
	@Override
	public int updatePw(MemberBean mb) throws Exception {
		return sqlSession.update(memberspace+".updatePw", mb);
	}

	@Override
	public MemberBean idCheck(String member_id) {
		return sqlSession.selectOne(memberspace+".idCheck", member_id);
	}

	@Override
	public MemberBean idCheck2(String member_id) {
		return sqlSession.selectOne(memberspace+".idCheck", member_id);
	}
	
	
	
}
