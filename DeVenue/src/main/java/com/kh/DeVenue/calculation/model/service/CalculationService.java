package com.kh.DeVenue.calculation.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.DeVenue.calculation.model.vo.Calculation;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Signature;
import com.kh.DeVenue.memberAccount.model.vo.Signature2;
import com.kh.DeVenue.project.model.vo.Project;

public interface CalculationService {

	ArrayList<Project> selectUnpaidProject();

	Member selectClient(Integer clientId);

	ArrayList<Member> selectPartners(Integer proId);

	ArrayList<Signature2> selectSignature(ArrayList<Member> partners);

	Signature2 selectProjectSignature(Integer proId);

	int uploadContractDoc(HashMap upload);

	ArrayList<Calculation> selectPaidProject();

	ArrayList<Calculation> selectCalculation();

	ArrayList<Member> selectMatched(Integer proId);

	int uploadCalculation(Calculation calculation);

}
