package com.kh.DeVenue.findMember.model.service;

import java.util.ArrayList;

import com.kh.DeVenue.findMember.model.vo.FindPartners;
import com.kh.DeVenue.findMember.model.vo.PEvalView;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.vo.PortFolio;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectProcess;

public interface FindMemberService {

//	ArrayList<Member> memberAll();

	ArrayList<FindPartners> findPartList();

	FindPartners selectFm(int profileId);

	ArrayList<PEvalView> partEvalList(int eTarget);

	Profile selectIntroduce(int profileId);

	Member selectMember(String mId);

	Member selectMemNick(int memId);

	ArrayList<PortFolio> portList(int profileId);

	Member clientInfo(int clientId);

	ArrayList<Project> projectList(int clientId);

	ArrayList<ProjectProcess> ppList(int proId);


	

}
