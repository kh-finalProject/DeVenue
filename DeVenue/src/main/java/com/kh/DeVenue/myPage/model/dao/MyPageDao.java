package com.kh.DeVenue.myPage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.vo.Career;
import com.kh.DeVenue.myPage.model.vo.Certificate;
import com.kh.DeVenue.myPage.model.vo.CmypageClientInfo;
import com.kh.DeVenue.myPage.model.vo.CmypageCountPartners;
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

@Repository("myPageDao")

public class MyPageDao {

	@SuppressWarnings("unused")
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int updateIntroduce(Profile profile) {
		
		return sqlSessionTemplate.update("memberMapper.profileUpdate", profile);
	}

	public Profile selectIntroduce(Profile memId) {
		
		return sqlSessionTemplate.selectOne("memberMapper.selectProfile", memId);
	}

	public int updatePartInfo(PartInfo partInfo) {
		
		return sqlSessionTemplate.update("myPageMapper.partInfoUpdate",partInfo);
	}

	public PartInfo selectPartInfo(PartInfo profileId) {
		
		return sqlSessionTemplate.selectOne("myPageMapper.selectPartInfo",profileId);
	}

	public int insertPartInfo(int profileId) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertPartInfo",profileId);
	}

	public int insertPortfolio(PortFolio pf) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertPortfolio",pf);
	}

	public int insertPartImg(PortImg pi) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertPortImg", pi);
	}

	public int insertPortTect(PortTec pt) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertPortTect", pt);
	}

	public int insertSkill(Skill s) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertSkill",s);
	}

	public int insertCareer(Career c) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertCareer", c);
	}

	public int insertCertificate(Certificate certi) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertCertificate",certi);
	}

	public int insertSCCareer(SCCareer sc) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertSCCareer",sc);
	}

	public ArrayList<PortFolio> selectListPortFolio(int profileId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.selectListPortFolio", profileId);
	}

	public ArrayList<Skill> selectListSkill(int profileId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.selectListSKill", profileId);
	}

	public ArrayList<Career> selectListCareer(int profileId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.selectListCareer", profileId);
	}

	public ArrayList<SCCareer> selectListSCCareer(int profileId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.selectListSCCareer", profileId);
	}

	public ArrayList<Certificate> selectListCertificate(int profileId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.selectListCertificate", profileId);
	}

	public int deleteSkill(int skillId) {
		
		return sqlSessionTemplate.delete("myPageMapper.deleteSkill", skillId);
	}

	public int deleteCareer(int cId) {
		
		return sqlSessionTemplate.delete("myPageMapper.deleteCareer",cId);
	}

	public int deleteAca(int scId) {
		
		return sqlSessionTemplate.delete("myPageMapper.deleteAca",scId);
	}

	public int deletCerti(int ccId) {
		
		return sqlSessionTemplate.delete("myPageMapper.deleteCerti",ccId);
	}

	public int selectPortId(String portName) {

		return sqlSessionTemplate.selectOne("myPageMapper.selectPortId", portName);
	}

	public int deletePortImg(int portId) {

		return sqlSessionTemplate.delete("myPageMapper.deletePortImg", portId);
	}

	public int deletePortTec(int portId) {

		return sqlSessionTemplate.delete("myPageMapper.deletePortTec", portId);
	}

	public int deletePortFolio(int portId) {
		
		return sqlSessionTemplate.delete("myPageMapper.deletePortFolio", portId);
	}

	public CmypageProjectHistory selectProjectHistory(Integer cId) {
		return sqlSessionTemplate.selectOne("myPageMapper.selectProjectHistory",cId);
	}

	public ArrayList<CmypageSuggest> selectSuggest(Integer cId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.selectSuggest",cId);
	}

	public ArrayList<CmypageProcess> selectProcess(Integer cId) {
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.selectProcess",cId);
	}

	public CmypageClientInfo selectClientInfo(Integer cId) {
		return sqlSessionTemplate.selectOne("myPageMapper.selectClientInfo",cId);
	}

	public ArrayList<PortFolio> portList(int profileId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.portList", profileId);
	}

	public ArrayList<PortTecView> ptList(int portId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.ptList", portId);
	}

	public PmypagePartnersInfo selectPartnersInfo(Integer pId) {
		return sqlSessionTemplate.selectOne("myPageMapper.selectPartnersInfo", pId);
	}

	public ArrayList<PartnersApplyCount> getApplyCount(Integer pId) {
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.getApplyCount", pId);
	}

	public ArrayList<PartnersContractCount> getContractCount(Integer pId) {
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.getContractCount", pId);
	}

	public ArrayList<PmypageSuggest> selectPartnersSuggest(Integer pId) {
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.selectPartnersSuggest", pId);
	}

	public ArrayList<PmypageProcess> selectPartnersProcess(Integer pId) {
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.selectPartnersProcess", pId);
	}
	
	public String getMyPageSidebarProImg(String mId) {
		return sqlSessionTemplate.selectOne("myPageMapper.getMyPageSidebarProImg",mId);
	}

	public int portNameCount(String title) {
		
		return sqlSessionTemplate.selectOne("myPageMapper.portNameCount",title);
	}

	public ArrayList<PortTecView> tNameList(int ptId) {
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.tNameList", ptId);
	}

	public ArrayList<CmypageCountPartners> getCountPartners(Integer cId) {
		return (ArrayList)sqlSessionTemplate.selectList("myPageMapper.getCountPartners", cId);
	}
	
	public int updateClientInfo(HashMap map) {
		return sqlSessionTemplate.update("myPageMapper.updateClientInfo", map);
	}

}
