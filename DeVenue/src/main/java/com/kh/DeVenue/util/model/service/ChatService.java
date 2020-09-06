package com.kh.DeVenue.util.model.service;

import java.util.ArrayList;
import java.util.Map;

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

public interface ChatService {

	void deleteMainAdminChat(int mId);

	int insertNewChatRoom(Map insertChatRRInfrom);

	int insertTextMessage(Map textMessageInform);

	ArrayList<ChatRoom> selectAllChatRooms(int userId);

	ArrayList<Message> selectAllMessages(ArrayList<Integer> roomIds);

	ChatSet selectChatSet();
	
	MemChatSet selectMChatSet(int userId);

	String selectIsAd(int userId);
	
	ArrayList<Ask> selectAsk();

	int updateIsAdvertise(Map updateIsAdMap);

	int updateIsMessageTran(Map updateIsMTMap);

	int updateIsCompleteSave(Map updateIsCSMap);

	int deleteEachChatRoom(int roomId);

	ArrayList searchChatRoom(Map searchMap);

	int insertFileMessage(Map fileMap);

	ArrayList<ChatRel> selectAllChatRels(int userId);

	ArrayList<ChatUser> getOtherUser(Map map);

	int selectAllUnReadCount(int mId);

	int readMessages(Map map);

	ArrayList<ChatList> selectAllChatList();

	ArrayList<ChatUserInfo> selectChatUserInfo(Map map);

	ArrayList<ProInfo> selectProInfos(Map map);

	ArrayList<EachChatInfo> selectEachChatInfos(Map map);

	ChatUser selectMe(int userId);

	int deleteChatRooms(ArrayList<String> roomIds);

	int selectPrimaryKey();

	int insertManyMessage(Map map);

	ArrayList<ChatUserInfo> selectAllChatUserInfos();

	ArrayList<Integer> selectAdOkChatRoomIds();

	ArrayList<ChatUserInfo> selectAdOkChatUserInfos();

	ArrayList<Integer> searchRoomIds(Map map);

	ArrayList<ChatUserInfo> searchMems(Map map);

	int selectMaxChatRoomPrimaryKey();

	int createNewChatRooms(Map map1);

	int selectMaxChatPrimaryKey();

	int createNewChatRels(Map map2);

	int updateChatSet(ChatSet chatSet);

	int insertUpdateIntroOutime(Map map);

	int deleteAsk(String askId);

	int updateAsk(Map map);

	int insertAsk(Map map);

}
