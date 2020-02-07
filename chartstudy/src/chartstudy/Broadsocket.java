package chartstudy;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting") //웹 소켓의 서버클래스 지정
public class Broadsocket {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	@OnMessage //client에서 메세지 수신
	public void onMessage(String message,Session session) throws IOException {
		synchronized(clients) {
			for(Session client : clients) {
				//client가 나의 session인 경우. 메세지를 전송한 클라이언트
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
	}
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}
