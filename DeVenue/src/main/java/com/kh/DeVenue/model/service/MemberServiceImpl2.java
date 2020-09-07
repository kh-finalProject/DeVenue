package com.kh.DeVenue.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.model.dao.MemberDao2;
import com.kh.DeVenue.model.vo.Member;
import com.kh.DeVenue.util.model.vo.ChatUser;
import com.kh.DeVenue.util.model.vo.ChatUserInfo;

@Service("mnService")
public class MemberServiceImpl2 implements MemberService2{
	@Autowired
	private MemberDao2 mmDao;

	@Override
	public Member loginMember(Member m) {
		return mmDao.selectMember(m);
	}

	@Override
	public ArrayList<ChatUserInfo> allAdmin() {
		return mmDao.selectAllAdmin();
	}

	@Override
	public ArrayList<ChatUser> allAdmins() {
		return mmDao.selectAllAdmins();
	}
	
	
}
