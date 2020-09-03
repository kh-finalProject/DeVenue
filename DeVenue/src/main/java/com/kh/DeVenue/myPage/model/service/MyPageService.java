package com.kh.DeVenue.myPage.model.service;

import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.vo.Career;
import com.kh.DeVenue.myPage.model.vo.Certificate;
import com.kh.DeVenue.myPage.model.vo.PartInfo;
import com.kh.DeVenue.myPage.model.vo.PortFolio;
import com.kh.DeVenue.myPage.model.vo.PortImg;
import com.kh.DeVenue.myPage.model.vo.PortTec;
import com.kh.DeVenue.myPage.model.vo.SSCareer;
import com.kh.DeVenue.myPage.model.vo.Skill;

public interface MyPageService {

	
	int profileUpdate(Profile profile);

	Profile selectProfile(Profile memId);

	int partInfoUpdate(PartInfo partInfo);

	PartInfo selectPartInfo(PartInfo profileId);

	int partInfoInsert(int profileId);

	int insertPortfolio(PortFolio pf);

	PortFolio selectPortfolio(PortFolio portId);

	int insertPortImg(PortImg pi);

	int insertPortTect(PortTec pt);

	int insertSkill(Skill s);

	Skill selectSkill(Skill s);

	int insertCareer(Career c);

	int insertCertificate(Certificate certi);

	int insertSSCareer(SSCareer sc);




	

	

}
