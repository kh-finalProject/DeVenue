package com.kh.DeVenue.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.kh.DeVenue.model.vo.Member;


// 관리자측 전역 웹소켓 담당
// (관리자들이 회원에게 언제나 보낼 수 있도록 관리자가 단체 가능 메시지창 접속시 로그인된 회원들과 자동 연결)
@ServerEndpoint(value="/admin", configurator=HttpSessionConfigurator.class)
public class Admin {
	private HttpSession httpSession;
	private static Session userSession;
	private EndpointConfig config;
	private Member chatUser;
	
	// 운영자 유저가 여러명이므로 접속 관리자 리스트 만들기
	private static Map<Session, EndpointConfig> admin = Collections.synchronizedMap(new HashMap<>());
	private static Map<Member, Session> adminInform = Collections.synchronizedMap(new HashMap<>());
	
	// 여기에 접속리스트를 담을까..?
	private Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<>());
	private Member loginAdmin;
	
	// 운영자 유저가 접속을 하면 발생하는 이벤트 함수
	@OnOpen
	public void handleOpen(Session userSession, EndpointConfig config) {
		if(!configs.containsKey(userSession)) {
			configs.put(userSession, config);
			admin.put(userSession, config);
		}
		if(configs.containsKey(userSession)) {
			EndpointConfig cf = configs.get(userSession);
			HttpSession session = (HttpSession)cf.getUserProperties().get(HttpSessionConfigurator.Session);
			this.loginAdmin = (Member)session.getAttribute("loginUser");
			System.out.println(loginAdmin);
			adminInform.put((Member)session.getAttribute("loginUser"), userSession);
		}
		Admin.userSession = userSession;
		// 기존에 접속해 있는 유저의 정보를 운영자 client로 보낸다.
//		for (String key : BroadSocket.getUserKeys()) {
			// 전송.. 전송
//			visit(key);
//		}
	}

	// 운영자 유저가 메시지를 보내면 발생하는 이벤트
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		// key와 메시지 구분키를 #####를 넣었다. (json으로 해도 되는데 Gson 연결까지 하면 귀찮아져서...)
		String[] split = message.split("#####", 2);
		// 앞은 key 데이터
		String key = split[0];
		// 뒤 정보는 메시지
		String msg = split[1];
		// 일반 유저의 key로 탐색후 메시지 전송
		BroadSocket.sendMessage(key, msg);
		System.out.println("key : " + key + "msg : " + msg);
		
	}

	// 접속이 끊기면 위 운영자 세션을 null 처리한다. -> 나는 그러면 안됨(여러 관리자가 있음)
	@OnClose
	public void handleClose(Session userSession) {

	}

	// 운영자 유저로 메시지를 보내는 함수
	private static void send(String message) {
		if (admin != null) {
			try {
				for(Session adminkey: admin.keySet()) {
					adminkey.getBasicRemote().sendText(message);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
//			예외처리
		}
	}
	
	//-----------------------------------------------------------------------------
	
	// 일반 유저가 접속했을 때, 운영자 유저에게 알리는 함수
	public static void visit(String key) {
		if(admin.size()==0) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss/SSS");
			sdf.format(new Date());
			String currentDate = sdf.format(new Date());
			BroadSocket.sendMessage(key, "지금은 상담가능한 상담원이<br> 없습니다.,"+currentDate);
			return;
		}
		// json 구조로 status는 visit이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜)
		send("{\"status\":\"visit\", \"key\":\"" + key + "\"}");
	}

	// 일반 유저가 메시지를 보낼 때, 운영자 유저에게 알리는 함수
	public static void sendMessage(String key, String message) {
		if(admin.size()==0) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss/SSS");
			String currentDate = sdf.format(new Date());
			BroadSocket.sendMessage(key, "지금은 상담가능한 상담원이<br> 없습니다.,"+currentDate);
			return;
		}
		// json 구조로 status는 message이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜) message는 보내는 메시지이다.
		send("{\"status\":\"message\", \"key\":\"" + key + "\", \"message\":\"" + message + "\"}");
	}

	// 일반 유저가 접속을 끊을 때, 운영자 유저에게 알리는 함수
	public static void bye(String key) {
		// json 구조로 status는 bye이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜)
		send("{\"status\":\"bye\", \"key\":\"" + key + "\"}");
	}
	
	@OnError
	public void onError(Session session, Throwable thr, Session userSession) {
		System.out.println("소켓 에러, 갑자기 브라우저가 닫힐 경우 많이 발생");
		handleClose(userSession);
	}
}
