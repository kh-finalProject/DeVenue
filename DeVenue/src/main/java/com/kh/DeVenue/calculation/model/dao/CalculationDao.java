package com.kh.DeVenue.calculation.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Signature;
import com.kh.DeVenue.memberAccount.model.vo.Signature2;
import com.kh.DeVenue.project.model.vo.Project;

@Repository("calDao")
public class CalculationDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Project> selectUnpaidProject() {
		
		return (ArrayList)sqlSessionTemplate.selectList("calculationMapper.selectUnpaidProject");
	}

	public Member selectClient(Integer clientId) {
		
		return sqlSessionTemplate.selectOne("calculationMapper.selectClient", clientId);
	}

	public ArrayList<Member> selectPartners(Integer proId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("calculationMapper.selectPartners", proId);
	}

	public ArrayList<Signature2> selectSignatures(ArrayList<Member> partners) {
		
		return (ArrayList)sqlSessionTemplate.selectList("calculationMapper.selectSignature", partners);
	}

	public Signature2 selectProjectSignature(Integer proId) {
		
		return sqlSessionTemplate.selectOne("calculationMapper.selectProjectSignature", proId);
	}

	public int uploadContractDoc(HashMap upload) {
		
		return sqlSessionTemplate.update("calculationMapper.uploadContractDoc",upload);
	}

}
