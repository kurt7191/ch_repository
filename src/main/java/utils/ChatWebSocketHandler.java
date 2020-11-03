package utils;

//import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
//import java.util.List;
import java.util.Map;
//import java.util.Map.Entry;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	// 접속한 클라이언트들의 Session을 저장 할 객체 생성
	Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	// 접속한 클라이언트 id 모은 text
	String connectList;
	// 클라이언트가 연결될 때 호출되는 메소드
	// 클라이언트를 Map에 저장
	public void afterConnectionEstablished(WebSocketSession session) {
		//System.out.println("session.getId() = "+session.getId());
		//System.out.println("session = "+session);
		//users.put(session.getId(), session);
		//super.afterConnectionEstablished(session);
        System.out.println("클라이언트 접속됨");
        
        Map<String, Object> map = session.getAttributes();
        String id = (String)map.get("userId");
        users.put(id, session);
        
        // 접속자 text로 저장
        connectList = "";
        Set key = users.keySet();     
        for (Iterator iterator = key.iterator(); iterator.hasNext();) {
                         String keyName = (String) iterator.next();  
                         connectList = connectList +"<span class=\""+keyName+"\">"+keyName+"</span><br>";
                        // System.out.println("keyName="+keyName);
        }
        System.out.println("connectList="+connectList);
	}

	// 클라이언트의 연결이 해제될 때 호출되는 메소드
	// Map에서 제거
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		System.out.println("연결해제 : "+session.getId());
		users.remove(session.getId());
	}
	
	// 클라이언트에서 메시지가 왔을 때 호출되는 메소드 
	// 메시지를 모든 클라이언트에게 전송 
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{ 
		// Map의 모든 Value를 가져오기 
		Collection<WebSocketSession> set = users.values();
		// 전송되어 온 메시지 
		String msg = message.getPayload();
		// 접속자 명단 text
		System.out.println("msg="+msg);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(msg);	 
		
		//TextMessage cl = new TextMessage(connectList); 
		//TextMessage cl = new TextMessage("{ what:'list', text:'"+connectList+"' }");

		// 웹소켓 접속자 리스트
		if(jsonObject.get("what").equals("list")) {
			JSONObject obj2 = new JSONObject();
			obj2.put("what", "list");
			obj2.put("text", connectList);
			TextMessage cl = new TextMessage(obj2.toJSONString()); 
			//TextMessage cl = new TextMessage("{ what:'list', text:'"+connectList+"' }");
			for(WebSocketSession user : set){ 
				user.sendMessage(cl); 
			}
		//매칭 보내기
		}else if(jsonObject.get("what").equals("match")) {
			//Collection<WebSocketSession> who = users.get(key))
			String c_id = (String) jsonObject.get("c_id");
			Map<String, Object> map = session.getAttributes();
			String userId = (String)map.get("userId");
			//초대 보내기
			JSONObject obj1 = new JSONObject();
			obj1.put("what", "match");
			obj1.put("homeUser", userId);
			obj1.put("c_id", c_id);
			TextMessage vs = new TextMessage(obj1.toJSONString()); 
			for(WebSocketSession user : set){ 
				if(users.get(jsonObject.get("awayId")).equals(user)) {
					user.sendMessage(vs); 
				}
				//System.out.println(tm);
				//user.sendMessage(vs); 
			}
		//대기방 채팅
		}else if(jsonObject.get("what").equals("message")){
			Map<String, Object> map = session.getAttributes();
			String userId = (String)map.get("userId");
			JSONObject obj = new JSONObject();
			obj.put("what", "chat");
			obj.put("text", userId+" : "+jsonObject.get("chat"));
			//TextMessage tm = new TextMessage("{ what:'chat', text:'"+userId+" : "+jsonObject.get("chat")+"' }");
			TextMessage tm = new TextMessage(obj.toJSONString());
			for(WebSocketSession user : set){ 
				System.out.println(tm);
				user.sendMessage(tm); 
			}
		}

		// 앞의 4글자를 제외한 부분을 가지고 메시지 만들기 앞 4글자로 종류를 줄수 있을거같은데..
		//TextMessage tm = new TextMessage(msg.substring(4)); 
		/*
		Map<String, Object> map = session.getAttributes();
		String userId = (String)map.get("userId");
		System.out.println("전송자 아이디:"+userId);
*/
		// set의 모든 구성 요소에 tm를 전송 
		/*for(WebSocketSession user : set){ 
			System.out.println(tm);
			user.sendMessage(tm); 
		}*/
	}
}
