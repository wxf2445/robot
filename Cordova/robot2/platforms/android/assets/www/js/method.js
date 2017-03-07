
//---------------------------------------------setup----设置---------------------------
function logout(){
	localStorage.clear();
	window.location.href="../../login.html";
}


jsPlumb.importDefaults({
            //控制是否有箭头
            ConnectionOverlays: [
            [ "Arrow", { location: 0.9 } ],
            [ "Label", {
                location: 0.1,
                id: "label",
                cssClass: "aLabel"
            }]
        ]
        });
    var exampleDropOptions = {
        hoverClass:"dropHover",
        activeClass:"dragActive"
    };

    var color1 = "#F00";
    var startpoint = {
      uuid:101,
        endpoint:["Dot", { radius:0.5 }],//连接点的形状、大小
        connector: "Straight",//线条形状，可弯曲
        dropOptions : exampleDropOptions
    };
    
    var endpoint = {
      uuid:1011,
        endpoint:["Dot", { radius:0.5 }],//连接点的形状、大小
        paintStyle:{ fillStyle:color1 },//连接点的颜色
        isSource:true,
        connectorStyle:{ strokeStyle:color1, lineWidth:2 },//点与点之间连线颜色
        connector: "Straight",//线条形状，可弯曲
        maxConnections:1,
        isTarget:true,
        dropOptions : exampleDropOptions,
        overlays: [
        "Arrow"
    ]
    };
    
function runJsPlumb(){
    
    jsPlumb.addEndpoint("now_position",{ anchor:"Center" },  startpoint);

    jsPlumb.addEndpoint("tar_position", { anchor:"Center" }, endpoint);
    
    //固定连线
    jsPlumb.connect({uuids:[101, 1011]});
    
}

function load (){  
    document.getElementById("map_div").addEventListener('touchstart',touch, false);  
    document.getElementById("map_div").addEventListener('touchmove',touch, false);  
    document.getElementById("map_div").addEventListener('touchend',touch, false);  
      
    function touch (event){  
        var event = event || window.event;  
          
        var oInp = document.getElementById("show_p");  
        
		var offset = $("#map_div").offset(); 
        switch(event.type){  
            /*case "touchstart":  
                oInp.innerHTML = "Touch started (" + clientX + "," + clientY + ")";  
                break;  */
            case "touchend":  
            	//$("#tar_position").animate({left:clientX+"px",right:clientY+"px"},10);
            	if($("#tar_position").css("display")!='none'){
	            	jsPlumb.detachEveryConnection();
	            	runJsPlumb();
	         	}
                break;  
            case "touchmove":  
                event.preventDefault(); 
            	if($("#tar_position").css("display")!='none'){
			  		var clientX = event.touches[0].clientX - offset.left - 20;
			  		var clientY = event.touches[0].clientY - offset.top - 20;
			  		var parent = $("#map_div");
					if(clientX<=-20)clientX = -20;
					if(clientX>=$(parent).width()-20)clientX =$(parent).width()-20;
					if(clientY<=-20)clientY = -20;
					if(clientY>=$(parent).height()-20)clientY = $(parent).height()-20;
	                $("#tar_position").stop().animate({left:clientX+"px",top:clientY+"px"},10);
	                //oInp.innerHTML = "<br/>Touch moved (" + clientX + "," + clientY + ")";  
                }
                break;  
        }  
          
    }  
}  
