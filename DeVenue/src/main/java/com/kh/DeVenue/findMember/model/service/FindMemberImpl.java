package com.kh.DeVenue.findMember.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.findMember.model.dao.FindMemberDao;
import com.kh.DeVenue.member.model.vo.Member;

@Service("fmService")
public class FindMemberImpl implements FindMemberService{

	@Autowired
	FindMemberDao fmDao;

	@Override
	public ArrayList<Member> memberAll() {
		
		return fmDao.memberAll();
	}
	
}
