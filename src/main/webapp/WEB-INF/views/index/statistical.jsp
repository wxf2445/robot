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

    <link href="${__static__}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <!-- open sans font -->
    
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<style>
.spot{
	background:url(${__static__}/img/bgs/spot.png);background-size:100%;position:absolute;width:10px;height:10px
}
</style>
<body>

        
        <div id="pad-wrapper">
            <div class="row header">
                <div class="col-md-16">
                    <h1>警报点统计:</h1>
                    <br>
                    <br>
                    <br>
                    <br>
                    <h3>设置时间范围:</h3>
                    <br><br>
	                <div style="width:800px">
	                  	<div class="col-md-3"><input class="form-control input-datepicker" name="start_time" id="start_time" value=""></div>
	                   	<div class="col-md-3"><input class="form-control input-datepicker" name="end_time" id="end_time"></div>
	                   	<div class="col-md-2">	
		                   	<select class="form-control typeChoose">
		                   		<option value="ph">PH值</option>
		                   		<option value="o2">溶氧量</option>
		                   		<option value="temp">温度</option>
		                   	</select>
	                   	</div>
	                   
	                    <a class="btn-flat search">搜索</a>
	                </div>
                </div>                
            </div>

           <!-- gallery wrapper -->
            <div>
                <div>
                    <!-- single image -->
                    <div class="map_div_div">
                       	<div id="map_div">
                       		<!-- <div class="spot" style="left:192px;top:150px"></div>
                       		<div class="spot" style="left:180px;top:162px"></div>
                       		<div class="spot" style="left:180px;top:171px"></div>
                       		<div class="spot" style="left:204px;top:173px"></div>
                       		<div class="spot" style="left:202px;top:164px"></div>
                       		<div class="spot" style="left:196px;top:154px"></div>
                       		<div class="spot" style="left:300px;top:400px"></div>
                       		<div class="spot" style="left:280px;top:390px"></div>
                       		<div class="spot" style="left:500px;top:320px"></div> -->
                       	</div>
                    </div>
            </div>
        </div>
        </div>
	<!-- scripts -->
    <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap-datetimepicker.js"></script>
<%--      <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap.min.js"></script>
    <script src="${__static__}/js/jquery-ui-1.10.2.custom.min.js"></script>
    <!-- knob -->
    <script src="${__static__}/js/jquery.knob.js"></script> --%>
        <script type="text/javascript">

        function getLatLng(coordinate){
        	coordinate = coordinate.replace("(","").replace(")","").split(",");
        	return {lng:coordinate[0],lat:coordinate[1]};
        }
      		
		 $(function(){
			 $.post("${z:u('warning/getmapbysession')}",{},function(result){
	        		if(result!=null){
	        			if(result.mapImage!=null){
	        				var image = new Image();
	        				var image_width = 0,image_height = 0,image_scare = 1;
	        				image.onload = function(){
	        					image_width = image.width;
	        					image_height = image.height;
	        					if(image_width/image_height>610/450){
	            					if(image_width>610){
	            						image_scare = image_width/610;
	            						image_width = 610;
	            						image_height = image_height*image_scare;
	        							$("#map_div").css("background","url(${z:u('file/openfile')}?filepath="+result.mapImage+")");
	        							//alert($("#map_div").css("background"));
	        							$("#map_div").css("height",image_height);
	        							$("#map_div").css("width",image_width);
	        							$("#map_div").css("left",(610-image_width)/2);
	            					}else{
	            						image_scare = 610/image_width;
	            						image_width = 610;
	            						image_height = image_height*image_scare;
	        							$("#map_div").css("background","url(${z:u('file/openfile')}?filepath="+result.mapImage+")");
	        							$("#map_div").css("background-size","100%");
	        							$("#map_div").css("height",image_height);
	        							$("#map_div").css("width",image_width);
	        							$("#map_div").css("left",(610-image_width)/2);
	            					}
	        					}else{
	            					if(image_height>450){
	            						image_scare = image_height/450;
	            						image_height = 450;
	            						image_width = image_width*image_scare;
	        							$("#map_div").css("background","url(${z:u('file/openfile')}?filepath="+result.mapImage+")");
	        							$("#map_div").css("background-size","100%");
	        							$("#map_div").css("height",image_height);
	        							$("#map_div").css("width",image_width);
	        							$("#map_div").css("left",(610-image_width)/2);
	            					}else{
	            						image_scare = 450/image_height;
	            						image_height = 450;
	            						image_width = image_width*image_scare;
	        							$("#map_div").css("background","url(${z:u('file/openfile')}?filepath="+result.mapImage+")");
	        							$("#map_div").css("background-size","100%");
	        							$("#map_div").css("height",image_height);
	        							$("#map_div").css("width",image_width);
	        							$("#map_div").css("left",(610-image_width)/2);
	            					}
	        					}
	        					var lefttop = getLatLng(result.LT_coordinate);
	        					var rightbottom = getLatLng(result.RB_coordinate);
	    	    				$.post("${z:u('warning/getwarningpoint')}",
	    	    						{type:"ph",start:'',end:''},function(result){
	    	    					if(result!=null){
	    	    						$.each(result,function(index,content){
		    	        					var position = getLatLng(content.coordinate);
		    	        					var map_mark = "<div class=\"spot\" style=\"left:"+(position.lng-lefttop.lng)/(rightbottom.lng-lefttop.lng)*image_width
		    	        									+"px;top:"+(position.lat-lefttop.lat)/(rightbottom.lat-lefttop.lat)*image_height+"px\"></div>";
		    	        					$("#map_div").append(map_mark);
	    	    						});
	    	    					}
	    	    				},"json"); 
	    	    				$(".typeChoose").on("change",function(){
	    	    					var start = $("#start_time").val();
	    	    					var end = $("#end_time").val();
		    	    				$.post("${z:u('warning/getwarningpoint')}",
		    	    						{type:$(this).val(),start:start,end:end},function(result){
		    	    					if(result!=null){
		    	    						$("#map_div .spot").remove();
		    	    						$.each(result,function(index,content){
			    	        					var position = getLatLng(content.coordinate);
			    	        					var map_mark = "<div class=\"spot\" style=\"left:"+(position.lng-lefttop.lng)/(rightbottom.lng-lefttop.lng)*image_width
			    	        									+"px;top:"+(position.lat-lefttop.lat)/(rightbottom.lat-lefttop.lat)*image_height+"px\"></div>";
			    	        					$("#map_div").append(map_mark);
		    	    						});
		    	    					}
		    	    				},"json"); 
	    	    				});
	    	    				$(".search").on("click",function(){
	    	    					var start = $("#start_time").val();
	    	    					var end = $("#end_time").val();
		    	    				$.post("${z:u('warning/getwarningpoint')}",
		    	    						{type:$(".typeChoose").val(),start:start,end:end},function(result){
		    	    					if(result!=null){
		    	    						$("#map_div .spot").remove();
		    	    						$.each(result,function(index,content){
			    	        					var position = getLatLng(content.coordinate);
			    	        					var map_mark = "<div class=\"spot\" style=\"left:"+(position.lng-lefttop.lng)/(rightbottom.lng-lefttop.lng)*image_width
			    	        									+"px;top:"+(position.lat-lefttop.lat)/(rightbottom.lat-lefttop.lat)*image_height+"px\"></div>";
			    	        					$("#map_div").append(map_mark);
		    	    						});
		    	    					}
		    	    				},"json"); 
	    	    				});
	        				};
	        				image.src = "${z:u('file/openfile')}?filepath="+result.mapImage;
	        			}else{
	        				
	        			}

	        		}else{
	        			myAlert(result.info);
	        		}
	        	},"json"); 
		 })
         function setNowPosition(x,y){
         	$("#now_position").css("left",x-30);
         	$("#now_position").css("top",y-30);
			$("#now_position").css("display","inline");
         }
        $(function(){
          	$.fn.datetimepicker.dates['zh-CN'] = {  
                    days:       ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六","星期日"],  
                    daysShort:  ["日", "一", "二", "三", "四", "五", "六","日"],  
                    daysMin:    ["日", "一", "二", "三", "四", "五", "六","日"],  
                    months:     ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月","十二月"],  
                    monthsShort:  ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],  
                    meridiem:    ["上午", "下午"],  
                    //suffix:      ["st", "nd", "rd", "th"],  
                    today:       "今天"  
            };    

        	$('.input-datepicker').datetimepicker({
                language:  'zh-CN',
                weekStart: 1,
                todayBtn:  1,
        		autoclose: 1,
        		todayHighlight: 1,
        		startView: 2,
        		forceParse: 0,
                showMeridian: 1,
                format: 'yyyy-mm-dd hh:ii'///
            });
        });
        
        </script>
</body>
</html>