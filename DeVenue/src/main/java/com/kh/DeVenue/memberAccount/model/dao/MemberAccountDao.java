package com.kh.DeVenue.memberAccount.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.memberAccount.dto.MemBasicInfo;
import com.kh.DeVenue.memberAccount.model.vo.Bank;
import com.kh.DeVenue.memberAccount.model.vo.Identify;
import com.kh.DeVenue.memberAccount.model.vo.MemType;

@Repository("maDao")
public class MemberAccountDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int updatePwd(Map map) {
		return sqlSessionTemplate.update("memberAccountMapper.updatePwd",map);
	}

	public int decideOut(String memId) {
		return sqlSessionTemplate.update("memberAccountMapper.decideOut",memId);
	}

	public Identify selectIdentityInform(int memId) {
		return sqlSessionTemplate.selectOne("memberAccountMapper.selectIdentityInform", memId);
	}

	public int insertIden(Map map) {
		return sqlSessionTemplate.update("memberAccountMapper.insertIden", map);
	}

	public int resetIden(String memId) {
		return sqlSessionTemplate.update("memberAccountMapper.resetIden", memId);
	}

	public MemBasicInfo selectMemBasicInfo(int mId) {
		return sqlSessionTemplate.selectOne("memberAccountMapper.selectMemBasicInfo", mId);
	}

	public ArrayList<Bank> selectBankName() {
		return (ArrayList)sqlSessionTemplate.selectList("memberAccountMapper.selectBankName");
	}

	public ArrayList<MemType> selectMemType() {
		return  (ArrayList)sqlSessionTemplate.selectList("memberAccountMapper.selectMemType");
	}

}
