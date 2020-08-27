package com.kh.DeVenue.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.dao.MemberDao;
import com.kh.DeVenue.member.model.vo.FindClient;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.PageInfo;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao mDao;

	@Override
	public Member loginUserMember(Member m) {
		
		return mDao.selectMember(m);
	}

	@Override
	public int getListCount() {
		return mDao.getListCount();
	}

	@Override
	public ArrayList<FindClient> selectList(PageInfo pi) {
		return mDao.selectList(pi);
	}
}
