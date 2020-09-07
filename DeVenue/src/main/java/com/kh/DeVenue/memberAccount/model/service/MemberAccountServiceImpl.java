package com.kh.DeVenue.memberAccount.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.memberAccount.model.dao.MemberAccountDao;
import com.kh.DeVenue.memberAccount.model.vo.Identify;

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

}
