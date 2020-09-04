package com.kh.DeVenue.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.kh.DeVenue.model.vo.Member;

// 고객측 전역 웹소켓 담당
//(관리자들이 회원에게 언제나 보낼 수 있도록 관리자가 단체 가능 메시지창 접속시 로그인된 회원들과 자동 연결)

// 아직은 일반 유저에서 서버간의 웹 소켓 url(채팅방 접속 전 기본 상태, 관리자 모두와 연결되어 있음)

// HttpSession을 사용하기 위해 session과 context를 반환하는 HttpSessionConfigurator클래스를 만들고 구성자로 설정
@ServerEndpoint(value = "/broadsocket", configurator = HttpSessionConfigurator.class)
public class BroadSocket {
	private HttpSession httpSession;
	private static Session userSession;
	private EndpointConfig config;
	private Member chatUser;
	
	// 유저와 서버간의 접속 리스트
//	private static List<User> sessionUsers = Collections.synchronizedList(new ArrayList<>());
	// 여기에 접속리스트를 담을까..?
	private Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<>());
	// 로그인한 유저 객체
	private static Member loginUser;

	// searchUser 함수의 filter 표현식을 위한 인터페이스
//	private interface SearchExpression {
//		// 람다식을 위한 함수
//		boolean expression(User user);
//	}

	// 서버와 유저간의 접속을 key로 구분하기 위한 인라인 클래스
//	private class User {
//		Session session;
//		String key;
//		Member loginUser;
//	}

	// Session으로 접속 리스트에서 User 클래스를 탐색
//	private static User getUser(Session session) {
//		return searchUser(x -> x.session == session);
//	}

	// Key로 접속 리스트에서 User 클래스를 탐색
//	private static User getUser(String key) {
//		return searchUser(x -> x.key.equals(key));
//	}

	// 접속 리스트 탐색 함수
//	private static User searchUser(SearchExpression func) {
//		Optional<User> op = sessionUsers.stream().filter(x -> func.expression(x)).findFirst();
//		// 결과가 있으면
//		if (op.isPresent()) {
//			// 결과를 리턴
//			return op.get();
//		}
//		// 없으면 null 처리
//		return null;
//	}

	// 유저간의 접속 리스트의 키를 취득하려고 할때.
//	public static String[] getUserKeys() {
//		// 반환할 String 배열을 선언한다.
//		String[] ret = new String[sessionUsers.size()];
//		// 유저 리스트를 반복문에 돌린다.
//		for (int i = 0; i < ret.length; i++) {
//			// 유저의 키만 반환 변수에 넣는다.
//			ret[i] = sessionUsers.get(i).key;
//		}
//		// 값 반환
//		return ret;
//	}


	// 운영자 client가 유저에게 메시지를 보내는 함수
	public static void sendMessage(String key, String message) {
		// key로 접속 리스트에서 User 클래스를 탐색
//		User user = getUser(key);
		// 접속 리스트에 User가 있으면(당연히 있다. 없으면 버그..)
//		if (user != null) {
			try {
				// 유저 Session으로 socket을 취득한 후 메시지를 전송한다.
				userSession.getBasicRemote().sendText(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
//		}
		
	}

	// 여기서부터 통신과 직접적인 연관있는 메소드 --------------------------------------------------
	// browser에서 웹 소켓으로 접속하면 호출되는 함수
	@OnOpen
	public void handleOpen(Session userSession, EndpointConfig config) {
		System.out.println("고객 접속됨 wsSession : " + userSession);
		System.out.println("웹소켓 서버측 config : " + config);
	   //Session:접속자마다 한개의 세션이 생성되어 데이터 통신수단으로 사용됨
        //한개의 브라우저에서 여러개의 탭을 사용해서 접속하면 Session은 서로 다르지만 HttpSession 은 동일함


		// EndpointConfig의 클래스를 위 맵에 넣는다.
		if (!configs.containsKey(userSession)) {
			// userSession 클래스는 connection이 될 때마다 인스턴스 생성되는 값이기 때문에 키로서 사용할 수 있다.
			configs.put(userSession, config);
		}
		BroadSocket.userSession = userSession;
		// 인라인 클래스 User를 생성
//		User user = new User();
		// Unique키를 발급 ('-'는 제거한다.)
//		user.key = UUID.randomUUID().toString().replace("-", "");
		// WebSocket의 세션
//		user.session = userSession;
		// 유저 리스트에 등록한다.
//		sessionUsers.add(user);
		// 운영자 Client에 유저가 접속한 것을 알린다.
		String key = String.valueOf(userSession);
		Admin.visit(key);

//		System.out.println(user.key);
	
//		System.out.println(user.session);
	}

	// browser에서 웹 소켓을 통해 메시지가 오면 호출되는 함수
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		System.out.println("클라이언트->관리자 메시지");
		// Session으로 접속 리스트에서 User 클래스를 탐색
//		User user = getUser(userSession);
		// 접속 리스트에 User가 있으면(당연히 있다. 없으면 버그..)
//		if (user != null) {
//			// 운영자 Client에 유저 key와 메시지를 보낸다.
//			Admin.sendMessage(user.key, message);
//		}
		// 위 맵으로 부터 userSession을 키로 EndpointConfig값을 가져온다.
		if (configs.containsKey(userSession)) {
			EndpointConfig config = configs.get(userSession);
			// HttpSessionConfigurator에서 설정한 session값을 가져온다.
			HttpSession session = (HttpSession) config.getUserProperties().get(HttpSessionConfigurator.Session);
			this.loginUser = (Member) session.getAttribute("loginUser");
//			user.loginUser = (Member) session.getAttribute("loginUser");
		}
	}


	// WebSocket이 종료가 되면, 종료 버튼이 없기 때문에 유저 브라우저가 닫히면 발생한다.
	@OnClose
	public void handleClose(Session userSession) {
		// 접속이 종료되면 map에서 EndpointConfig를 제거한다.
		if (configs.containsKey(userSession)) {
			configs.remove(userSession);
		}

		// Session으로 접속 리스트에서 User 클래스를 탐색
//		User user = getUser(userSession);
		// 접속 리스트에 User가 있으면(당연히 있다. 없으면 버그..)
//		if (user != null) {
			// 운영자 Client에 유저 key로 접속 종료를 알린다.
//			Admin.bye(user.key);
			// 위 유저 접속 리스트에서 유저를 삭제한다.
//			sessionUsers.remove(user);
//		}
	}
	
	@OnError
	public void onError(Session session, Throwable thr, Session userSession) {
		System.out.println("소켓 에러, 갑자기 브라우저가 닫힐 경우 많이 발생");
		handleClose(userSession);
	}

}