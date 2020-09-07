package com.kh.DeVenue.model.service;

import java.util.ArrayList;

import com.kh.DeVenue.model.vo.Member;
import com.kh.DeVenue.util.model.vo.ChatRoom;
import com.kh.DeVenue.util.model.vo.ChatUser;
import com.kh.DeVenue.util.model.vo.ChatUserInfo;

public interface MemberService2 {

	Member loginMember(Member m);
	// 임시 사용자객체 사용해서 관리자 불러온거
	ArrayList<ChatUserInfo> allAdmin();
	// 정식 사용자객체 사용해서 관리자 불러온거
	ArrayList<ChatUser> allAdmins();

}
