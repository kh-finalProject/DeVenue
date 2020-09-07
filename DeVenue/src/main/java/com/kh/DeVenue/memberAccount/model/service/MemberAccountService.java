package com.kh.DeVenue.memberAccount.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.DeVenue.memberAccount.dto.MemBasicInfo;
import com.kh.DeVenue.memberAccount.model.vo.Bank;
import com.kh.DeVenue.memberAccount.model.vo.Identify;
import com.kh.DeVenue.memberAccount.model.vo.MemType;

public interface MemberAccountService {

	int updatePwd(Map map);

	int decideOut(String memId);

	Identify selectIdentityInform(int memId);

	int insertIden(Map map);

	int resetIden(String memId);

	MemBasicInfo selectMemBasicInfo(int mId);

	ArrayList<Bank> selectBankName();

	ArrayList<MemType> selectMemType();
	
}
