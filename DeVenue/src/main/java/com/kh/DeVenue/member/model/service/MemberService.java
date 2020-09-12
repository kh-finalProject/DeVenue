package com.kh.DeVenue.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

public interface MemberService {

	Member loginUserMember(Member m);

	int insertMember(Member m);

	int pwdChangeMember(Member pwdchange);

	Profile profile(Profile memId);

	int profileInsert(int memId);

	int getListCount();

	ArrayList<FindClient> selectList(PageInfo pi);
//	ArrayList<FindClient> selectList();

	int insertPartInfo(PartInfo partInfo);

	FCprojectHistory selectProjectHistory(Integer cId);

	int getCPevalCount(Integer cId);

	ArrayList<CPeval> selectCPeval(Integer cId, PageInfo pi);

	FCeval getFCeval(Integer cId);

	ArrayList<EvalProjectList> getClientInfo(Integer cId);

	ArrayList<MatchingPartnersList> getMatchingPartners(HashMap id);

	ArrayList<FindClientDetail> selectClientDetail(Integer cId);

	int insertEval(HashMap id);
	
	Member selectMember(Member mEmail);

	int insertChatSet(MemChatSet mc);

	int membernick(String nick);

	int memberemail(String email);

	int getListCount(String memNick);

	ArrayList<FindClient> selectList(PageInfo pi, String memNick);

	int getListCount2(String introduction);

	ArrayList<FindClient> selectList2(PageInfo pi, String introduction);
	
	int insertIden(int memId);

	Map<String, String> isDeathOrSanctions(String memEmail);

	int updateDecAndDeath(String memEmail);

	int toDeath(String memEmail);

	ArrayList<FindClient> selectList(PageInfo pi, int status);

	EPid getEPid(HashMap id);

	int insertClientReport(HashMap report);

	int countUpReport(int reportCid);

	int reportCheck(HashMap report);

	Member selectMmber(String email, String pwd);

	
}