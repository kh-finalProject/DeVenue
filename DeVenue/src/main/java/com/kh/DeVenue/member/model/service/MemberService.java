package com.kh.DeVenue.member.model.service;

import com.kh.DeVenue.member.model.vo.Member;

public interface MemberService {

	Member loginUserMember(Member m);

	int insertMember(Member m);

	int pwdChangeMember(Member pwdchange);


}
