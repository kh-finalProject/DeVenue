package com.kh.DeVenue.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.kh.DeVenue.member.model.vo.Member;


// 새채팅방 통신 컨트롤러
@ServerEndpoint(value="/newChatClient", configurator=HttpSessionConfigurator.class)
public class NewChatClient {
	
	private HttpSession httpSession;
	private static Session userSession;
	private EndpointConfig config;
	private static Member chatUser;
	private String userKey;
	private String roomId;
	
	// 기존의 이 고객이 가진 모든 채팅방을 지우고(이 전에 jsp에서 에이작스로 처리함)
	// 이 고객과  주관리자를 매칭시킨 새 채팅 연결테이블과 새 채팅방 테이블을 insert한 이 후
	// 새채팅방 통신을 연다
	@OnOpen
	public void handleOpen(Session userSession, EndpointConfig config) {
		// 접속 확인
//		System.out.println();
		System.out.println("새 채팅방의 고객 접속 : " + userSession);
//		System.out.println("웹소켓 서버측 config : " + config);
		
		// 웹소켓 세션을 넣어놓음
		this.userSession = userSession;
		System.out.println("여기까지 수행하는가1");
//		System.out.println("웹소켓 세션 : " + this.userSession);
		// config 데이터 넣어놓음
		this.config = config;
		System.out.println("여기까지 수행하는가2");
//		System.out.println("config : " + this.config);
		// config로부터 접속한 유저 정보를 뽑아서 저장
		this.httpSession = (HttpSession)config.getUserProperties().get(HttpSessionConfigurator.Session);
		System.out.println("여기까지 수행하는가3");
//		System.out.println("HttpSession : " + this.httpSession);
		this.chatUser = (Member)this.httpSession.getAttribute("loginUser");
//		System.out.println("클라이언트 유저 : " + this.chatUser);
		
		// Unique키를 발급 ('-'는 제거한다.)
		String userKey = UUID.randomUUID().toString().replace("-", "");
		this.userKey = userKey;
	}
	
	@OnMessage
	public String handleMessage(String message, Session userSession) {
		System.out.println("1대1채팅- 고객->주관리자 메시지");
		
		if(message.equals("keyDownIng")) {
			System.out.println("여기서?");
			try {
				Session mAdminSession = MainAdminWebSocket.returnMAdminSession();
				System.out.println("아님여기서?");
				String accessAdminRoomId = "";
				try {
					String returnRoomId = MainAdminWebSocket.returnMAdinAcessChatRoomId();
					accessAdminRoomId = returnRoomId;
					System.out.println("혹은여기서?");
				}catch(Exception e) {
					System.out.println("예외발생");
				}
				// 주관리자가 접속하지 않았을 경우(운영시간이어도 접속 안된 수 있음)
				if(mAdminSession != null && this.roomId.equals(accessAdminRoomId)) {
					System.out.println("또는여기서?");
					MainAdminWebSocket.returnMAdminSession().getBasicRemote().sendText(message);
					return "Y";
				}else {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss/SSS");
					sdf.format(new Date());
					String currentDate = sdf.format(new Date());
					String missedMessage = "안녕하세요 "+chatUser.getMemName()+"님!<br>잠시만 기다리시면 곧 상담원이 연결됩니다.,"+currentDate + ",디베뉴 고객센터" + ",roomId" + ",N"; 
					return missedMessage;
				}
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("고객측 웹소켓 메시지 핸들러 예외발생");
			}
		}
		
		
		if(message.contains("room$Id$")) {
			String roomId = message.replace("room$Id$", "");
			this.roomId = roomId;
			return null;
		}
		System.out.println("서버측 현재 roomId : " + this.roomId);
		
		// json 구조로 status는 message이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜) message는 보내는 메시지이다.
		String jsonMessage = ("{\"status\":\"message\", \"key\":\"" + this.chatUser.getMemEmail() + "\", \"message\":\"" + message + "\"}");
		try {
			Session mAdminSession = MainAdminWebSocket.returnMAdminSession();
			
			String accessAdminRoomId = "";
			try {
				String returnRoomId = MainAdminWebSocket.returnMAdinAcessChatRoomId();
				accessAdminRoomId = returnRoomId;
			}catch(Exception e) {
				System.out.println("예외발생");
			}
			// 주관리자가 접속하지 않았을 경우(운영시간이어도 접속 안된 수 있음)
			if(mAdminSession != null && this.roomId.equals(accessAdminRoomId)) {
				MainAdminWebSocket.returnMAdminSession().getBasicRemote().sendText(jsonMessage);
				return "Y";
			}else {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss/SSS");
				sdf.format(new Date());
				String currentDate = sdf.format(new Date());
				String missedMessage = "안녕하세요 "+chatUser.getMemName()+"님!<br>잠시만 기다리시면 곧 상담원이 연결됩니다.,"+currentDate + ",디베뉴 고객센터" + ",roomId" + ",N"; 
				return missedMessage;
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("고객측 웹소켓 메시지 핸들러 예외발생");
		}
		return null;
	}
	
	@OnClose
	public void handleClose(Session userSession) {
		
	}
	
	// 고객의 세션을 리턴해주는 메소드
	public static Session returnUserSession() {
		System.out.println("고객의 세션을 가져간다");
		return userSession;
	}
	// 고객의 회원 번호를 리턴해주는 메소드
	public static int returnUserId() {
		return chatUser.getMemId();
	}
	@OnError
	public void onError(Session session, Throwable thr, Session userSession) {
		System.out.println("소켓 에러, 갑자기 브라우저가 닫힐 경우 보통 발생");
		handleClose(userSession);
	}
}
