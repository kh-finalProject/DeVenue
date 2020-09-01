package com.kh.DeVenue.member.model.service;

import java.util.ArrayList;

import com.kh.DeVenue.member.model.vo.FindClient;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.PageInfo;

public interface MemberService {

	Member loginUserMember(Member m);

	int insertMember(Member m);

	int pwdChangeMember(Member pwdchange);

	int profileInsert(int memId);

	int getListCount();

	ArrayList<FindClient> selectList(PageInfo pi);

	FindClient selectClientDetail(Integer cId);
}
