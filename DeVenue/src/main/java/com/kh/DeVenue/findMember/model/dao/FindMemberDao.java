package com.kh.DeVenue.findMember.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.findMember.model.vo.FindPartners;
import com.kh.DeVenue.findMember.model.vo.PEvalView;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.vo.PortFolio;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectProcess;

@Repository("fmDao")
public class FindMemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
//
//	public ArrayList<Member> memberAll() {
//		
//		return (ArrayList)sqlSessionTemplate.selectList("memberMapper.memberAll");
//	}

	public ArrayList<FindPartners> findPartList() {
		
		return (ArrayList)sqlSessionTemplate.selectList("findPartMapper.findPartList");
	}

	public FindPartners selectFm(int profileId) {
		
		return sqlSessionTemplate.selectOne("findPartMapper.selectFm",profileId);
	}

	public ArrayList<PEvalView> partEvalList(int eTarget) {

		return (ArrayList)sqlSessionTemplate.selectList("findPartMapper.partEvalList",eTarget);
	}
	
	public Profile selectIntroduce(int profileId) {

		return sqlSessionTemplate.selectOne("memberMapper.selectIntroduce",profileId);
	}

	public Member selectMember(String mId) {
		
		return sqlSessionTemplate.selectOne("memberMapper.selectMember",mId);
	}

	public Member selectMemNick(int memId) {
		
		return sqlSessionTemplate.selectOne("memberMapper.selectMemNick", memId);
	}

	public ArrayList<PortFolio> portList(int profileId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.selectListPortFolio",profileId);
	}

	public Member clientInfo(int clientId) {
		
		return sqlSessionTemplate.selectOne("memberMapper.selectMemNick",clientId);
	}

	public ArrayList<Project> projectList(int clientId) {

		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.projectList", clientId);
	}

	public ArrayList<ProjectProcess> ppList(int proId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.ppList", proId);
	}



}
