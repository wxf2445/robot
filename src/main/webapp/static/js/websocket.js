WEB_SOCKET_FORCE_FLASH=true;
WEB_SOCKET_SWF_LOCATION = "swf/WebSocketMain.swf";
var ws;
var server_path = "http://127.0.0.1:8080/robot/";
var websocket_path = "//127.0.0.1:8080/robot/";
function websocket_init() {
	ws = new WebSocket("ws:"+websocket_path+"chat");
    
    ws.onopen = function() {
    	alert("open");
	};
    ws.onmessage = function(event) {
    	  if(event!=null){
    		eval("var msg="+event.data+";");
    		var warn = msg.warning;
    		//console.log(warn);
			if(warn.status==1){
				var size = parseInt($(".warning-body h3").attr("size"))+1;
				$(".count").html(size);
				$(".warning-body h3").html("你共收到"+size+"条警报");
				var new_warning = "<a href=\"${z:u('index/warning')}\" class=\"item\" warningId=\""+warn.id+"\">"+
										"<i class=\"icon-signin\"></i>警报："+warn.content+ 
			                            "<span class=\"time\"><i class=\"icon-time\"></i> 刚刚 </span>"+
			                            "<br>"+
			                      "</a>"	;
				$(".warning-body h3").after(new_warning);
				$(".warning-body h3").attr("size",size);
			}else if(warn.status==2){
				var size = parseInt($(".warning-body h3").attr("size"))-1;
				$(".count").html(size);
				$(".warning-body h3").html("你共收到"+size+"条警报");
				$(".warning-body .item[warningId="+warn.id+"]").remove();
				$(".warning-body h3").attr("size",size);
			}else if(warn.status==3){
				var size = parseInt($(".warning-body h3").attr("size"))-1;
				$(".count").html(size);
				$(".warning-body h3").html("你共收到"+size+"条警报");
				$(".warning-body .item[warningId="+warn.id+"]").remove();
				$(".warning-body h3").attr("size",size);
			}
    		
    	} 
    };
    ws.onclose = function() {
    	alert("close");
    };
    ws.onerror = function() {
    	alert("websocket is null");
	};
	
 } 
 
/*sendMessage = function(){ 
	if(ws!=null){
		var content = $$("#chat_text").html();
		$$("#chat_text").html("");
		var msgObj={
			content:content,
			to:chat_person_id,
			from:localStorage.getItem("user_id"),
			name:localStorage.getItem("name"),
			headImage:localStorage.getItem("headImage"),
			letterId:chat_letterId,
			type:0//单聊
		}
   	    
		var msg_json = JSON.stringify(msgObj);
		ws.send(msg_json);
		
	} else{
		//myApp.alert("websocket is null , please create a websocket");
	}
};*/
/*//点击事件-发送消息
$(document).ready(function(){
	$$("#chat_send_message").click(function(){
		sendChattingMessage();
	})
})*/
//时间格式转换
function timeCheck(timess){
	var times = timess.split(" ");
	var time = times[0].split("-");
	var curr_time = new Date();
	if(time[0]==curr_time.getFullYear()){
		if(time[1]==curr_time.getMonth()+1){
			if(time[2]==curr_time.getDate()){
				return times[1];
			}else{
				return time[1]+"-"+time[2]+" "+times[1];
			}
		}else{
			return time[1]+"-"+time[2]+" "+times[1];
		}
	}else{
		return timess;
	}
}


//震动和提示音
function vibrateAndSound(){
	navigator.vibrate(500);
	/*var sound = document.createElement("audio");
	sound.src="../../file/sound.mp3";
	sound.play();*/
	cordova.plugins.notification.local.cancel(1,
		function() {}
	);
	cordova.plugins.notification.local.schedule({
	    id: 1,
	    title: "Comm100",
	    text: "你新消息了"
	});
}