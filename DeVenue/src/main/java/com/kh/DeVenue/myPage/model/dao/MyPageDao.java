package com.kh.DeVenue.myPage.model.dao;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.vo.Career;
import com.kh.DeVenue.myPage.model.vo.Certificate;
import com.kh.DeVenue.myPage.model.vo.PartInfo;
import com.kh.DeVenue.myPage.model.vo.PortFolio;
import com.kh.DeVenue.myPage.model.vo.PortImg;
import com.kh.DeVenue.myPage.model.vo.PortTec;
import com.kh.DeVenue.myPage.model.vo.SSCareer;
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

	public PortFolio selectPortfolio(PortFolio portId) {
		
		return sqlSessionTemplate.selectOne("myPageMapper.selectPortfolio",portId);
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

	public Skill selectSkill(Skill s) {
		
		return sqlSessionTemplate.selectOne("myPageMapper.selectSkill",s);
	}

	public int insertCareer(Career c) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertCareer", c);
	}

	public int insertCertificate(Certificate certi) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertCertificate",certi);
	}

	public int insertSSCareer(SSCareer sc) {
		
		return sqlSessionTemplate.insert("myPageMapper.insertSSCareer",sc);
	}
	
	

}
