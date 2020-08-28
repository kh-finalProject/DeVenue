package com.kh.DeVenue.myPage.model.dao;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.Profile;

@Repository("myPageDao")

public class MyPageDao {

	@SuppressWarnings("unused")
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int updateIntroduce(Profile profile) {
		
		return sqlSessionTemplate.update("memberMapper.profileUpdate", profile);
	}

	public Profile selectIntroduce(Profile memId) {
		
		return sqlSessionTemplate.selectOne("memberMapper.selectProfile", memId);
	}
	
	

}
