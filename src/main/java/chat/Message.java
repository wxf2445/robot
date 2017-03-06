package chat;


import com.google.gson.Gson;

public class Message {
	private String to; //发给谁
	private String status; //名称
	private String description; //聊天内容
	private String content; //聊天内容
	private String time;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	private static Gson gson = new Gson();
	public Message(){
		
	}
	
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content =  content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getChartMessageToJson(){
		return gson.toJson(this);
	}
	
}
