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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int pwdChangeMember(Member pwdchange) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int profileInsert(int memId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<FindClient> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FindClient selectClientDetail(Integer cId) {
		// TODO Auto-generated method stub
		return mDao.selectClientDetail(cId);
	}


}
