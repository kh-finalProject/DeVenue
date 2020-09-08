package com.kh.DeVenue.member.model.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.CPeval;
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


//	public ArrayList<FindClient> selectList(PageInfo pi) {
//		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
//		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
//		
//		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectList", null, rowBounds);
//	}
	public ArrayList<FindClient> selectList() {
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectList");
	}


	public int insertPartInfo(PartInfo partInfo) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertPartInfo",partInfo);
	}

	public FindClientDetail selectClientDetail(Integer cId) {
		return sqlSessionTemplate.selectOne("memberMapper.selectClientDetail", cId);
	}

	public FCprojectHistory selectProjectHistory(Integer cId) {
		return sqlSessionTemplate.selectOne("memberMapper.selectProjectHistory",cId);
	}

	public int getCPevalCount(Integer cId) {
		return sqlSessionTemplate.selectOne("memberMapper.getCPevalCount", cId);
	}

	public ArrayList<CPeval> selectCPeval(Integer cId) {
		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectCPeval", cId);
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


	

}
