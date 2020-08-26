package com.kh.DeVenue.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	public Member selectMember(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.selectOne",m);
	}


	public int insertMember(Member m) {
		
		return sqlSessionTemplate.insert("memberMapper.insertMember",m);
	}


	public int updatePwdMember(Member pwdchange) {
		
		return sqlSessionTemplate.update("memberMapper.updatePwdMember", pwdchange);
	}


}
