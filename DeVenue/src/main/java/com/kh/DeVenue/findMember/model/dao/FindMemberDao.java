package com.kh.DeVenue.findMember.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.Member;

@Repository("fmDao")
public class FindMemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Member> memberAll() {
		
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.memberAll");
	}

}
