<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://zlzkj.com/tags" prefix="z" %>


<!DOCTYPE html>
<html>
<head>
	<title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
<%--      <!-- bootstrap -->
    <link href="${__static__}/css/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="${__static__}/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet">

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/layout.css">
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/elements.css">
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/icons.css">

    <!-- libraries -->
    <link href="${__static__}/css/lib/font-awesome.css" type="text/css" rel="stylesheet" /> 
    
 --%>
    <!-- open sans font -->
    
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<style>
.map_mark{
	background:url(${__static__}/img/mark.png);background-size:100%;position:absolute;width:60px;height:60px;left:0px;top:0px;z-indez:10000;display:none
}
/*  #now_position{
	left:300px;top:200px;
} 
 #tar_position{
	left:400px;top:250px;
}  */
#map_div{
	margin:0 auto;background:url(${__static__}/img/map.png);height:450px;width:610px;background-size:100%;position:absolute
}
.map_div_div{
	height:450px;width:610px;float:left;
}
#set_tar_coordinate{
	display:none;
}
</style>
<body>

        
        <div id="pad-wrapper">
            <div class="row header">
                <div class="col-md-12">
                    <h3>操作机器人</h3>
                </div>                
            </div>

           <!-- gallery wrapper -->
            <div>
                <div>
                    <!-- single image -->
                    <div class="map_div_div">
                       	<div id="map_div">
                       		<div id="now_position" class="map_mark"></div> 
                       		<div id="tar_position" class="map_mark"></div>
                       	</div>
                    </div>
                    <div class="col-md-3" style="float:right;">
                    	 <label>当前坐标：</label>
                    	 <label class="form-control">(120.350666,30.316745)</label>
	                     <label>温度（℃）：</label>
	                     <label class="form-control">22</label>
	                     <label>PH值：</label>
	                     <label class="form-control">6.9</label>
	                     <label>溶氧量（mg/L）：</label>
	                     <label class="form-control">8.9</label>
	                     <br>
	                     <div id="set_tar_coordinate">
		                     <label>目的地坐标：</label>
		                     <label class="form-control">(120.350677,30.316765)</label>
	                   		 <div style="text-align:center;">
		                         <a class="btn-flat icon">
		                            <i class="icon-map-marker">前往目标地点</i>
		                         </a>
		                         <a class="btn-flat icon cancel_tar_btn" style="background:#F08080">
                            		取消设置
		                         </a>
	                       	 </div>
	                     </div>
                         <a class="btn-flat icon set_tar_btn">
                            <i class="icon-map-marker">设置目标地址</i>
                         </a>
                    </div>
                </div>
            </div>
        </div>
        </div>
	<!-- scripts -->
    <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/drawLine/jquery-ui-1.9.2.custom.js"></script>
    <script src="${__static__}/js/drawLine/jquery.jsPlumb-1.4.0-all.js"></script>
<%--      <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap.min.js"></script>
    <script src="${__static__}/js/jquery-ui-1.10.2.custom.min.js"></script>
    <!-- knob -->
    <script src="${__static__}/js/jquery.knob.js"></script> --%>
        <script type="text/javascript">

         function setNowPosition(x,y){
         	$("#now_position").css("left",x-30);
         	$("#now_position").css("top",y-30);
			$("#now_position").css("display","inline");
         	if($("#tar_position").css("display")!='none'){
            	runJsPlumb();
         	}
         }
         function setTarPosition(x,y){
         	$("#tar_position").css("left",x-30);
         	$("#tar_position").css("top",y-30);
			$("#tar_position").css("display","inline");
        	runJsPlumb();
         }
        $(function(){
        	setNowPosition(100,200);
        	//setTarPosition(300,300);
			$(".set_tar_btn").on("click",function(){
				$(this).hide();
				$("#set_tar_coordinate").show();
				setTarPosition(300,300);
			});
			$(".cancel_tar_btn").on("click",function(){
				$("#set_tar_coordinate").hide();
				$(".set_tar_btn").show();
				$("#tar_position").css("display","none");
	        	jsPlumb.detachEveryConnection();
			});
        });
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
        var exampleEndpoint1 = {
          uuid:101,
            endpoint:["Dot", { radius:0.5 }],//连接点的形状、大小
            connector: "Straight",//线条形状，可弯曲
            dropOptions : exampleDropOptions
        };
        
        var exampleEndpoint11 = {
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

            
            

            jsPlumb.addEndpoint("tar_position", { anchor:"Center" }, exampleEndpoint11);
            
            jsPlumb.addEndpoint("now_position",{ anchor:"Center" },  exampleEndpoint1);
            
            //固定连线
            jsPlumb.connect({uuids:[101, 1011]});
            
        }
		$("#tar_position").mousedown(function(e){ 
			var this_ = $(this);
			$(this).css("cursor","move"); 

			var offset = $(this).offset(); 
			var x = e.pageX - offset.left; 
			var y = e.pageY - offset.top; 
			$("#map_div").bind("mousemove",function(ev){ 
				$(this_).stop();//加上这个之后 
	
				var _x = ev.pageX - x - $(this_).parent().offset().left;//获得X轴方向移动的值 
				var _y = ev.pageY - y - $(this_).parent().offset().top;//获得Y轴方向移动的值
				if(_x<=-30)_x = -30;
				if(_x>=$(this_).parent().width()-30)_x =$(this_).parent().width()-30;
				if(_y<=-30)_y = -30;
				if(_y>=$(this_).parent().height()-30)_y = $(this_).parent().height()-30;
				//_x-=37;_y-=10;
				$(this_).animate({left:_x+"px",top:_y+"px"},10); 
			}); 

		}); 
		$("#map_div").mouseleave(function(e){ 
			var this_ =$("#tar_position");
			$(this_).css("cursor","default"); 
			$(this).unbind("mousemove"); 

         	if($(this_).css("display")!='none'){
            	jsPlumb.detachEveryConnection();
            	runJsPlumb();
         	}
		}); 
		$("#tar_position").mouseup(function(){ 
			$(this).css("cursor","default"); 
			$("#map_div").unbind("mousemove"); 
			
         	if($(this).css("display")!='none'){
            	jsPlumb.detachEveryConnection();
            	runJsPlumb();
         	}
		}) 
        </script>
</body>
</html>