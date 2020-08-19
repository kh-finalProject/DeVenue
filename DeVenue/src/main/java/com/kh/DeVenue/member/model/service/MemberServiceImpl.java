package com.kh.DeVenue.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.dao.MemberDao;
import com.kh.DeVenue.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao mDao;

	@Override
	public Member loginUserMember(Member m) {
		
		return mDao.selectMember(m);
	}
}
