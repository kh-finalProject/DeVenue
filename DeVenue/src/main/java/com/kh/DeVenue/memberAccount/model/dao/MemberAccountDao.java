package com.kh.DeVenue.memberAccount.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.memberAccount.model.dto.MemBasicInfo;
import com.kh.DeVenue.memberAccount.model.vo.Bank;
import com.kh.DeVenue.memberAccount.model.vo.DeclareDTO;
import com.kh.DeVenue.memberAccount.model.vo.IdenMember;
import com.kh.DeVenue.memberAccount.model.vo.Identify;
import com.kh.DeVenue.memberAccount.model.vo.MemType;
import com.kh.DeVenue.memberAccount.model.vo.Signature2;

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

	public int updateBasicInfo(Map map) {
		return sqlSessionTemplate.update("memberAccountMapper.updateBasicInfo", map);
	}

	public int updateProfileImg(Map map) {
		return sqlSessionTemplate.update("memberAccountMapper.updateProfileImg", map);
	}

	public int updatePhoneInfo(Map map) {
		return sqlSessionTemplate.update("memberAccountMapper.updatePhoneInfo", map);
	}

	public int updateInsertAccountInfo(Map map) {
		return sqlSessionTemplate.update("memberAccountMapper.updateInsertAccountInfo", map);
	}

	public ArrayList<Signature2> selectSignatureList(int memId) {
		return (ArrayList)sqlSessionTemplate.selectList("memberAccountMapper.selectSignatureList", memId);
	}

	
	public Integer searchProjectForSigDelete(String sigId) {
		return sqlSessionTemplate.selectOne("memberAccountMapper.searchProjectForSigDelete", sigId);
	}
	
	public int deleteSignature(String id) {
		return sqlSessionTemplate.delete("memberAccountMapper.deleteSignature", id);
	}

	public int changeMainSignature(Map map) {
		return sqlSessionTemplate.update("memberAccountMapper.changeMainSignature", map);
	}
	
	public int changeCommonSignature(Map map) {
		return sqlSessionTemplate.update("memberAccountMapper.changeCommonSignature", map);
	}

	public int insertSign(Map map) {
		return sqlSessionTemplate.insert("memberAccountMapper.insertSign", map);
	}

	public int insertStamp(Map map) {
		return sqlSessionTemplate.insert("memberAccountMapper.insertStamp", map);
	}

	public String getPwd(int mId) {
		return sqlSessionTemplate.selectOne("memberAccountMapper.getPwd", mId);
	}

	public ArrayList<IdenMember> selectIdenMember() {
		return (ArrayList)sqlSessionTemplate.selectList("memberAccountMapper.selectIdenMember");
	}

	public int acceptIden(String ideId) {
		return sqlSessionTemplate.update("memberAccountMapper.acceptIden", ideId);
	}

	public int requestIden(String ideId) {
		return sqlSessionTemplate.update("memberAccountMapper.requestIden", ideId);
	}

	public ArrayList<Member> selectDeclareMems() {
		return (ArrayList)sqlSessionTemplate.selectList("memberAccountMapper.selectDeclareMems");
	}

	public ArrayList<DeclareDTO> selectDeclares(String memId) {
		return (ArrayList)sqlSessionTemplate.selectList("memberAccountMapper.selectDeclares", memId);
	}

	public int releaseSanctions(String memId) {
		return sqlSessionTemplate.update("memberAccountMapper.releaseSanctions", memId);
	}
}
