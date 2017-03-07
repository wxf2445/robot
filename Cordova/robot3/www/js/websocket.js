WEB_SOCKET_FORCE_FLASH=true;
WEB_SOCKET_SWF_LOCATION = "swf/WebSocketMain.swf";
var ws;

function websocket_init() {
	ws = new WebSocket("ws:"+websocket_path+"chat");
    
    ws.onopen = function() {
    	alert("open");
	};
    ws.onmessage = function(event) {
    	  if(event!=null){
    	  	//alert(event.data);
    	  	//console.log(event.data);
    		eval("var msg="+event.data+";");
    		//console.log(msg);
    		if(msg.status==null){
				var warn = msg.warning;
				console.log(warn);
				if(warn.status==1){
					$(".warn-div").css("background","#ff7575");
					var count = parseInt($(".openPopup font").html());
					count++;
					$(".panel-alert-count font").html(count);
					$(".openPopup").html("<i class=\"icon-attention-2\"></i>"+count);
					var li = 
						"<li class=\"warningDetail\">"+
				        "	<p style=\"white-space: normal !important;\">警报："+warn.content+"</p>"+
						"</li>"+
					$("#warning content ul").append(li);
			        
					var p = "<p class=\"warningDetail\" warningId=\""+warn.id+"\">警报："+warn.content+"</p>";
					$(".alert_p").append(p);
					$(".ui-bar-inherit h1.ui-title").html("共"+count+"条警报");
					//alert(msg.content);
				}else if(warn.status==2){
					var count = parseInt($(".openPopup font").html());
					count--;
					if(count==0){
						$(".warn-div").css("background","");
					}else{
						$(".warn-div").css("background","#ff7575");
					}
					$(".panel-alert-count font").html(count);
					$(".openPopup").html("<i class=\"icon-attention-2\"></i>"+count);
					var li = 
						"<li class=\"warningDetail\">"+
				        "	<p style=\"white-space: normal !important;\">警报："+warn.content+"</p>"+
						"</li>"+
					$("#warning content ul").append(li);
					$(".alert_p p[warningId="+warn.id+"]").remove();
					$(".ui-bar-inherit h1.ui-title").html("共"+count+"条警报");
				}else if(warn.status==3){
					var count = parseInt($(".openPopup font").html());
					count--;
					if(count==0){
						$(".warn-div").css("background","");
					}else{
						$(".warn-div").css("background","#ff7575");
					}
					$(".panel-alert-count font").html(count);
					$(".openPopup").html("<i class=\"icon-attention-2\"></i>"+count);
					var li = 
						"<li class=\"warningDetail\">"+
				        "	<p style=\"white-space: normal !important;\">警报："+warn.content+"</p>"+
						"</li>"+
					$("#warning content ul").append(li);
					$(".alert_p p[warningId="+warn.id+"]").remove();
					$(".ui-bar-inherit h1.ui-title").html("共"+count+"条警报");
				}
	    		
			}else if(msg.status==1){
				alert(msg.content);
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