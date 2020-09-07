package com.kh.DeVenue.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.model.vo.Member;
import com.kh.DeVenue.util.model.vo.ChatUser;
import com.kh.DeVenue.util.model.vo.ChatUserInfo;

@Repository("mmDao")
public class MemberDao2 {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public Member selectMember(Member m) {
		Member loginUser =sqlSessionTemplate.selectOne("memberMapper2.selectOne", m);
		System.out.println(loginUser);
		return loginUser;
	}

	public ArrayList<ChatUserInfo> selectAllAdmin() {
		ArrayList<ChatUserInfo> admins = new ArrayList<>();
		admins = (ArrayList)sqlSessionTemplate.selectList("memberMapper2.selectAllAdmin");
		return admins;
	}

	public ArrayList<ChatUser> selectAllAdmins() {
		ArrayList<ChatUser> admins = new ArrayList<>();
		admins = (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectAllAdmins");
		return admins;
	}
	
}
