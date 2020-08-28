package com.kh.DeVenue.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.dao.MyPageDao;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{

	@Autowired 
	MyPageDao myPageDao;
	
	@Override
	public int profileUpdate(Profile profile) {
		
		return myPageDao.updateIntroduce(profile);
	}

	@Override
	public Profile selectProfile(Profile memId) {
		
		return myPageDao.selectIntroduce(memId);
	}




	


}
