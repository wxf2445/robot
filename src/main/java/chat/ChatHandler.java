package chat;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;








import com.alibaba.fastjson.JSONObject;

public class ChatHandler extends TextWebSocketHandler {
    private static final Map<String,WebSocketSession> users;
    
    
	static {
	        users = new HashMap<String,WebSocketSession>();
	    }

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message)  throws Exception{
		String msg = message.getPayload();
		
		Message mess = (Message) JSONObject.parseObject(msg,Message.class);
		//java.sql.Timestamp dateTime = new java.sql.Timestamp((new Date()).getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = sdf.format(new Date());
		mess.setTime(time);
		
		broadCast(mess.getChartMessageToJson());

	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws SQLException, Exception{
		String web_id = session.getAttributes().get("userId").toString();
		//System.out.println(web_id);
			users.put(web_id, session);

	}
	public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws SQLException, Exception{
		/*String web_id = session.getAttributes().get("userId").toString();
		if(users.containsValue(session))
			users.remove(web_id);*/
	}
	
	//发送指定用户
	public void SendToUser(WebSocketSession session,String msg) throws IOException{
		session.sendMessage(new TextMessage(msg));
	}
	//广播
	public void broadCast(String msg) throws IOException{
		//System.out.println(users.size());
		for(WebSocketSession user:users.values()){
			user.sendMessage(new TextMessage(msg));
		}
	}
	public Map<String, WebSocketSession> getWebSocketSessions(){
		return this.users;
	}
	  
	public final static java.sql.Timestamp string2Time(String dateString) 
	  throws java.text.ParseException { 
		   DateFormat dateFormat; 
		  dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss.SSS", Locale.ENGLISH);//设定格式 
		  //dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss", Locale.ENGLISH); 
		  dateFormat.setLenient(false); 
		  java.util.Date timeDate = dateFormat.parse(dateString);//util类型 
		  java.sql.Timestamp dateTime = new java.sql.Timestamp(timeDate.getTime());//Timestamp类型,timeDate.getTime()返回一个long型 
		  return dateTime; 
	} 
	/** 
	  *method 将字符串类型的日期转换为一个Date（java.sql.Date） 
	   dateString 需要转换为Date的字符串 
	   dataTime Date 
	  */ 
	public final static java.sql.Date string2Date(String dateString) 
	  throws java.lang.Exception { 
		  DateFormat dateFormat; 
		  dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH); 
		  dateFormat.setLenient(false); 
		  java.util.Date timeDate = dateFormat.parse(dateString);//util类型 
		  java.sql.Date dateTime = new java.sql.Date(timeDate.getTime());//sql类型 
		  return dateTime; 
	} 
}
