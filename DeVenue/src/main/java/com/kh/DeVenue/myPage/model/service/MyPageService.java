package com.kh.DeVenue.myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.DeVenue.member.model.vo.PageInfo;
import com.kh.DeVenue.member.model.vo.Profile;
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

public interface MyPageService {

	
	int profileUpdate(Profile profile);

	Profile selectProfile(Profile memId);

	int partInfoUpdate(PartInfo partInfo);

	PartInfo selectPartInfo(PartInfo profileId);

	int partInfoInsert(int profileId);

	int insertPortfolio(PortFolio pf);

	int insertPortImg(PortImg pi);

	int insertPortTect(PortTec pt);

	int insertSkill(Skill s);

	int insertCareer(Career c);

	int insertCertificate(Certificate certi);

	int insertSCCareer(SCCareer sc);

	ArrayList<PortFolio> selectPortInfo(int profileId);

	ArrayList<Skill> selectSkillInfo(int profileId);

	ArrayList<Career> selectCareerInfo(int profileId);

	ArrayList<SCCareer> selectSCCareerInfo(int profileId);

	ArrayList<Certificate> selectCertificateInfo(int profileId);

	int delSkill(int skillId);

	int delCareer(int cId);

	int delAca(int scId);

	int delCerti(int ccId);

	int selectPortId(String portName);

	int delPortImg(int portId);

	int delPortTec(int portId);

	int delPortFolio(int portId);

	CmypageProjectHistory selectProjectHistory(Integer cId);

	ArrayList<CmypageSuggest> selectSuggest(Integer cId);

	ArrayList<CmypageProcess> selectProcess(Integer cId);

	CmypageClientInfo selectClientInfo(Integer cId);

	PmypagePartnersInfo selectPartnersInfo(Integer pId);


	ArrayList<PartnersApplyCount> getApplyCount(Integer pId);




	ArrayList<PartnersContractCount> getContractCount(Integer pId);

	ArrayList<PmypageSuggest> selectPartnersSuggest(Integer pId);



	

	String getMyPageSidebarProImg(String mId);


	ArrayList<PmypageProcess> selectPartnersProcess(Integer pId);

	ArrayList<CmypageCountPartners> getCountPartners(Integer cId);



	int updateClientInfo(HashMap map);

	ArrayList<PortFolio> portList(int profileId);

	ArrayList<PortTecView> ptList(int portId);

	int portNameCount(String title);

	ArrayList<PortTecView> tNameList(int ptId);

	int portCount(int profileId);

	Profile selectIntroduce(int profileId);

	int getPaymentListCount(Integer cId);

	ArrayList<CmypagePayment> getPaymentList(Integer cId, PageInfo pi);

	int updatePst(int id);

	int updateApply(int id);

	int insertApplyMatch(int id);

	int insertProcess(int id);

	int insertCareerIng(Career c);

	ArrayList<PortImg> piList(int portId);


	

}
