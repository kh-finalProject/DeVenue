package com.kh.DeVenue.calculation.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.calculation.model.dao.CalculationDao;
import com.kh.DeVenue.calculation.model.vo.Calculation;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.memberAccount.model.vo.Signature2;
import com.kh.DeVenue.project.model.vo.Project;

@Service("calService")
public class CalculationServiceImpl implements CalculationService {
	
	@Autowired
	CalculationDao calDao;

	@Override
	public ArrayList<Project> selectUnpaidProject() {
		
		return calDao.selectUnpaidProject();
	}

	@Override
	public Member selectClient(Integer clientId) {
		
		return calDao.selectClient(clientId);
	}

	@Override
	public ArrayList<Member> selectPartners(Integer proId) {
		
		return calDao.selectPartners(proId);
	}

	@Override
	public ArrayList<Signature2> selectSignature(ArrayList<Member> partners) {
		
		return calDao.selectSignatures(partners);
	}

	@Override
	public Signature2 selectProjectSignature(Integer proId) {
		
		return calDao.selectProjectSignature(proId);
	}

	

	@Override
	public int uploadContractDoc(HashMap upload) {
		
		return calDao.uploadContractDoc(upload);
	}

	@Override
	public ArrayList<Calculation> selectPaidProject() {
		
		return calDao.selectPaidProject();
	}

	@Override
	public ArrayList<Calculation> selectCalculation() {
		
		return calDao.selectCalculation();
	}

	@Override
	public ArrayList<Member> selectMatched(Integer proId) {
		
		return calDao.selectMatched(proId);
	}

	@Override
	public int uploadCalculation(Calculation calculation) {
		
		return calDao.uploadCalculation(calculation);
	}

}
