package com.kh.DeVenue.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Profile;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	public Member selectMember(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.selectMember",m);
	}


	public int insertMember(Member m) {
		
		return sqlSessionTemplate.insert("memberMapper.insertMember",m);
	}


	public int updatePwdMember(Member pwdchange) {
		
		return sqlSessionTemplate.update("memberMapper.updatePwdMember", pwdchange);
	}

	public Profile selectProfile(Profile memId) {

		return sqlSessionTemplate.selectOne("memberMapper.selectProfile", memId);
	}
	
	public int insertProfile(int memId) {
		
		return sqlSessionTemplate.insert("memberMapper.insertProfile", memId);
	}


	



}
