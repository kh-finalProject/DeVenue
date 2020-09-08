package com.kh.DeVenue.memberAccount.model.service;

import java.util.Map;

import com.kh.DeVenue.memberAccount.model.vo.Identify;

public interface MemberAccountService {

	int updatePwd(Map map);

	int decideOut(String memId);

	Identify selectIdentityInform(int memId);

	int insertIden(Map map);

	int resetIden(String memId);
	
}
