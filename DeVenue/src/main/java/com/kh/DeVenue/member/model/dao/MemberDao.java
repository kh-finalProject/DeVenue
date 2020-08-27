package com.kh.DeVenue.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.FindClient;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.PageInfo;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	public Member selectMember(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.selectOne",m);
	}


	public int getListCount() {
		return sqlSessionTemplate.selectOne("memberMapper.getListCount");
	}


	public ArrayList<FindClient> selectList(PageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectList", null, rowBounds);
	}
}
