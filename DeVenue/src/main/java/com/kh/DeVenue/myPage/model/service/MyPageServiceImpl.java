package com.kh.DeVenue.myPage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.dao.MyPageDao;
import com.kh.DeVenue.myPage.model.vo.Career;
import com.kh.DeVenue.myPage.model.vo.Certificate;
import com.kh.DeVenue.myPage.model.vo.PartInfo;
import com.kh.DeVenue.myPage.model.vo.PortFolio;
import com.kh.DeVenue.myPage.model.vo.PortImg;
import com.kh.DeVenue.myPage.model.vo.PortTec;
import com.kh.DeVenue.myPage.model.vo.SCCareer;
import com.kh.DeVenue.myPage.model.vo.Skill;

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

	@Override
	public int partInfoUpdate(PartInfo partInfo) {
		
		return myPageDao.updatePartInfo(partInfo);
	}

	@Override
	public PartInfo selectPartInfo(PartInfo profileId) {
		
		return myPageDao.selectPartInfo(profileId);
	}

	@Override
	public int partInfoInsert(int profileId) {
		
		return myPageDao.insertPartInfo(profileId);
	}

	@Override
	public int insertPortfolio(PortFolio pf) {
		
		return myPageDao.insertPortfolio(pf);
	}

	@Override
	public int insertPortImg(PortImg pi) {
		
		return myPageDao.insertPartImg(pi);
	}

	@Override
	public int insertPortTect(PortTec pt) {
		
		return myPageDao.insertPortTect(pt);
	}

	@Override
	public int insertSkill(Skill s) {
		
		return myPageDao.insertSkill(s);
	}

	@Override
	public int insertCareer(Career c) {
		
		return myPageDao.insertCareer(c);
	}

	@Override
	public int insertCertificate(Certificate certi) {
		
		return myPageDao.insertCertificate(certi);
	}

	@Override
	public int insertSCCareer(SCCareer sc) {
		
		return myPageDao.insertSCCareer(sc);
	}

	@Override
	public ArrayList<PortFolio> selectPortInfo(int profileId) {
		
		return myPageDao.selectListPortFolio(profileId);
	}

	@Override
	public ArrayList<Skill> selectSkillInfo(int profileId) {
		
		return myPageDao.selectListSkill(profileId);
	}

	@Override
	public ArrayList<Career> selectCareerInfo(int profileId) {
		
		return myPageDao.selectListCareer(profileId);
	}

	@Override
	public ArrayList<SCCareer> selectSCCareerInfo(int profileId) {
		
		return myPageDao.selectListSCCareer(profileId);
	}

	@Override
	public ArrayList<Certificate> selectCertificateInfo(int profileId) {
		
		return myPageDao.selectListCertificate(profileId);
	}

	@Override
	public int delSkill(int skillId) {
		
		return myPageDao.deleteSkill(skillId);
	}

	@Override
	public int delCareer(int cId) {
		
		return myPageDao.deleteCareer(cId);
	}

	@Override
	public int delAca(int scId) {
		
		return myPageDao.deleteAca(scId);
	}

	@Override
	public int delCerti(int ccId) {
		
		return myPageDao.deletCerti(ccId);
	}

	@Override
	public int selectPortId(String portName) {
		
		return myPageDao.selectPortId(portName);
	}

	@Override
	public int delPortImg(int portId) {
		
		return myPageDao.deletePortImg(portId);
	}

	@Override
	public int delPortTec(int portId) {

		return myPageDao.deletePortTec(portId);
	}

	@Override
	public int delPortFolio(int portId) {
		
		return myPageDao.deletePortFolio(portId);
	}







	


}
