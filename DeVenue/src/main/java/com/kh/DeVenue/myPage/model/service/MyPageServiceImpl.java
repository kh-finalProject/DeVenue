package com.kh.DeVenue.myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.vo.PageInfo;
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.dao.MyPageDao;
import com.kh.DeVenue.myPage.model.vo.Career;
import com.kh.DeVenue.myPage.model.vo.Certificate;
import com.kh.DeVenue.myPage.model.vo.CmypageClientInfo;
import com.kh.DeVenue.myPage.model.vo.CmypageCountPartners;
import com.kh.DeVenue.myPage.model.vo.CmypagePayment;
import com.kh.DeVenue.myPage.model.vo.CmypageProcess;
import com.kh.DeVenue.myPage.model.vo.CmypageProjectHistory;
import com.kh.DeVenue.myPage.model.vo.CmypageSuggest;
import com.kh.DeVenue.myPage.model.vo.PartInfo;
import com.kh.DeVenue.myPage.model.vo.PartnersApplyCount;
import com.kh.DeVenue.myPage.model.vo.PartnersContractCount;
import com.kh.DeVenue.myPage.model.vo.PmypagePartnersInfo;
import com.kh.DeVenue.myPage.model.vo.PmypageProcess;
import com.kh.DeVenue.myPage.model.vo.PmypageSuggest;
import com.kh.DeVenue.myPage.model.vo.PortFolio;
import com.kh.DeVenue.myPage.model.vo.PortImg;
import com.kh.DeVenue.myPage.model.vo.PortTec;
import com.kh.DeVenue.myPage.model.vo.PortTecView;
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

	@Override
	public CmypageProjectHistory selectProjectHistory(Integer cId) {
		return myPageDao.selectProjectHistory(cId);
	}

	@Override
	public ArrayList<CmypageSuggest> selectSuggest(Integer cId) {
		return myPageDao.selectSuggest(cId);
	}

	@Override
	public ArrayList<CmypageProcess> selectProcess(Integer cId) {
		return myPageDao.selectProcess(cId);
	}

	@Override
	public CmypageClientInfo selectClientInfo(Integer cId) {
		return myPageDao.selectClientInfo(cId);
	}

	@Override
	public ArrayList<PortFolio> portList(int profileId) {
		
		return myPageDao.portList(profileId);
	}

	@Override

	public ArrayList<PortTecView> ptList(int portId) {
		 
		return myPageDao.ptList(portId);
	}

	@Override
	public PmypagePartnersInfo selectPartnersInfo(Integer pId) {
		return myPageDao.selectPartnersInfo(pId);

	}



	@Override
	public ArrayList<PartnersApplyCount> getApplyCount(Integer pId) {
		return myPageDao.getApplyCount(pId);
	}

	@Override
	public ArrayList<PartnersContractCount> getContractCount(Integer pId) {
		return myPageDao.getContractCount(pId);
	}

	@Override
	public ArrayList<PmypageSuggest> selectPartnersSuggest(Integer pId) {
		return myPageDao.selectPartnersSuggest(pId);
	}

	@Override
	public ArrayList<PmypageProcess> selectPartnersProcess(Integer pId) {
		return myPageDao.selectPartnersProcess(pId);
	}
	
	@Override
	public String getMyPageSidebarProImg(String mId) {
		return myPageDao.getMyPageSidebarProImg(mId);

	}

	@Override
	public int portNameCount(String title) {
		
		return myPageDao.portNameCount(title);
	}

	@Override
	public ArrayList<PortTecView> tNameList(int ptId) {

		return myPageDao.tNameList(ptId);
	}

	public ArrayList<CmypageCountPartners> getCountPartners(Integer cId) {
		return myPageDao.getCountPartners(cId);
	}

	@Override
	public int portCount(int profileId) {
		
		return myPageDao.portCount(profileId);
	}

	@Override
	public Profile selectIntroduce(int profileId) {
		
		return myPageDao.fpselectIntroduce(profileId);
	}

	@Override
	public int updateClientInfo(HashMap map) {
		return myPageDao.updateClientInfo(map);
	}

	@Override
	public int getPaymentListCount(Integer cId) {
		return myPageDao.getPaymentListCount(cId);
	}

	@Override
	public ArrayList<CmypagePayment> getPaymentList(Integer cId, PageInfo pi) {
		return myPageDao.getPaymentList(cId, pi);
	}

	@Override
	public int updatePst(int id) {
		return myPageDao.updatePst(id);
	}

	@Override
	public int updateApply(int id) {
		return myPageDao.updateApply(id);
	}

	@Override
	public int insertApplyMatch(int id) {
		return myPageDao.insertApplyMatch(id);
	}

	@Override
	public int insertProcess(int id) {
		return myPageDao.insertProcess(id);
	}





	


}
