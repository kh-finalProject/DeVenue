package com.kh.DeVenue.memberAccount.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.memberAccount.model.dto.MemBasicInfo;
import com.kh.DeVenue.memberAccount.model.vo.Bank;
import com.kh.DeVenue.memberAccount.model.vo.DeclareDTO;
import com.kh.DeVenue.memberAccount.model.vo.IdenMember;
import com.kh.DeVenue.memberAccount.model.vo.Identify;
import com.kh.DeVenue.memberAccount.model.vo.MemType;
import com.kh.DeVenue.memberAccount.model.vo.Signature2;

public interface MemberAccountService {

	int updatePwd(Map map);

	int decideOut(String memId);

	Identify selectIdentityInform(int memId);

	int insertIden(Map map);

	int resetIden(String memId);

	MemBasicInfo selectMemBasicInfo(int mId);

	ArrayList<Bank> selectBankName();

	ArrayList<MemType> selectMemType();

	int updateBasicInfo(Map map);

	int updateProfileImg(Map map);

	int updatePhoneInfo(Map map);

	int updateInsertAccountInfo(Map map);

	ArrayList<Signature2> selectSignatureList(int memId);

	Integer searchProjectForSigDelete(String sigId);
	
	int deleteSignature(String id);

	int changeMainSignature(Map map);
	
	int changeCommonSignature(Map map);

	int insertSign(Map map);

	int insertStamp(Map map);

	String getPwd(int mId);

	ArrayList<IdenMember> selectIdenMember();

	int acceptIden(String ideId);

	int requestIden(String ideId);

	ArrayList<Member> selectDeclareMems();

	ArrayList<DeclareDTO> selectDeclares(String memId);

	int releaseSanctions(String memId);

	
}
