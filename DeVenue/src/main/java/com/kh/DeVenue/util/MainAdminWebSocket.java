package com.kh.DeVenue.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.kh.DeVenue.member.model.vo.Member;


@ServerEndpoint(value="/mainAdmin", configurator=HttpSessionConfigurator.class)
public class MainAdminWebSocket {
	
	private HttpSession httpSession;
	private static Session userSession;
	private EndpointConfig config;
	private Member chatUser;
	private static String adminRoomId;
	private int otherId;
	
	// 첫 매칭은 자동적으로 주관리자와 됨(but, 서브관리자들도 언제든 고객과 통신할 수 있음)
	// 고객이 새 통신을 열어 주관리자와 통신해야해서 주관리자용 통신을 연다
	@OnOpen
	public void handleOpen(Session userSession, EndpointConfig config) {
		// 접속 확인
//		System.out.println();
//		System.out.println("새 채팅방의 주관리자 접속 : " + userSession);
//		System.out.println("웹소켓 서버측 config : " + config);
		
		// 웹소켓 세션을 넣어놓음
		this.userSession = userSession;
//		System.out.println("웹소켓 세션 : " + this.userSession);
		// config 데이터 넣어놓음
		this.config = config;
//		System.out.println("config : " + this.config);
		// config로부터 접속한 유저 정보를 뽑아서 저장
		this.httpSession = (HttpSession)config.getUserProperties().get(HttpSessionConfigurator.Session);
//		System.out.println("HttpSession : " + this.httpSession);
		this.chatUser = (Member)this.httpSession.getAttribute("loginUser");
//		System.out.println("주관리자 유저 : " + this.chatUser);
		
	}
	
	@OnMessage
	public String handleMessage(String message, Session userSession) {
		System.out.println("1대1채팅- 주관리자->고객 메시지");
		
		if(message.equals("keyDownIng")) {
			try {
				Session clientSession = NewChatClient.returnUserSession();
				System.out.println("고객의 세션을 가져왔다");
				int clientId = 0;
				
				try {
					Integer returnUserId = NewChatClient.returnUserId();
					clientId = returnUserId;
				}catch(Exception e) {
					System.out.println("예외발생");
				}
				// 상대 고객이 접속하지 않았을 경우(접속 안되거나 나갈  수 있음)
				if(clientSession != null && clientId == this.otherId) {
					System.out.println("클라이언트가 접속해있다.");
					NewChatClient.returnUserSession().getBasicRemote().sendText(message + ',' + adminRoomId);
					return "Y";
				}else {
					return null;
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("예외발생2");
			}
		}
		
		if(message.contains("other$Id$")) {
			String otherId = message.replace("other$Id$", "");
			this.otherId = Integer.valueOf(otherId);
			return null;
		}
		if(message.contains("room$Id$")) {
			String roomId = message.replace("room$Id$", "");
			this.adminRoomId = roomId;
			return null;
		}
		// 일단은 관리자에서 클라이언트로 갈 땐 이런처리 하지 않음
//		String userKey = UUID.randomUUID().toString().replace("-", "");
		// json 구조로 status는 message이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜) message는 보내는 메시지이다.
//		String jsonMessage = ("{\"status\":\"message\", \"key\":\"" + userKey + "\", \"message\":\"" + message + "\"}");
		
		// key와 메시지 구분키를 #####를 넣었다. (json으로 해도 되는데 Gson 연결까지 하면 귀찮아져서...)
		String[] split = message.split("#####", 2);
		// 앞은 key 데이터
		String key = split[0];
		// 뒤 정보는 메시지
		String msg = split[1];
		try {
			Session clientSession = NewChatClient.returnUserSession();
			System.out.println("고객의 세션을 가져왔다");
			int clientId = 0;
			
			try {
				Integer returnUserId = NewChatClient.returnUserId();
				clientId = returnUserId;
			}catch(Exception e) {
				System.out.println("예외발생");
			}
			// 상대 고객이 접속하지 않았을 경우(접속 안되거나 나갈  수 있음)
			if(clientSession != null && clientId == this.otherId) {
				System.out.println("클라이언트가 접속해있다.");
				NewChatClient.returnUserSession().getBasicRemote().sendText(msg + ',' + adminRoomId);
				return "Y";
			}else {
				System.out.println("클라이언트가 접속하지 않아있다.");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss/SSS");
				sdf.format(new Date());
				String currentDate = sdf.format(new Date());
				String outMsg = "고객님이 접속을 해제한 상태입니다.,"+currentDate + ",채팅알림 서비스" +",N";
				// 관리자는 제이슨 형태로 받아주기 때문에 리턴도 제이슨 형태로
				String jsonMessage = ("{\"status\":\"message\", \"key\":\"" + this.chatUser.getMemEmail() + "\", \"message\":\"" + outMsg + "\"}");
				return jsonMessage;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외발생2");
		}
		return null;
	}
	
	@OnClose
	public void handleClose(Session userSession) {
		
	}
	
	// 주관리자의 세션을 리턴해주는 메소드
	public static Session returnMAdminSession() {
		return userSession;
	}
	// 관리자가 현재 접속해있는 방 번호를 리턴해주는 메소드
	public static String returnMAdinAcessChatRoomId() {
		return adminRoomId;
	}
	@OnError
	public void onError(Session session, Throwable thr, Session userSession) {
		System.out.println("소켓 에러, 갑자기 브라우저가 닫힐 경우 보통 발생");
		handleClose(userSession);
	}
}
