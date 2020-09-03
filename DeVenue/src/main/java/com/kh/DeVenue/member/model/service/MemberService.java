package com.kh.DeVenue.member.model.service;

import java.util.ArrayList;

import com.kh.DeVenue.member.model.vo.FindClient;
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

	int insertPartInfo(PartInfo partInfo);




	



	

}
