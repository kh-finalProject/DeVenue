package com.kh.DeVenue.findMember.model.service;

import java.util.ArrayList;

import com.kh.DeVenue.findMember.model.vo.FindPartners;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.myPage.model.vo.PortFolio;

public interface FindMemberService {

//	ArrayList<Member> memberAll();

	ArrayList<FindPartners> findPartList();

	FindPartners selectFm(int profileId);




	

}
