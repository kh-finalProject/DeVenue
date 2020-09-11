package com.kh.DeVenue.findMember.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.findMember.model.dao.FindMemberDao;
import com.kh.DeVenue.findMember.model.vo.FindPartners;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.myPage.model.vo.PortFolio;

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







	
}
