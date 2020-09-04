package com.kh.DeVenue.util.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.DeVenue.model.vo.Member;
import com.kh.DeVenue.util.model.vo.Ask;
import com.kh.DeVenue.util.model.vo.ChatList;
import com.kh.DeVenue.util.model.vo.ChatRel;
import com.kh.DeVenue.util.model.vo.ChatRoom;
import com.kh.DeVenue.util.model.vo.ChatSet;
import com.kh.DeVenue.util.model.vo.ChatUser;
import com.kh.DeVenue.util.model.vo.ChatUserInfo;
import com.kh.DeVenue.util.model.vo.EachChatInfo;
import com.kh.DeVenue.util.model.vo.MemChatSet;
import com.kh.DeVenue.util.model.vo.Message;
import com.kh.DeVenue.util.model.vo.ProInfo;

@Repository("cDao")
public class ChatDao {
	
	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	
	@Autowired
	DataSourceTransactionManager transactionManager;
	
	
	public ChatUser selectMe(int userId) {
		return sqlsessionTemplate.selectOne("chatMapper.selectMe", userId);
	}

	public int getRoomId(int mId) {
		
		Integer roomId = sqlsessionTemplate.selectOne("chatMapper.getRoomId", mId);
		if(roomId == null) {
			return 0;
		}
		return roomId;
	}

	public void deleteMainAdminChatMessages(int roomId) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("chat_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result1 = sqlsessionTemplate.delete("chatMapper.deleteMainAdminChatMessages", roomId);
		
		if(result1 < 1) {
			System.out.println("메시지 테이블 삭제가 안됨");
		}
		
		transactionManager.commit(status);
	}
	
	public void alterChatConstraintDisable() {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("chat_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		String disableCons = "ALTER TABLE CHAT DISABLE CONSTRAINT FK_CHATROOM_TO_CHAT_1";
		int result2 = sqlsessionTemplate.update("chatMapper.chatFkConstraintDisable", disableCons);
		
		if(result2 < 1) {
			System.out.println("제약조건 비활성화가 안됨");
		}
		transactionManager.commit(status);
	}
	
	public void deleteMainAdminChatRooms(int roomId) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("chat_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		int result3 = sqlsessionTemplate.delete("chatMapper.deleteMainAdminChatRooms", roomId);

		if(result3 < 1) {
			System.out.println("채팅방 테이블 없애기가 안됨");
		}
		transactionManager.commit(status);
	}
	
	public void alterChatConstraintEnable() {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("chat_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		int result4 = sqlsessionTemplate.update("chatMapper.chatFkConstraintEnable");
		
		if(result4 < 1) {
			System.out.println("제약조건 활성화가 안됨");
		}
		transactionManager.commit(status);
	}
	
	public void deleteMainAdminChatRels(int roomId) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("chat_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		int result5 = sqlsessionTemplate.delete("chatMapper.deleteMainAdminChatRels", roomId);
		
		if(result5 < 1) {
			System.out.println("채팅관계 없애기가 안됨");
		}
		transactionManager.commit(status);
	}

	public int insertNewChatRoom(Map insertChatRRInfrom) {
		int result1 = sqlsessionTemplate.insert("chatMapper.insertNewChatRoom", insertChatRRInfrom);
		if(result1 < 1) {
			System.out.println("새 chatRoom 생성 에러");
		}
		int roomId = sqlsessionTemplate.selectOne("chatMapper.selectChatRoomNo", insertChatRRInfrom);
		if(roomId == 0) {
			System.out.println("새 roomId 조회 에러");
		}
		insertChatRRInfrom.put("roomId", roomId);
		int result2 = sqlsessionTemplate.insert("chatMapper.insertNewChatRel", insertChatRRInfrom);
		if(result2 < 1) {
			System.out.println("새 chat관계 생성 에러");
		}
		
		return roomId;
	}

	public int insertTextMessage(Map textMessageInform) {
		int result = sqlsessionTemplate.insert("chatMapper.insertTextMessage", textMessageInform);
				
		if(result < 1) {
			System.out.println("텍스트 메시지 insert가 안됨");
		}
		
		return result;
	}

	public ArrayList<ChatRoom> selectAllChatRooms(int userId) {
		ArrayList<ChatRoom> chatRooms = new ArrayList<ChatRoom>();
		
		chatRooms = (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectAllChatRooms", userId);
		
		if(chatRooms.isEmpty()) {
			System.out.println("로드시 채팅방 못불러옴");
		}
		return chatRooms;
	}

	public ArrayList<Message> selectAllMessages(ArrayList<Integer> roomIds) {
		ArrayList<Message> messages = new ArrayList<Message>();
		
		messages = (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectAllMessages", roomIds);
		
		if(messages.isEmpty()) {
			System.out.println("로드시 채팅방들의 메시지들 못불러옴");
		}
		return messages;
	}

	public ChatSet selectChatSet() {
		ChatSet chatSet = (ChatSet)sqlsessionTemplate.selectOne("chatMapper.selectChatSet");
		
		if(chatSet == null) {
			System.out.println("로드시 채팅설정을 못불러옴");
		}
		return chatSet;
	}

	public MemChatSet selectMChatSet(int userId) {
		System.out.println(userId);
		MemChatSet mChatSet = (MemChatSet)sqlsessionTemplate.selectOne("chatMapper.selectMChatSet", userId);
//		System.out.println("회원별 채팅설정 제대로 불러오니? : " + mChatSet);
		
		if(mChatSet == null) {
			System.out.println("로드시 회원별 채팅설정을 못불러옴");
		}
		return mChatSet;
	}

	public ArrayList<Ask> selectAsk() {
		ArrayList<Ask> chatbotData = new ArrayList<Ask>();
		chatbotData = (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectAsk");
		
		if(chatbotData.isEmpty()) {
			System.out.println("로드시 챗봇데이터를 못불러옴");
		}
		return chatbotData;
	}

	public int updateIsAdvertise(Map updateIsAdMap) {
		int result = sqlsessionTemplate.update("chatMapper.updateIsAdvertise", updateIsAdMap);
		return result;
	}

	public int updateIsMessageTran(Map updateIsMTMap) {
		int result = sqlsessionTemplate.update("chatMapper.updateIsMessageTran", updateIsMTMap);
		return result;
	}
	
	public int updateIsCompleteSave(Map updateIsCSMap) {
		int result = sqlsessionTemplate.update("chatMapper.updateIsCompleteSave", updateIsCSMap);
		return result;
	}

	public int deleteEachChatRoomM(int roomId) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("chat_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = sqlsessionTemplate.delete("chatMapper.deleteEachChatRoomM", roomId);
		
		transactionManager.commit(status);
		
		return result;
	}
	
	public int deleteEachChatRoomC(int roomId) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("chat_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = sqlsessionTemplate.delete("chatMapper.deleteEachChatRoomC", roomId);
		
		transactionManager.commit(status);
		
		return result;
	}
	
	public int deleteEachChatRoomR(int roomId) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("chat_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		int result = sqlsessionTemplate.delete("chatMapper.deleteEachChatRoomR", roomId);
		
		transactionManager.commit(status);
		
		return result;
	}

	public ArrayList searchChatRoom(Map searchMap) {
		ArrayList roomIdList = (ArrayList)sqlsessionTemplate.selectList("chatMapper.searchChatRoom", searchMap);
		
		return roomIdList;
	}

	public int insertFileMessage(Map fileMap) {
		int result = sqlsessionTemplate.insert("chatMapper.insertFileMessage", fileMap);
		return result;
	}

	public ArrayList<ChatRel> selectAllChatRels(int userId) {
		ArrayList<ChatRel> chatRels = new ArrayList<>();
		chatRels = (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectAllChatRels", userId);
		return chatRels;
	}

	public ArrayList<ChatUser> getOtherUser(Map map) {
		System.out.println(map.get("userId") + ", " + map.get("roomId"));
		ArrayList<ChatUser> otherUsers = (ArrayList)sqlsessionTemplate.selectList("chatMapper.getOtherUser", map);
//		System.out.println("DAO에서의 otherUser : " + otherUsers);
		return otherUsers;
	}

	public int selectAllUnReadCount(int mId) {
		return sqlsessionTemplate.selectOne("chatMapper.selectAllUnReadCount", mId);
	}

	public int readMessages(Map map) {
		return sqlsessionTemplate.update("chatMapper.readMessages", map);
	}

	public String selectIsAd(int userId) {
		return sqlsessionTemplate.selectOne("chatMapper.selectIsAd", userId);
	}

	public ArrayList<ChatList> selectAllChatList() {
		return (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectAllChatList");
	}

	public ArrayList<ChatUserInfo> selectChatUserInfo(Map map) {
		return (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectChatUserInfo", map);
	}

	public ArrayList<ProInfo> selectProInfos(Map map) {
		return (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectProInfos", map);
	}

	public ArrayList<EachChatInfo> selectEachChatInfos(Map map) {
		return (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectEachChatInfos", map);
	}

	public int deleteChatRoomsM(ArrayList<String> roomIds) {
		return sqlsessionTemplate.delete("chatMapper.deleteChatRoomsM", roomIds);
	}

	public int deleteChatRoomsC(ArrayList<String> roomIds) {
		return sqlsessionTemplate.delete("chatMapper.deleteChatRoomsC", roomIds);
	}

	public int deleteChatRoomsCR(ArrayList<String> roomIds) {
		return sqlsessionTemplate.delete("chatMapper.deleteChatRoomsCR", roomIds);
	}

	public int insertManyMessage(Map map) {
		int result = sqlsessionTemplate.insert("chatMapper.insertManyMessage", map);
		return result;
	}

	public int selectPrimaryKey() {
		return sqlsessionTemplate.selectOne("chatMapper.selectPrimaryKey");
	}

	public ArrayList<ChatUserInfo> selectAllChatUserInfos() {
		return (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectAllChatUserInfos");
	}

	public ArrayList<Integer> selectAdOkChatRoomIds() {
		return (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectAdOkChatRoomIds");
	}

	public ArrayList<ChatUserInfo> selectAdOkChatUserInfos() {
		return (ArrayList)sqlsessionTemplate.selectList("chatMapper.selectAdOkChatUserInfos");
	}

	public ArrayList<Integer> searchRoomIds(Map map) {
		return (ArrayList)sqlsessionTemplate.selectList("chatMapper.searchRoomIds", map);
	}

	public ArrayList<ChatUserInfo> searchMems(Map map) {
		return (ArrayList)sqlsessionTemplate.selectList("chatMapper.searchMems", map);
	}

	public int selectMaxChatRoomPrimaryKey() {
		return sqlsessionTemplate.selectOne("chatMapper.selectMaxChatRoomPrimaryKey");
	}
	
	public int createNewChatRooms(Map map1) {
		return sqlsessionTemplate.insert("chatMapper.createNewChatRooms", map1);
	}

	public int selectMaxChatPrimaryKey() {
		return sqlsessionTemplate.selectOne("chatMapper.selectMaxChatPrimaryKey");
	}

	public int createNewChatRels(Map map2) {
		return sqlsessionTemplate.insert("chatMapper.createNewChatRels", map2);
	}

	public int updateChatSet(ChatSet chatSet) {
		return sqlsessionTemplate.update("chatMapper.updateChatSet", chatSet);
	}



	
}
