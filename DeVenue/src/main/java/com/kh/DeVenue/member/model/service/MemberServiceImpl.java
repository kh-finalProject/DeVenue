package com.kh.DeVenue.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.dao.MemberDao;
import com.kh.DeVenue.member.model.vo.CPeval;
import com.kh.DeVenue.member.model.vo.EPid;
import com.kh.DeVenue.member.model.vo.EvalProjectList;
import com.kh.DeVenue.member.model.vo.FCeval;
import com.kh.DeVenue.member.model.vo.FCprojectHistory;
import com.kh.DeVenue.member.model.vo.FindClient;
import com.kh.DeVenue.member.model.vo.FindClientDetail;
import com.kh.DeVenue.member.model.vo.MatchingPartnersList;
import com.kh.DeVenue.util.model.vo.MemChatSet;
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
		
		return mDao.loginMember(m);
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

	@Override
	public ArrayList<FindClient> selectList(PageInfo pi) {
		return mDao.selectList(pi);
	}
//	@Override
//	public ArrayList<FindClient> selectList() {
//		return mDao.selectList();
//	}

	@Override
	public ArrayList<FindClientDetail> selectClientDetail(Integer cId) {
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
	public ArrayList<CPeval> selectCPeval(Integer cId, PageInfo pi) {
		return mDao.selectCPeval(cId, pi);
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

	@Override
	public Member selectMember(Member mEmail) {
		
		return mDao.selectMemberId(mEmail);
	}

	@Override
	public int insertChatSet(MemChatSet mc) {
		
		return mDao.insertChatSet(mc);
	}

	@Override
	public int membernick(String nick) {
		
		return mDao.membernick(nick);
	}

	@Override
	public int memberemail(String email) {
		
		return mDao.memberemail(email);
	}

	@Override

	public int insertIden(int memId) {
		
		return mDao.insertIden(memId);
	}

	public int insertEval(HashMap id) {
		return mDao.insertEval(id);
	}

	@Override
	public int getListCount(String memNick) {
		return mDao.getListCount(memNick);
	}

	@Override
	public ArrayList<FindClient> selectList(PageInfo pi, String memNick) {
		return mDao.selectList(pi, memNick);
	}

	@Override
	public int getListCount2(String introduction) {
		return mDao.getListCount2(introduction);
	}

	@Override
	public ArrayList<FindClient> selectList2(PageInfo pi, String introduction) {
		return mDao.selectList2(pi, introduction);
	}

	@Override
	public Map<String, String> isDeathOrSanctions(String memEmail) {
		return mDao.isDeathOrSanctions(memEmail);
	}

	@Override
	public int updateDecAndDeath(String memEmail) {
		return mDao.updateDecAndDeath(memEmail);
	}

	@Override
	public int toDeath(String memEmail) {
		return mDao.toDeath(memEmail);
	}

	public ArrayList<FindClient> selectList(PageInfo pi, int status) {
		return mDao.selectList(pi, status);
	}

	@Override
	public EPid getEPid(HashMap id) {
		return mDao.getEPid(id);
	}

	@Override
	public int insertClientReport(HashMap report) {
		return mDao.insertClientReport(report);
	}

	@Override
	public int countUpReport(int reportCid) {
		return mDao.countUpReport(reportCid);
	}

	@Override
	public int reportCheck(HashMap report) {
		return mDao.reportCheck(report);
	}

	@Override
	public Member selectMmber(String email, String pwd) {
		return mDao.selectMember(email,pwd);
	}

	public ArrayList<FindClient> addressList(PageInfo pi, HashMap mapAddress) {
		return mDao.addressList(pi, mapAddress);
	}

	@Override
	public ArrayList<FindClient> filterList(PageInfo pi, HashMap mapFilter) {
		return mDao.filterList(pi, mapFilter);
	}

	@Override
	public int checkReEval(HashMap id) {
		return mDao.checkReEval(id);
	}


}