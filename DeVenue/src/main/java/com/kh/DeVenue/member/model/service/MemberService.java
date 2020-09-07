<<<<<<< HEAD
package com.kh.DeVenue.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.DeVenue.member.model.vo.CPeval;
import com.kh.DeVenue.member.model.vo.EvalProjectList;
import com.kh.DeVenue.member.model.vo.FCeval;
import com.kh.DeVenue.member.model.vo.FCprojectHistory;
import com.kh.DeVenue.member.model.vo.FindClient;
import com.kh.DeVenue.member.model.vo.FindClientDetail;
import com.kh.DeVenue.member.model.vo.MatchingPartnersList;
import com.kh.DeVenue.util.model.vo.MemChatSet;
=======
package com.kh.DeVenue.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.DeVenue.member.model.vo.CPeval;
import com.kh.DeVenue.member.model.vo.EvalProjectList;
import com.kh.DeVenue.member.model.vo.FCeval;
import com.kh.DeVenue.member.model.vo.FCprojectHistory;
import com.kh.DeVenue.member.model.vo.FindClient;
import com.kh.DeVenue.member.model.vo.FindClientDetail;
import com.kh.DeVenue.member.model.vo.MatchingPartnersList;
import com.kh.DeVenue.util.model.vo.MemChatSet;
>>>>>>> refs/remotes/origin/master
import com.kh.DeVenue.member.model.vo.Member;
<<<<<<< HEAD
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.vo.PartInfo;
=======
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.vo.PartInfo;
>>>>>>> refs/remotes/origin/master
import com.kh.DeVenue.member.model.vo.PageInfo;

<<<<<<< HEAD
public interface MemberService {
=======
	int insertMember(Member m);

	int pwdChangeMember(Member pwdchange);

	Profile profile(Profile memId);

	int profileInsert(int memId);
>>>>>>> refs/remotes/origin/master

<<<<<<< HEAD
	Member loginUserMember(Member m);

	int insertMember(Member m);

	int pwdChangeMember(Member pwdchange);

	Profile profile(Profile memId);

	int profileInsert(int memId);

	int getListCount();

//	ArrayList<FindClient> selectList(PageInfo pi);
	ArrayList<FindClient> selectList();

	int insertPartInfo(PartInfo partInfo);

	FCprojectHistory selectProjectHistory(Integer cId);

	int getCPevalCount(Integer cId);

	ArrayList<CPeval> selectCPeval(Integer cId);

	FCeval getFCeval(Integer cId);

	ArrayList<EvalProjectList> getClientInfo(Integer cId);

	ArrayList<MatchingPartnersList> getMatchingPartners(HashMap id);

	FindClientDetail selectClientDetail(Integer cId);

	Member selectMember(Member mEmail);

	int insertChatSet(MemChatSet mc);

	int membernick(String nick);

	int memberemail(String email);

	
}
=======
	int getListCount();

//	ArrayList<FindClient> selectList(PageInfo pi);
	ArrayList<FindClient> selectList();

	int insertPartInfo(PartInfo partInfo);

	FCprojectHistory selectProjectHistory(Integer cId);

	int getCPevalCount(Integer cId);

	ArrayList<CPeval> selectCPeval(Integer cId);

	FCeval getFCeval(Integer cId);

	ArrayList<EvalProjectList> getClientInfo(Integer cId);

	ArrayList<MatchingPartnersList> getMatchingPartners(HashMap id);

	FindClientDetail selectClientDetail(Integer cId);

	Member selectMember(Member mEmail);

	int insertChatSet(MemChatSet mc);

	int membernick(String nick);

	int memberemail(String email);

	
}
>>>>>>> refs/remotes/origin/master
