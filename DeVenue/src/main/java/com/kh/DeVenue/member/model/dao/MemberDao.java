package com.kh.DeVenue.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
