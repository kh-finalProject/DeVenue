package com.kh.DeVenue.member.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	public Member loginMember(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.loginMember",m);
	}

	public int insertMember(Member m) {
		
		return sqlSessionTemplate.insert("memberMapper.insertMember",m);
	}


	public int updatePwdMember(Member pwdchange) {
		
		return sqlSessionTemplate.update("memberMapper.updatePwdMember", pwdchange);
	}

	public Profile selectProfile(Profile memId) {

		return sqlSessionTemplate.selectOne("memberMapper.selectProfile", memId);
	}
	
	public int insertProfile(int memId) {
		
		return sqlSessionTemplate.insert("memberMapper.insertProfile", memId);
	}

	

	public int getListCount() {
		return sqlSessionTemplate.selectOne("memberMapper.getListCount");
	}


	public ArrayList<FindClient> selectList(PageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectList", null, rowBounds);
	}
//	public ArrayList<FindClient> selectList() {
//		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectList");
//	}

	public int insertPartInfo(PartInfo partInfo) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertPartInfo",partInfo);
	}

	public ArrayList<FindClientDetail> selectClientDetail(Integer cId) {
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectClientDetail", cId);
	}

	public FCprojectHistory selectProjectHistory(Integer cId) {
		return sqlSessionTemplate.selectOne("memberMapper.selectProjectHistory",cId);
	}

	public int getCPevalCount(Integer cId) {
		return sqlSessionTemplate.selectOne("memberMapper.getCPevalCount", cId);
	}

	public ArrayList<CPeval> selectCPeval(Integer cId, PageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectCPeval", cId, rowBounds);
	}

	public FCeval getFCeval(Integer cId) {
		return sqlSessionTemplate.selectOne("memberMapper.getFCeval", cId);
	}

	public ArrayList<EvalProjectList> getClientInfo(Integer cId) {
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.getClientInfo", cId);
	}

	public ArrayList<MatchingPartnersList> getMatchingPartners(HashMap id) {
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.getMatchingPartners", id);
	}

	public int insertEval(HashMap id) {
		return sqlSessionTemplate.insert("memberMapper.insertEval", id);
	}

	public Member selectMemberId(Member mEmail) {
		
		return sqlSessionTemplate.selectOne("memberMapper.selectMemId", mEmail);
	}

	public int insertChatSet(MemChatSet mc) {
		
		return sqlSessionTemplate.insert("memberMapper.insertcharSet",mc);
	}

	public int membernick(String nick) {
		
		return sqlSessionTemplate.selectOne("memberMapper.membernick", nick);
	}

	public int memberemail(String email) {
		
		return sqlSessionTemplate.selectOne("memberMapper.memberemail", email);
	}

	public int getListCount(String memNick) {
		return sqlSessionTemplate.selectOne("memberMapper.countClientList", memNick);
	}

	public ArrayList<FindClient> selectList(PageInfo pi, String memNick) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.searchMemNickClientList", memNick, rowBounds);
	}

	public int getListCount2(String introduction) {
		return sqlSessionTemplate.selectOne("memberMapper.countClientList2", introduction);
	}
	
	public ArrayList<FindClient> selectList2(PageInfo pi, String introduction) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.searchIntroductionClientList", introduction, rowBounds);
	}
	
	public int insertIden(int memId) {
		
		return sqlSessionTemplate.insert("memberAccountMapper.signInsert", memId);

	}

	public Map<String, String> isDeathOrSanctions(String memEmail) {
		return sqlSessionTemplate.selectOne("memberMapper2.isDeathOrSanctions", memEmail);
	}

	public int updateDecAndDeath(String memEmail) {
		return sqlSessionTemplate.update("memberMapper2.updateDecAndDeath", memEmail);
	}

	public int toDeath(String memEmail) {
		return sqlSessionTemplate.update("memberMapper2.toDeath", memEmail);
	}
	
	public ArrayList<FindClient> selectList(PageInfo pi, int status) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectList2", status, rowBounds);
	}

	public EPid getEPid(HashMap id) {
		return sqlSessionTemplate.selectOne("memberMapper.getEPid", id);
	}

	public int insertClientReport(HashMap report) {
		return sqlSessionTemplate.insert("memberMapper.insertClientReport", report);
	}

	public int countUpReport(int reportCid) {
		return sqlSessionTemplate.update("memberMapper.countUpReport", reportCid);
	}

	public int reportCheck(HashMap report) {
		return sqlSessionTemplate.selectOne("memberMapper.reportCheck", report);
	}

	
}