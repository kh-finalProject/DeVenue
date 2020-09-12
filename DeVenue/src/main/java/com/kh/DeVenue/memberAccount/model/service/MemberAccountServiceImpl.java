package com.kh.DeVenue.memberAccount.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.memberAccount.model.dao.MemberAccountDao;
import com.kh.DeVenue.memberAccount.model.dto.MemBasicInfo;
import com.kh.DeVenue.memberAccount.model.vo.Bank;
import com.kh.DeVenue.memberAccount.model.vo.DeclareDTO;
import com.kh.DeVenue.memberAccount.model.vo.IdenMember;
import com.kh.DeVenue.memberAccount.model.vo.Identify;
import com.kh.DeVenue.memberAccount.model.vo.MemType;
import com.kh.DeVenue.memberAccount.model.vo.Signature2;

@Service("maService")
public class MemberAccountServiceImpl implements MemberAccountService{

	@Autowired
	MemberAccountDao maDao;
	
	@Override
	public int updatePwd(Map map) {
		return maDao.updatePwd(map);
	}

	@Override
	public int decideOut(String memId) {
		return maDao.decideOut(memId);
	}

	@Override
	public Identify selectIdentityInform(int memId) {
		return maDao.selectIdentityInform(memId);
	}

	@Override
	public int insertIden(Map map) {
		return maDao.insertIden(map);
	}

	@Override
	public int resetIden(String memId) {
		return maDao.resetIden(memId);
	}

	@Override
	public MemBasicInfo selectMemBasicInfo(int mId) {
		return maDao.selectMemBasicInfo(mId);
	}

	@Override
	public ArrayList<Bank> selectBankName() {
		return maDao.selectBankName();
	}

	@Override
	public ArrayList<MemType> selectMemType() {
		return maDao.selectMemType();
	}

	@Override
	public int updateBasicInfo(Map map) {
		return maDao.updateBasicInfo(map);
	}

	@Override
	public int updateProfileImg(Map map) {
		return maDao.updateProfileImg(map);
	}

	@Override
	public int updatePhoneInfo(Map map) {
		return maDao.updatePhoneInfo(map);
	}

	@Override
	public int updateInsertAccountInfo(Map map) {
		return maDao.updateInsertAccountInfo(map);
	}

	@Override
	public ArrayList<Signature2> selectSignatureList(int memId) {
		return maDao.selectSignatureList(memId);
	}

	@Override
	public Integer searchProjectForSigDelete(String sigId) {
		return maDao.searchProjectForSigDelete(sigId);
	}
	
	@Override
	public int deleteSignature(String id) {
		return maDao.deleteSignature(id);
	}

	@Override
	public int changeMainSignature(Map map) {
		return maDao.changeMainSignature(map);
	}
	
	@Override
	public int changeCommonSignature(Map map) {
		return maDao.changeCommonSignature(map);
	}

	@Override
	public int insertSign(Map map) {
		return maDao.insertSign(map);
	}

	@Override
	public int insertStamp(Map map) {
		return maDao.insertStamp(map);
	}

	@Override
	public String getPwd(int mId) {
		return maDao.getPwd(mId);
	}

	@Override
	public ArrayList<IdenMember> selectIdenMember() {
		return  maDao.selectIdenMember();
	}

	@Override
	public int acceptIden(String ideId) {
		return maDao.acceptIden(ideId);
	}

	@Override
	public int requestIden(String ideId) {
		return maDao.requestIden(ideId);
	}

	@Override
	public ArrayList<Member> selectDeclareMems() {
		return maDao.selectDeclareMems();
	}

	@Override
	public ArrayList<DeclareDTO> selectDeclares(String memId) {
		return maDao.selectDeclares(memId);
	}

	@Override
	public int releaseSanctions(String memId) {
		return  maDao.releaseSanctions(memId);
	}


}
