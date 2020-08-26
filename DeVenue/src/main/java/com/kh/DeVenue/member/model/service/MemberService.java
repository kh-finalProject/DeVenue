package com.kh.DeVenue.member.model.service;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Profile;

public interface MemberService {

	Member loginUserMember(Member m);

	int insertMember(Member m);

	int pwdChangeMember(Member pwdchange);

	int profileInsert(int memId);

	Profile profile(Profile memId);



	

}
