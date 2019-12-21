package org.ddocdoc.chatting;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private String oneName;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		oneName = sessionList.get(0).getId();
		System.out.println("after¿¡¼­ : " + session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			if(session.getId().equals(oneName)){
				for(WebSocketSession sess : sessionList){
					sess.sendMessage(new TextMessage("ÀÇ»ç" + " : " + message.getPayload()));
					System.out.println(session.getId());
				}
				return;
			}else{
				for(WebSocketSession sess : sessionList){
					sess.sendMessage(new TextMessage("°í°´´Ô" + " : " + message.getPayload()));
					System.out.println(session.getId());
				}
			}
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
	
	
}
