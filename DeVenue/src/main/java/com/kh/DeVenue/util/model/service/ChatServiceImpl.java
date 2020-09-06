package com.kh.DeVenue.util.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.util.model.dao.ChatDao;
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


@Service("cService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao cDao;
	
	@Override
	public void deleteMainAdminChat(int mId) {
		int roomId = cDao.getRoomId(mId);
		if(roomId == 0) {
			return;
		}
		cDao.deleteMainAdminChatMessages(roomId);
//		cDao.alterChatConstraintDisable();
		cDao.deleteMainAdminChatRels(roomId);
		cDao.deleteMainAdminChatRooms(roomId);
//		cDao.alterChatConstraintEnable();
	}
	
	@Override
	public ChatUser selectMe(int userId) {
		return cDao.selectMe(userId);
	}

	@Override
	public int insertNewChatRoom(Map insertChatRRInfrom) {
		return cDao.insertNewChatRoom(insertChatRRInfrom);
	}

	@Override
	public int insertTextMessage(Map textMessageInform) {
		return cDao.insertTextMessage(textMessageInform);
	}

	@Override
	public ArrayList<ChatRel> selectAllChatRels(int userId) {
		return cDao.selectAllChatRels(userId);
	}
	
	@Override
	public ArrayList<ChatRoom> selectAllChatRooms(int userId) {
		return cDao.selectAllChatRooms(userId);
	}

	@Override
	public ArrayList<Message> selectAllMessages(ArrayList<Integer> roomIds) {
		return cDao.selectAllMessages(roomIds);
	}

	@Override
	public ChatSet selectChatSet() {
		return cDao.selectChatSet();
	}
	
	@Override
	public MemChatSet selectMChatSet(int userId) {
		return cDao.selectMChatSet(userId);
	}
	
	@Override
	public String selectIsAd(int userId) {
		return cDao.selectIsAd(userId);
	}

	@Override
	public ArrayList<Ask> selectAsk() {
		return cDao.selectAsk();
	}

	@Override
	public int updateIsAdvertise(Map updateIsAdMap) {
		return cDao.updateIsAdvertise(updateIsAdMap);
	}

	@Override
	public int updateIsMessageTran(Map updateIsMTMap) {
		return cDao.updateIsMessageTran(updateIsMTMap);
	}

	@Override
	public int updateIsCompleteSave(Map updateIsCSMap) {
		return cDao.updateIsCompleteSave(updateIsCSMap);
	}

	@Override
	public int deleteEachChatRoom(int roomId) {
		int result1 = cDao.deleteEachChatRoomM(roomId);
		int result2 = cDao.deleteEachChatRoomC(roomId);
		int result3 = cDao.deleteEachChatRoomR(roomId);
		return result1 + result2 + result3;
	}

	@Override
	public ArrayList searchChatRoom(Map searchMap) {
		ArrayList result = cDao.searchChatRoom(searchMap);
		return result;
	}

	@Override
	public int insertFileMessage(Map fileMap) {
		return cDao.insertFileMessage(fileMap);
	}

	@Override
	public ArrayList<ChatUser> getOtherUser(Map map) {
		return cDao.getOtherUser(map);
	}

	@Override
	public int selectAllUnReadCount(int mId) {
		return cDao.selectAllUnReadCount(mId);
	}

	@Override
	public int readMessages(Map map) {
		return cDao.readMessages(map);
	}

	@Override
	public ArrayList<ChatList> selectAllChatList() {
		return cDao.selectAllChatList();
	}

	@Override
	public ArrayList<ChatUserInfo> selectChatUserInfo(Map map) {
		return cDao.selectChatUserInfo(map);
	}

	@Override
	public ArrayList<ProInfo> selectProInfos(Map map) {
		return cDao.selectProInfos(map);
	}

	@Override
	public ArrayList<EachChatInfo> selectEachChatInfos(Map map) {
		return cDao.selectEachChatInfos(map);
	}

	@Override
	public int deleteChatRooms(ArrayList<String> roomIds) {
		int result1 = cDao.deleteChatRoomsM(roomIds);
		int result2 = cDao.deleteChatRoomsC(roomIds);
		int result3 = cDao.deleteChatRoomsCR(roomIds);
		
		int result = result1 + result2 + result3;
		
		return result;
	}

	@Override
	public int insertManyMessage(Map map) {
		return cDao.insertManyMessage(map);
	}

	@Override
	public int selectPrimaryKey() {
		return cDao.selectPrimaryKey();
	}

	@Override
	public ArrayList<ChatUserInfo> selectAllChatUserInfos() {
		return cDao.selectAllChatUserInfos();
	}

	@Override
	public ArrayList<Integer> selectAdOkChatRoomIds() {
		return cDao.selectAdOkChatRoomIds();
	}

	@Override
	public ArrayList<ChatUserInfo> selectAdOkChatUserInfos() {
		return cDao.selectAdOkChatUserInfos();
	}

	@Override
	public ArrayList<Integer> searchRoomIds(Map map) {
		return cDao.searchRoomIds(map);
	}

	@Override
	public ArrayList<ChatUserInfo> searchMems(Map map) {
		return cDao.searchMems(map);
	}

	@Override
	public int selectMaxChatRoomPrimaryKey() {
		return cDao.selectMaxChatRoomPrimaryKey();
	}
	
	@Override
	public int createNewChatRooms(Map map1) {
		return cDao.createNewChatRooms(map1);
	}

	@Override
	public int selectMaxChatPrimaryKey() {
		return cDao.selectMaxChatPrimaryKey();
	}

	@Override
	public int createNewChatRels(Map map2) {
		return cDao.createNewChatRels(map2);
	}

	@Override
	public int updateChatSet(ChatSet chatSet) {
		return cDao.updateChatSet(chatSet);
	}

	@Override
	public int insertUpdateIntroOutime(Map map) {
		return cDao.insertUpdateIntroOutime(map);
	}

	@Override
	public int deleteAsk(String askId) {
		return cDao.deleteAsk(askId);
	}

	@Override
	public int updateAsk(Map map) {
		return cDao.updateAsk(map);
	}

	@Override
	public int insertAsk(Map map) {
		return cDao.insertAsk(map);
	}

	
}
