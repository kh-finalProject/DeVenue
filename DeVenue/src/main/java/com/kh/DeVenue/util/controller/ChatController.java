package com.kh.DeVenue.util.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.util.model.service.ChatService;
import com.kh.DeVenue.util.model.vo.Ask;
import com.kh.DeVenue.util.model.vo.ChatRel;
import com.kh.DeVenue.util.model.vo.ChatRoom;
import com.kh.DeVenue.util.model.vo.ChatSet;
import com.kh.DeVenue.util.model.vo.ChatUser;
import com.kh.DeVenue.util.model.vo.ChatUserInfo;
import com.kh.DeVenue.util.model.vo.MemChatSet;
import com.kh.DeVenue.util.model.vo.Message;

@Controller
public class ChatController {

	@Autowired
	private ChatService cService;
	
	// 처음 채팅 페이지 로드할 때
	@RequestMapping("firstLoadChat.do")
	public String loadChat(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userId = loginUser.getMemId();
		
		// 같은 서버 같은 pc라 그런지 세션이 후에 로그인 하는 계정 기준이 되어서 me라는 계정정보를 따로 불러옴
		ChatUser me = cService.selectMe(userId);
//		System.out.println("지금 내 채팅용 계정 정보 : "+me);
		
		// 채팅관계테이블 다 불러옴
		ArrayList<ChatRel> chatRels = cService.selectAllChatRels(userId);
//		System.out.println(chatRels);
		// 채팅관계테이블을 이용해 참여한 채팅방을 모두 불러옴
		ArrayList<ChatRoom> chatRooms = cService.selectAllChatRooms(userId);
//		System.out.println(chatRooms);
		// 참여한 채팅방 번호를 통해 모든 주고받은 메시지를 불러옴
		ArrayList<Integer> roomIds = new ArrayList<Integer>();
		for(ChatRoom cr: chatRooms) {
			roomIds.add(cr.getRoomId());
		}
//		System.out.println("채팅방 : " + chatRooms);
		ArrayList<Message> messages = new ArrayList<Message>();
		if(!chatRooms.isEmpty()) {
			messages = cService.selectAllMessages(roomIds);
		}
//		System.out.println("불러온 메시지 : " + messages);
		// 채팅 설정을 불러옴
		ChatSet chatSet = cService.selectChatSet();
//		System.out.println(chatSet);
		// 회원별 채팅 설정을 불러옴
		MemChatSet mChatSet = cService.selectMChatSet(userId);
		// 마케팅 광고 표시 여부를 따로 불러옴(회원별 채팅 테이블을 뒤늦게 추가하는 바람에, 마케팅 여부 컬럼은 멤버 테이블에 있고, 로그인 유저 세션은 새로고침이 안먹어서 새로 가져온다)
		String isAd = cService.selectIsAd(userId);
		// 챗봇 데이터를 불러옴
		ArrayList<Ask> ask = cService.selectAsk();
//		System.out.println(chatbotData);
		
		// 모든 데이터를 JSON 방식으로 반환하거나 세션혹은 request에 담음
		request.setAttribute("chatRels", chatRels);
		request.setAttribute("chatRooms", chatRooms);
		request.setAttribute("messages", messages);
		request.setAttribute("chatSet", chatSet);
		request.setAttribute("mChatSet", mChatSet);
		request.setAttribute("isAd", isAd);
		request.setAttribute("ask", ask);
		request.setAttribute("me", me);
		
		// 화면으로
		return "chat/clientChat";
		
	}
	
	// 고객 측에서 새채팅 시작하면 기존 채팅 정보 모두 삭제
	@RequestMapping("deleteMainAdminChat.do")
	public void deleteMainAdminChat(HttpServletResponse response, @RequestParam String userId) throws IOException {
//		System.out.println(userId);
		int mId = Integer.valueOf(userId);
		cService.deleteMainAdminChat(mId);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print("기존 채팅정보 삭제하는 에이작스 성공");
		out.flush();
		out.close();
	}
	
	// 고객 측에서 새로운 채팅방 생성
	@RequestMapping("insertNewChatRoom.do")
	public void insertNewChatRoom(HttpServletResponse response, @RequestParam int userId, String userNick, int mAdminNo, String mAdminNick) throws IOException {
//		System.out.println(userId);
//		System.out.println(userNick);
//		System.out.println(mAdminNo);
//		System.out.println(mAdminNick);
		
		// 채팅방 개설한 유저 번호, 주관리자 유저 번호, 채팅방 이름(주관리자 닉네임/회원닉네임에 더함) 필요
		String roomName = userNick+"&"+mAdminNick+" [Room]";
		Map insertChatRRInfrom = new HashMap();
		insertChatRRInfrom.put("userNo", userId);
		insertChatRRInfrom.put("mAdminNo", mAdminNo);
		insertChatRRInfrom.put("roomName", roomName);
		
		int roomId = cService.insertNewChatRoom(insertChatRRInfrom);
				
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(roomId);
		out.flush();
		out.close();
	}

	// 텍스트 메시지 전송한 것을 저장
	@RequestMapping("saveChatTextMessage.do")
	public void insertTextMessage(HttpServletResponse response, String msg, String time, int from_id, int room_id, String isRead) throws IOException {
//		System.out.println("msg" + msg);
//		System.out.println("time" + time);
//		System.out.println("from_id" + from_id);
//		System.out.println("room_id" + room_id);
		System.out.println("텍스트 메시지 전송하는 메소드까진 오나");
		Map textMessageInform = new HashMap();
		textMessageInform.put("msg", msg);
		textMessageInform.put("time", time);
		textMessageInform.put("from_id", from_id);
		textMessageInform.put("room_id", room_id);
		textMessageInform.put("isRead", isRead);
		
		int result = cService.insertTextMessage(textMessageInform);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print("메시지 저장 완료");
		out.flush();
		out.close();
	}
	
	// 채팅을 위해 로그인한 회원의 채팅관련 정보를 죄다 불러옴
	// 채팅 관계테이블에 따른 채팅방과 메시지들을 다 불러옴
	// 채팅 설정에 관한것도 불러와야함(운영시간, 관리자 프사 등등.. 프사부분은 호준이와 합의 후 진행하자 회원가입이니까)
	// 챗봇에 관한 것도 불러와야함
	@RequestMapping(value="loadChatData.do", method=RequestMethod.GET)
	public void loadChatData(HttpSession session, HttpServletRequest request, HttpServletResponse response, int userId) throws IOException {
		// 채팅관계테이블 다 불러옴
		ArrayList<ChatRel> chatRels = cService.selectAllChatRels(userId);
//		System.out.println(chatRels);
		// 채팅관계테이블을 이용해 참여한 채팅방을 모두 불러옴
		ArrayList<ChatRoom> chatRooms = cService.selectAllChatRooms(userId);
//		System.out.println(chatRooms);
		// 참여한 채팅방 번호를 통해 모든 주고받은 메시지를 불러옴
		ArrayList<Integer> roomIds = new ArrayList<Integer>();
		for(ChatRoom cr: chatRooms) {
			roomIds.add(cr.getRoomId());
		}
//		System.out.println(chatRooms);
		ArrayList<Message> messages = new ArrayList<Message>();
		if(!chatRooms.isEmpty()) {
			messages = cService.selectAllMessages(roomIds);
		}
//		System.out.println(messages);
		// 채팅 설정을 불러옴
		ChatSet chatSet = cService.selectChatSet();
//		System.out.println("채팅방 설정 : " + chatSet);
//		System.out.println(chatSet);
		// 회원별 채팅 설정을 불러옴
		MemChatSet mChatSet = cService.selectMChatSet(userId);
		// 챗봇 데이터를 불러옴
		ArrayList<Ask> ask = cService.selectAsk();
//		System.out.println(chatbotData);
		
		// 모든 데이터를 JSON 방식으로 반환하거나 세션에 담음 -> 에이작스는 세션이 안먹어서(웹보안 정책) JSON으로 해결
		request.setAttribute("chatRels", chatRels);
		request.setAttribute("chatRooms", chatRooms);
		request.setAttribute("messages", messages);
		request.setAttribute("chatSet", chatSet);
		request.setAttribute("mChatSet", mChatSet);
		request.setAttribute("ask", ask);
		
		Map map = new HashMap();
		map.put("chatRooms", chatRooms);
		map.put("messages", messages);
		map.put("chatSet", chatSet);
		map.put("mChatSet", mChatSet);
		map.put("ask", ask);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		gson.toJson(map, response.getWriter());
	
	}
	
	// 마케팅 정보 수신 동의 여부 변경시 업데이트
	@RequestMapping("updateIsAdvertise.do")
	public void updateIsAdvertise(HttpServletResponse response, String isAd, String userId) throws IOException {
//		System.out.println(isAd);
//		System.out.println(userId);
		
		Map updateIsAdMap = new HashMap();
		updateIsAdMap.put("isAd", isAd);
		updateIsAdMap.put("userId", userId);
		
		response.setCharacterEncoding("UTF-8");
		
		int result = cService.updateIsAdvertise(updateIsAdMap);
		
		if(result>0) {
			// 화면으로 돌아감
			PrintWriter out = response.getWriter();
			out.print("광고 수신여부 업뎃 완료");
			out.flush();
			out.close();
		}else {
			System.out.println("광고 수신여부 업뎃 실패..");
		}
			
	}
	// 번역 표시 여부 변경시 업데이트
	@RequestMapping("updateIsMessageTran.do")
	public void updateIsMessageTran(HttpServletResponse response, String isMT, String userId) throws IOException {
//		System.out.println(isMT);
//		System.out.println(userId);
		
		Map updateIsMTMap = new HashMap();
		updateIsMTMap.put("isMT", isMT);
		updateIsMTMap.put("userId", userId);
		
		response.setCharacterEncoding("UTF-8");
		
		int result = cService.updateIsMessageTran(updateIsMTMap);
		
		if(result>0) {
			// 화면으로 돌아감
			PrintWriter out = response.getWriter();
			out.print("번역 표시 여부 업뎃 완료");
			out.flush();
			out.close();
		}else {
			System.out.println("번역 표시 여부 업뎃 실패..");
		}
			
	}
	// 종료 채팅 표시여부 변경시 업데이트
	@RequestMapping("updateIsCompleteSave.do")
	public void updateIsCompleteSave(HttpServletResponse response, String isCS, String userId) throws IOException {
//		System.out.println(isCS);
//		System.out.println(userId);
		
		Map updateIsCSMap = new HashMap();
		updateIsCSMap.put("isCS", isCS);
		updateIsCSMap.put("userId", userId);
		
		response.setCharacterEncoding("UTF-8");
		
		int result = cService.updateIsCompleteSave(updateIsCSMap);
		
		if(result>0) {
			// 화면으로 돌아감
			PrintWriter out = response.getWriter();
			out.print("종료 채팅 표시여부 업뎃 완료");
			out.flush();
			out.close();
		}else {
			System.out.println("종료 채팅 표시여부 업뎃 실패..");
		}
			
	}
		
	
	// 채팅방 목록에서 각 채팅방 나가기 버튼 눌렀을 떄 채팅방 삭제
	@RequestMapping("deleteEachChatRoom.do")
	public void deleteEachChatRoom(HttpServletResponse response, int roomId) throws IOException {
//		System.out.println(roomId);
		response.setCharacterEncoding("UTF-8");
		
		int result = cService.deleteEachChatRoom(roomId);
		
		if(result>2) {
			// 화면으로 돌아감
			PrintWriter out = response.getWriter();
			out.print("채팅방과 메시지 삭제 완료");
			out.flush();
			out.close();
		}else {
			System.out.println("채팅방 혹은 메시지 삭제 실패..");
		}
	}
	
	// 채팅방 검색
	@RequestMapping("searchChatRoom.do")
	public void searchChatRoom(HttpServletResponse response, String searchText, String roomIds) throws IOException {
//		System.out.println(searchText);
//		System.out.println(roomIds);
		response.setCharacterEncoding("UTF-8");
		
		String[] roomIdArr = roomIds.split(",");
		Map searchMap = new HashMap();
		List roomIdList = new ArrayList();
		
		for(int i = 0; i < roomIdArr.length; i++) {
			roomIdList.add(roomIdArr[i]);
			System.out.println("룸넘버 모음 배열 : "+roomIdArr[i]);
		}
		System.out.println("in안에 들어갈 룸후보들"+roomIdList);
		// 검색어와 채팅방 번호가 담긴 리스트객체를 맵에 담아 DB로
		searchMap.put("searchText", searchText);
		searchMap.put("roomIdList", roomIdList);
		
		ArrayList roomIdsList = new ArrayList(); 
		roomIdsList = cService.searchChatRoom(searchMap);
		System.out.println("검색된 룸들 : "+roomIdsList);
		
		
		if(!roomIdsList.isEmpty()) {
			// 화면으로 돌아감
			PrintWriter out = response.getWriter();
			out.print(roomIdsList);
			out.flush();
			out.close();
		}else {
			// 화면으로 돌아감
			PrintWriter out = response.getWriter();
			out.print("no");
			out.flush();
			out.close();
		}
	}
	
	// 파일 메시지 전송한 것을 저장
	@RequestMapping("saveChatFileMessage.do")
	public void insertFileMessage(HttpServletResponse response, int room_id, String originFileName, String renameFileName, String time, int from_id,  String isRead) throws IOException {
//			System.out.println("msg" + msg);
//			System.out.println("time" + time);
//			System.out.println("from_id" + from_id);
//			System.out.println("room_id" + room_id);
		System.out.println("파일 메시지 전송하는 메소드까진 오나");
//		System.out.println(room_id);
		
		// 파일 전송시, 채팅방에서 미리보기로 보여질 문구 택함(확장자 기준으로 파일/이미지 두가지로 구분)
		String[] textArr = originFileName.split("\\.");
		//split()이 특수문자를 인식을 잘 못할 때가 있는데 이땐 이스케이프 해주면 됨
		//특히 .의 경우는 정규식으로 인식해서 그럼
		String text = textArr[textArr.length-1];
		text = text.toUpperCase()+" 파일을 보냈습니다.";
		
		// DB에 파일 메시지 insert
	   Map fileMessageInfo = new HashMap();
	   fileMessageInfo.put("room_id", room_id);
	   fileMessageInfo.put("originFileName", originFileName);
	   fileMessageInfo.put("renameFileName", renameFileName);
	   fileMessageInfo.put("time", time);
	   fileMessageInfo.put("from_id", from_id);
	   fileMessageInfo.put("isRead", isRead);
	   fileMessageInfo.put("text", text);
	   
	   int result = cService.insertFileMessage(fileMessageInfo);
	
	   response.setCharacterEncoding("UTF-8");
	   if(result>0) {
		   PrintWriter out = response.getWriter();
		   out.print("파일메시지 저장 완료");
		   out.flush();
		   out.close();
	   }else {
		   PrintWriter out = response.getWriter();
		   out.print("파일메시지 저장 실패");
		   out.flush();
		   out.close();
	   }
	}
	
	// 채팅방에서 채팅창을 띄우기 위해 상대방 회원정보를 알아내러 감
	@RequestMapping("getOtherUser.do")
	public void getOtherUser(HttpSession session, HttpServletRequest request, HttpServletResponse response, String userId, String roomId) throws IOException {
//		System.out.println(userId);
//		System.out.println(roomId);
		System.out.println("겟아더 유저가 왜 실행되나????");
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("roomId", roomId);
		
		//채팅 참여자들 정보를 모두 가져옴
		ArrayList<ChatUserInfo> chatUserInfos = cService.selectChatUserInfo(map);
		request.setAttribute("chatUserInfos", chatUserInfos);
		
		ArrayList<ChatUser> otherUsers = cService.getOtherUser(map);
//		System.out.println("상대 유저들 정보 : "+otherUsers);
		
//		session.setAttribute("otherUsers", otherUsers);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		gson.toJson(otherUsers, response.getWriter());
		
	}
	
	// 각 페이지에서 채팅아이콘 상태일 때 안읽은 메시지 ajax처리
	@RequestMapping("reloadAllReadCount.do")
	public void reloadAllReadCount(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		int mId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		int allUnReadCount = cService.selectAllUnReadCount(mId);
		System.out.println("모든 안읽은 메시지 수 : " + allUnReadCount);
		
		if(allUnReadCount >= 0) {
			request.setAttribute("allUnReadCount", allUnReadCount);
			out.print(allUnReadCount);
			out.flush();
			out.close();
		}else {
			out.print("모든 안읽은 메시지 수 조회 실패");
			out.flush();
			out.close();
			
		}
	}
	
	// 각 페이지에서 채팅아이콘 상태일 때 안읽은 메시지 ajax처리
	@RequestMapping("readMessages.do")
	public void readMessages(HttpSession session, HttpServletResponse response, String roomId, String userId) throws IOException {
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		Map map = new HashMap<>();
		map.put("roomId", roomId);
		map.put("userId", userId);
		
		int result = cService.readMessages(map);
		
		if(result > 0) {
			out.print("들어간 채팅방 메시지 읽음처리 완료");
			out.flush();
			out.close();
		}else {
			out.print("들어간 채팅방 메시지 읽음처리 완료");
			out.flush();
			out.close();
			
		}
	}
	
}
