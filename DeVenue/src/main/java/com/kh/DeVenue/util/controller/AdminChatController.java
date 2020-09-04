package com.kh.DeVenue.util.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.model.service.MemberService2;
import com.kh.DeVenue.util.model.service.ChatService;
import com.kh.DeVenue.util.model.vo.ChatList;
import com.kh.DeVenue.util.model.vo.ChatSet;
import com.kh.DeVenue.util.model.vo.ChatUser;
import com.kh.DeVenue.util.model.vo.ChatUserInfo;
import com.kh.DeVenue.util.model.vo.EachChatInfo;
import com.kh.DeVenue.util.model.vo.ProInfo;

@Controller
public class AdminChatController {
	
	@Autowired
	private MemberService2 mmService;
	@Autowired
	private ChatService cService;
	
	// 관리자 채팅방으로 가는 메소드
	@RequestMapping("adminChatRoom.do")
	public String goToEachAdminChatRoom(HttpSession session, HttpServletRequest request, String chatRoomMId, String chatRoomRoomId, String meId) throws UnsupportedEncodingException {
		// 뷰로부터 회원번호, 룸번호에 더해 본인번호까지 3가지 데이터가 필요함
		System.out.println("불러올 채팅상대 아이디 : " + chatRoomMId);
		System.out.println("불러올 채팅방 아이디 : "+chatRoomRoomId);
		System.out.println("관리자 번호 : " + meId);
		int userId = Integer.valueOf(meId);
		// 같은 서버 같은 pc라 그런지 세션이 후에 로그인 하는 계정 기준이 되어서 me라는 계정정보를 따로 불러옴
		ChatUser me = cService.selectMe(userId);
		System.out.println("지금 내 채팅용 계정 정보 : "+me);
		
		if(chatRoomMId != null && chatRoomRoomId != null) {
		Map map = new HashMap<>();
		map.put("chatRoomMId", chatRoomMId);
		map.put("roomId", chatRoomRoomId);
		map.put("userId", me.getmId());
		
		// 관리자 채팅방에 필요한 정보를 가지고 가야 함
		// 대상회원정보, 대상 채팅방, 메시지, 채팅관계정보, 
		// 회원의 완료된 프로젝트, 진행중 프로젝트 정보(파트너스냐 클라이언트냐에 따라 다른 방식으로 추출)
		// 뷰와 그에 대응하는 DTO 객체를 사용함
		ArrayList<ChatUserInfo> chatUserInfos = cService.selectChatUserInfo(map);
		System.out.println("채팅방 참석자들 상세정보 : "+chatUserInfos);
		ArrayList<ProInfo> proInfos = cService.selectProInfos(map);
		System.out.println("채팅방 클라이언트 프로젝트 간략 정보 : " + proInfos);
		ArrayList<EachChatInfo> eachChatInfos = cService.selectEachChatInfos(map);
		System.out.println("채팅방 클라이언트 각 채팅 정보 : " + eachChatInfos);
		
		// 메시지 읽음 처리를 해야함(고객단에서 활용한 메소드 재활용)
		int result = cService.readMessages(map);
		if(result < 1) {
			System.out.println("메시지 읽음 처리를 잘 못함");
		}else {
			System.out.println("메시지 읽음 처리 완료");
		}
		
		request.setCharacterEncoding("UTF-8");
		
		// 화면에 넘김
		request.setAttribute("chatUserInfos", chatUserInfos);
		request.setAttribute("proInfos", proInfos);
		request.setAttribute("eachChatInfos", eachChatInfos);
		request.setAttribute("me", me);
		
		}
		return "chat/adminChatRoom";
	}
	
	// 채팅목록 관리로 가는 메소드
	@RequestMapping("goChatListManage.do")
	public String goChatListManage(HttpServletRequest request) {
		// 1. 페이지네이션 해야함 -> 채팅방 수가 적어서 안급하니 일단 다음에
		
		// 2. 관리자 채팅목록에 필요한 정보를 가지고 가야 함
		// 일단은 서치를 위해 관리자들을 모두 가져와야 하고, 
		// 채팅방을 위해서는 회원프로필사진(+회원번호), 채팅방 테이블, 
		// 채팅방별 마지막 메시지에 대한 정보, 채팅방 별 안읽은 메시지 총합(관리자 입장에서)  
		
		// 관리자 정보를 죄다 불러옴(여기서부터 정식 채팅용 멤버 객체 사용, 나중에 고객단도 이걸로 다 바꿔 주자)
		ArrayList<ChatUser> admins = mmService.allAdmins();
		// 채팅방들을 채팅방별 마지막 메시지 정보와 채팅방별 안읽은 메시지 총합, 
		// 채팅방관계 테이블로부터 대화상대와 프로필리네임명 가져오고, 
		// 이것을을 뷰로 만들어서 한번에 가져옴(새로운 dto 객체 사용)
		ArrayList<ChatList> chatList = cService.selectAllChatList();
		
		if(admins.isEmpty()||admins == null) {
			System.out.println("관리자 목록이 없거나 가져오지 못함");
		}
		if(chatList.isEmpty()||chatList == null) {
			System.out.println("관리자 목록이 없거나 가져오지 못함");
		}
		System.out.println("채팅목록.. : " + chatList);
		request.setAttribute("admins", admins);
		request.setAttribute("chatList", chatList);
		
		return "chat/adminChatListManage";
	}
	
	// 채팅목록관리에서 채팅방의 회원들에게 메시지 보내는 함수
	@RequestMapping("insertManyMessage.do")
	public String insertManyMessage(HttpSession session, String roomIds, String mContent) {
		int adminId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		System.out.println(roomIds);
		System.out.println(mContent);
		
		String[] rArr = roomIds.split(",");
		ArrayList<String> roomIdList = new ArrayList<>();
		for(String item : rArr) {
			roomIdList.add(item);
		}
		
		Map map = new HashMap();
		map.put("roomIdList", roomIdList);
		map.put("mContent", mContent);
		map.put("adminId", adminId);
		
		// 먼저 맨 마지막 메시지 아이디 + 1을 해준 값을 뽑아온다.
		int sequence = cService.selectPrimaryKey();
		map.put("sequence", sequence);
		// 지금 보내는 관리자명의로 해당 채팅방에 각각 메시지 일괄 전송
		int result = cService.insertManyMessage(map);
		
		if(result>0) {
			System.out.println("채팅방들에 단체메시지 성공적으로 보냄");
		}else {
			System.out.println("채팅방들에 단체메시지 보내기 실패");
		}
		
		// 다시 목록창으로 돌아감
		return "redirect:goChatListManage.do";
	}
	
	// 채팅목록관리에서 선택한 체팅방들을 삭제하는 함수
	@RequestMapping("deleteChatRooms.do")
	public void deleteChatRooms(HttpServletResponse response, String roomIds) throws IOException {
		
		String[] rArr = roomIds.split(",");
		ArrayList<String> roomIdList = new ArrayList<>();
		for(String item : rArr) {
			roomIdList.add(item);
		}
		System.out.println("삭제할 방 번호들 : " + roomIdList);
		
		int result = cService.deleteChatRooms(roomIdList);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if(result > 2) {
			String msg = "관리자가 채팅방들을 잘 삭제했다.";
			out.print(msg);
			out.flush();
			out.close();
		}else {
			String msg = "관리자가 채팅방들을 못 삭제했다.";
			out.print(msg);
			out.flush();
			out.close();
		}
	}
	
	// 채팅 목록관리에서 마케팅광고 수신여부에 따라 해당하는 채팅방 번호와 회원정보를 가져오는 함수
	@RequestMapping("selectIsReadRoomAndMem.do")
	public void selectIsReadRoomAndMem(HttpServletResponse response, String value) throws IOException {
		System.out.println("넘어온 값 : " + value);
		// 결과를 담을 컬렉션
		Map map = new HashMap();
		
		if(value.equals("all")) {
			// 모든 회원 정보만 불러오면 됨(관리자 제외)
			ArrayList<ChatUserInfo> cui = cService.selectAllChatUserInfos();
			
			if(cui != null) {
				System.out.println("관리자가 아니면서 채팅방이 없는 모든 회원" + cui);
				map.put("cui", cui);
			}else {
				System.out.println("관리자가 아니면서 채팅방이 없는 모든 회원이 없거나 불러오지 못함");
				map.put("cui", cui);
			}
		}else {
			// 마케팅 동의한 채팅방번호와 회원정보들을 가져와야 함
			ArrayList<Integer> isAdRoomIds = new ArrayList<>();
			isAdRoomIds = cService.selectAdOkChatRoomIds();
			ArrayList<ChatUserInfo> cui = new ArrayList<ChatUserInfo>(); 
			cui = cService.selectAdOkChatUserInfos();
			
			if(isAdRoomIds.isEmpty()&&cui.isEmpty()) {
				System.out.println("관리자가 아니면서 채팅방이 없으면서 마케팅 수신 동의한 모든 회원" + cui);
				System.out.println("관리자가 아니면서 마케팅 수신 동의한 회원의 모든 채팅방 번호" + isAdRoomIds);
				map.put("cui", cui);
				map.put("isAdRoomIds", isAdRoomIds);
			}else {
				System.out.println("관리자가 아니면서 채팅방이 없는 모든 회원이 없거나 불러오지 못함" + cui);
				System.out.println("또는 마케팅 동의한 회원이 가진 채팅방이 없거나 불러오지 못함" + isAdRoomIds);
				map.put("cui", cui);
				map.put("isAdRoomIds", isAdRoomIds);
			}
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new Gson();
		gson.toJson(map, response.getWriter());
	}
	
	@RequestMapping("searchChatRoomAndMem.do")
	public void searchChatRoomAndMem(HttpServletResponse response, String category, String text) throws IOException {
		// 키워드를  대응되는 검색할 컬럼명으로 치환
		System.out.println("category : " + category);
		System.out.println("text : " + text);
		String column = "";
		String column2 = "";
		switch(category) {
			case "name": column = "MEM_NAME"; break;
			case "email": column = "MEM_EMAIL"; break;
			case "phone": column = "PHONE";  column2 = "CELLPHONE"; break;
			default:  column = "잘못된 값"; break;
		}
		System.out.println("column : " + column);
		// 전달할 데이터 묶음
		Map map = new HashMap<>();
		map.put("columnName", column);
		map.put("searchText", text);
//		map.put("column2", column2);
		// 전화번호의 경우 2가지 컬럼을 대상으로 검색
		if(column2 != "") {
			map.put("column2", column2);
		}
		
		// DB에 조회하여 해당 회원이 있는 방번호와 해당 회원 정보를 불러온다.
		ArrayList<Integer> searchRoomIds = new ArrayList<>();
		searchRoomIds = cService.searchRoomIds(map);
		ArrayList<ChatUserInfo> cui = new ArrayList<ChatUserInfo>(); 
		cui = cService.searchMems(map);
		
		Map gMap = new HashMap<>();
		
		if(searchRoomIds.isEmpty()&&cui.isEmpty()) {
			System.out.println("관리자가 아니면서 채팅방이 없으면서 검색된 모든 회원" + cui);
			System.out.println("관리자가 아니면서 채팅방이 있으면서 검색된 회원의 모든 채팅방 번호" + searchRoomIds);
			gMap.put("cui", cui);
			gMap.put("searchRoomIds", searchRoomIds);
		}else {
			System.out.println("관리자가 아니면서 채팅방이 없으면서 검색된 모든 회원 불러오지 못함" + cui);
			System.out.println("관리자가 아니면서 채팅방이 있으면서 검색된 회원의 모든 채팅방 번호를 불러오지 못함" + searchRoomIds);
			gMap.put("cui", cui);
			gMap.put("searchRoomIds", searchRoomIds);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new Gson();
		gson.toJson(gMap, response.getWriter());
	}
	
	// 내장 클래스
	static class CreateChatUserInfo{
		private String fromId;
		private String mNick;
		private String roomName;
		
		CreateChatUserInfo(){};
		CreateChatUserInfo(String fromId,String mNick,String roomName){
			this.fromId = fromId;
			this.mNick = mNick;
			this.roomName = roomName;
		};
	}
	
	@RequestMapping("createNewChat.do")
	public void creatNewChat(HttpSession session, HttpServletResponse response, String mIds, String mNicks) throws IOException {
		int adminId = ((Member)session.getAttribute("loginUser")).getMemId();
		String adminNick = ((Member)session.getAttribute("loginUser")).getMemNick();
		
		System.out.println("회원들 번호 : " + mIds + ", 로그인한 관리자 유저 번호: " + adminId);
		System.out.println("회원들 닉 : " + mNicks + ", 로그인한 관리자 유저 닉: " + adminNick);
		
		// 각 룸이름 생성
		String[] nickArr = mNicks.split(",");
		ArrayList<String> roomNames = new ArrayList<String>();
		for(String n: nickArr) {
			roomNames.add(n + "&" + adminNick + " [Room]");
		}
		// 먼저 ChatRoom 을 먼저 만들텐데 룸번호는 순서대로, 룸이름은 여기서 정한 걸로 생성한다.
		// insert all구문을 쓰면서 룸번호를 순서대로 정하려면 먼저 마지막 룸번호를 뽑아온다.
		int lastCRIndex = cService.selectMaxChatRoomPrimaryKey();
		// Map에 마지막 룸번호와 룸이름들을 묶어보낸다.
		Map map1 = new HashMap<>();
		map1.put("roomNames", roomNames);
		map1.put("lastCRIndex", lastCRIndex);
		// 룸 생성하러 간다
		int result1 = cService.createNewChatRooms(map1);
		// 이 후 Chat을 생성하는데, 챗번호는 순서대로, fromId와 toId는 회원번호와 관리지 번호,
		// roomId는 룸이름이 이것인 룸번호로 진행한다.
		// 먼저 마지막 CHAT번호를 뽑아온다.
		int lastCIndex = cService.selectMaxChatPrimaryKey();
		// 내장 클래스객체에 회원별 insert 정보를 담고 ArrayList로 만든 다음 마지막 챗번호랑 묶어 map을 생성
		String[] idArr = mIds.split(",");
		ArrayList<CreateChatUserInfo> users = new ArrayList<CreateChatUserInfo>();
		for(int i = 0; i < idArr.length; i++) {
			String id = idArr[i];
			String nick = nickArr[i];
			String roomName = nick + "&" + adminNick + " [Room]";
			CreateChatUserInfo ccui = new CreateChatUserInfo(id, nick, roomName);
			users.add(ccui);
		}
		Map map2 = new HashMap<>();
		map2.put("adminId", adminId);
		map2.put("users", users);
		map2.put("lastCIndex", lastCIndex);
		
		// 새 채팅방 인서트하러 감(chat 테이블과 chatRoom 테이블)
		int result2 = cService.createNewChatRels(map2);
		
		String msg = "";
		if(result2 > 0) {
			msg = "제대로 새 채팅방 생성";
		}else {
			msg = "새 채팅방 생성 못함";
		}
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(msg);
		out.flush();
		out.close();
	}
	
	// 채팅 설정으로 가는 메소드
	@RequestMapping("gotoChatOption.do")
	public String gotoChatOption(HttpServletRequest request) {
		// 채팅 설정 테이블을 불러온다(한행으로 끝나니 리스트로 받지 않는다.)
		ChatSet chatSet = cService.selectChatSet();
		request.setAttribute("chatSet", chatSet);
		
		return "chat/chatOptionManage";
	}

	// 채팅 시간설정 바꾸는 메소드
	@RequestMapping("updateChatSet.do")
	public void updateChatSet(HttpServletResponse response, ChatSet chatSet) throws IOException {
		System.out.println(chatSet);
		ChatSet chatset = chatSet;
		
		// DB에 업데이트하기 전에 데이터가 있는지 확인하고 있으면 update 아니면 insert하는 Merge문 사용
		int result = cService.updateChatSet(chatSet);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if(result > 0) {
			System.out.println("채팅시간설정 업뎃혹은 인서트 성공");
			out.print("채팅시간설정 업뎃혹은 인서트 성공");
			out.flush();
			out.close();
		}else {
			System.out.println("채팅시간설정 업뎃혹은 인서트 실패");
			out.print("채팅시간설정 업뎃혹은 인서트 실패");
			out.flush();
			out.close();
		}
		
	}
}
