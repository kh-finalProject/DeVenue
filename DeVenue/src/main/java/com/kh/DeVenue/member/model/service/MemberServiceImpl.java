package com.kh.DeVenue.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.dao.MemberDao;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Profile;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao mDao;

	@Override
	public Member loginUserMember(Member m) {
		
		return mDao.selectMember(m);
	}

	@Override
	public int insertMember(Member m) {
		
		return mDao.insertMember(m);
	}

	@Override
	public int pwdChangeMember(Member pwdchange) {

		return mDao.updatePwdMember(pwdchange);
	}

	@Override
	public Profile profile(Profile memId) {

		return mDao.selectProfile(memId);
	}

	@Override
	public int profileInsert(int memId) {
		
		return mDao.insertProfile(memId);
	}

	

}
