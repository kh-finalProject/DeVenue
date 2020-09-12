package com.kh.DeVenue.findMember.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.findMember.model.dao.FindMemberDao;
import com.kh.DeVenue.findMember.model.vo.FindPartners;
import com.kh.DeVenue.findMember.model.vo.PEvalView;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.vo.PortFolio;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectProcess;

@Service("fmService")
public class FindMemberServiceImpl implements FindMemberService{

	@Autowired
	FindMemberDao fmDao;

//	@Override
//	public ArrayList<Member> memberAll() {
//		
//		return fmDao.memberAll();
//	}	
	
	@Override
	public ArrayList<FindPartners> findPartList() {

		return fmDao.findPartList();
	}

	@Override
	public FindPartners selectFm(int profileId) {
		
		return fmDao.selectFm(profileId);
	}

	@Override
	public ArrayList<PEvalView> partEvalList(int eTarget) {
		
		return fmDao.partEvalList(eTarget);
	}

	@Override
	public Profile selectIntroduce(int profileId) {
		
		return fmDao.selectIntroduce(profileId);
	}

	@Override
	public Member selectMember(String mId) {
		
		return fmDao.selectMember(mId);
	}

	@Override
	public Member selectMemNick(int memId) {
		
		return fmDao.selectMemNick(memId);
	}

	@Override
	public ArrayList<PortFolio> portList(int profileId) {
		
		return fmDao.portList(profileId);
	}

	@Override
	public Member clientInfo(int clientId) {
		
		return fmDao.clientInfo(clientId);
	}

	@Override
	public ArrayList<Project> projectList(int clientId) {
		
		return fmDao.projectList(clientId);
	}

	@Override
	public ArrayList<ProjectProcess> ppList(int proId) {

		return fmDao.ppList(proId);
	}









	
}
