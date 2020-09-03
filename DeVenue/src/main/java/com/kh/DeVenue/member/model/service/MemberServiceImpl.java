package com.kh.DeVenue.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.dao.MemberDao;
import com.kh.DeVenue.member.model.vo.CPeval;
import com.kh.DeVenue.member.model.vo.EvalProjectList;
import com.kh.DeVenue.member.model.vo.FCeval;
import com.kh.DeVenue.member.model.vo.FCprojectHistory;
import com.kh.DeVenue.member.model.vo.FindClient;
import com.kh.DeVenue.member.model.vo.FindClientDetail;
import com.kh.DeVenue.member.model.vo.MatchingPartnersList;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.vo.PartInfo;
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

	
	public int getListCount() {
		
		return mDao.getListCount();
	}

//	@Override
//	public ArrayList<FindClient> selectList(PageInfo pi) {
//		return mDao.selectList(pi);
//	}
	@Override
	public ArrayList<FindClient> selectList() {
		return mDao.selectList();
	}

	@Override
	public FindClientDetail selectClientDetail(Integer cId) {
		return mDao.selectClientDetail(cId);
	}

	@Override
	public FCprojectHistory selectProjectHistory(Integer cId) {
		return mDao.selectProjectHistory(cId);
	}

	@Override
	public int getCPevalCount(Integer cId) {
		return mDao.getCPevalCount(cId);
	}

	@Override
	public ArrayList<CPeval> selectCPeval(Integer cId) {
		return mDao.selectCPeval(cId);
	}

	@Override
	public FCeval getFCeval(Integer cId) {
		return mDao.getFCeval(cId);
	}

	@Override
	public ArrayList<EvalProjectList> getClientInfo(Integer cId) {
		return mDao.getClientInfo(cId);
	}

	@Override
	public ArrayList<MatchingPartnersList> getMatchingPartners(HashMap id) {
		return mDao.getMatchingPartners(id);
	}

	@Override
	public int insertPartInfo(PartInfo partInfo) {
		
		return mDao.insertPartInfo(partInfo);
	}
}
