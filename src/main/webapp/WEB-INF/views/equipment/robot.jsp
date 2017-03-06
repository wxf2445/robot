<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://zlzkj.com/tags" prefix="z" %>


<!DOCTYPE html>
<html>
<head>
	<title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
    <!-- bootstrap -->
    <link href="${__static__}/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${__static__}/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/layout.css">
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/elements.css">
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/icons.css">

    <link href="${__static__}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <!-- this page specific styles -->
    <link rel="stylesheet" href="${__static__}/css/compiled/index.css" type="text/css" media="screen" />

</head>
<style>

#map_div{
	background:url(${__static__}/img/map.png);background-size:100%;height:450px;width:610px;position:absolute;
}

.map_mark{
	background:url(${__static__}/img/mark.png);background-size:100%;position:absolute;width:60px;height:60px;left:0px;top:0px;z-indez:10000;
}
#mark0{
	background:url(${__static__}/img/mark0.png);background-size:100%;position:absolute;width:60px;height:60px;left:0px;top:0px;z-indez:10000;
}
.page-div{
	text-align:center;
}
</style> 
<body>

        <div id="pad-wrapper"  >
            <div class="row header">
                <h3>机器人</h3>
                
                    <a href="javascript:void(0)" class="btn-flat success pull-right addRobot">
                        <span>&#43;</span>
                        	添加机器人
                    </a>
                
            </div>


            <!-- Users table -->
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="col-md-3 sortable">
                                   	 机器人编号
                                </th>
                                <th class="col-md-2 sortable">
                                    <span class="line"></span>所属区域编号
                                </th>
                                <th class="col-md-3 sortable">
                                    <span class="line"></span>描述
                                </th>
                                <!-- <th class="col-md-2 sortable">
                                    <span class="line"></span>创建时间
                                </th> -->
                                <th class="col-md-3 sortable">
                                    <span class="line"></span>操作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <!-- <tr class="first">
                            <td>A-1-1</td>
                            <td>A-1</td>
                            <td>大明湖A区1号机器人</td>
                            <td>2016-11-19 19:12</td>
                            <td>
		                        <a class="btn-flat icon editRobot" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <a class="btn-flat icon checkRobot" title="轨道管理">
		                            <i class="icon-lemon"></i>
		                        </a>
		                        <button class="btn-danger btn" title="删除">
		                            <i class="icon-trash"></i>
		                        </button>
	                        </td>
                        </tr> -->
                        <!-- row -->
                        <!-- <tr>
                            <td>A-1-2</td>
                            <td>A-1</td>
                            <td>大明湖A区2号机器人</td>
                            <td>2016-11-19 20:43</td>
                            <td>
		                        <a class="btn-flat icon editRobot" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <a class="btn-flat icon checkRobot" title="轨道管理">
		                            <i class="icon-lemon"></i>
		                        </a>
		                        <button class="btn-danger btn" title="删除">
		                            <i class="icon-trash"></i>
		                        </button>
	                        </td>
                        </tr> -->
                        <!-- row -->
                        <!-- <tr>
                            <td>A-1-3</td>
                            <td>A-1</td>
                            <td>大明湖A区3号机器人</td>
                            <td>2016-11-19 21:37</td>
                            <td>
		                        <a class="btn-flat icon editRobot" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <a class="btn-flat icon checkRobot" title="轨道管理">
		                            <i class="icon-lemon"></i>
		                        </a>
		                        <button class="btn-danger btn" title="删除">
		                            <i class="icon-trash"></i>
		                        </button>
	                        </td>
                        </tr> -->
                        
                        </tbody>
                    </table>
                </div>                
            </div>
            <div class="page-div">
	            <ul class="pagination">
	                <!-- <li class="disabled"><a href="javasricpt:void(0)" title="上一页">&laquo;上一页</a></li>
	                <li class="active"><a href="javasricpt:void(0)">1</a></li>
	                <li class="disabled"><a href="javasricpt:void(0)" title="下一页">&raquo;下一页</a></li> -->
	            </ul>
            </div>
            <!-- end users table -->
        </div>
		
		 <!-- Modal -->
    <div class="modal fade" id="addRobotModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">添加机器人</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">所属区域:</label>
                        <div class="col-lg-10">
                            <select class="form-control" id="areaOptions">
                            	<option value="1">A-1</option>
                            	<option value="2">A-2</option>
                            	<option value="3">A-3</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">编号:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="add_no">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">描述:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="add_description">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">机器人IP:</label>
                        <div class="col-lg-6">
                          <input type="text" class="form-control" readonly id="add_robotIp">
                        </div>
                        <div class="col-lg-2">
                          <input type="button" class="btn btn-info check" value="监测">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary saveArea">保存</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
<!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">设置机器人移动轨道</h4>
            </div>
            <div class="modal-body">
              	<div id="map_div"><!-- 
              		<div class="map_mark"></div>
              		<div class="map_mark"></div> -->
              	</div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger cleanPoint">清除轨道点</button>
              <button type="button" class="btn btn-success addPoint">添加轨道点</button>
              <button type="button" class="btn btn-primary">保存</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->



    <!-- Modal -->
    <div class="modal fade" id="editRobotModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">编辑机器人</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">所属区域:</label>
                        <div class="col-lg-10">
                            <select class="form-control" id="areaOptions">
                            	<option value="1">A-1</option>
                            	<option value="2">A-2</option>
                            	<option value="3">A-3</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">编号:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="robotNo" placeholder="A-1-1" value="A-1-1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">描述:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="description" placeholder="大明湖A区" value="大明湖A区">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">机器人IP:</label>
                        <div class="col-lg-6">
                          <input type="text" class="form-control" readonly id="robotIp">
                        </div>
                        <div class="col-lg-2">
                          <input type="button" class="btn btn-info check" value="监测">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">保存</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
	<!-- scripts -->
     <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap.min.js"></script>
    <script src="${__static__}/js/bootstrap-datetimepicker.js"></script>

    <script type="text/javascript">

  	$(document).on('click','.addRobot',function(){
  		$.post("${z:u('robot/getarea')}",{},function(result){
    		if(result.status!='-1'){
    			$.each(result.data.areas,function(index,content){
    				areaOptions+="<option value='"+content.id+"'>"+content.areaNo+"</option>";
    			});
    			$("#areaOptions").html(areaOptions);
    			$("#addRobotModal").modal('show');
    		}else{
    			myAlert(result.info);
    		}
    	},"json"); 

  	});
	var setstop = true;
	function checkTimeOut(index){
  		var check = "监测中";
  		for(var i=0;i<index;i++)check+=".";
  		$('.check').val(check);
		if(index==3)index=0;
		else index++;
		if(!setstop)
			setTimeout("checkTimeOut("+index+")",500);
		else{
			$('.check').val('监测');
		}
	}
	
  	$(document).on("click",".check",function(){

  		$.post("${z:u('robot/check')}",{},function(result){
    		if(result.status!='-1'){
    			//$("#add_robotIp")val(result.data);
    			//myAlert("添加成功");
    		}else{
    			//myAlert(result.info);
    		}
    	},"json"); 
  		
  		if(setstop){
  			setstop = false;
  	  		setTimeout("checkTimeOut(1)",500);
  		}else{
  			setstop = true;
  		}
  	})
  	$(document).on('click','.saveArea',function(){
  		$.post("${z:u('robot/add')}",{areaId:$("#areaOptions").val(),no:$("#add_no").val(),description:$("#add_description").val(),robotIp:$("#robotIp").val()},function(result){
    		if(result.status!='-1'){
    			$("#addRobotModal").modal('hide');
    			myAlert("添加成功");
    		}else{
    			myAlert(result.info);
    		}
    	},"json"); 
  	});
  	function getRobot(pagenum){
	 	$.post("${z:u('robot/getrobot')}",{page:pagenum},function(result){
	 		$(".table tbody").children("tr").remove();
			if(result.status!='-1'){
      		    var items = result.data.datas.page.items;
      		    if(items.length==0)
      		    	$(".table tbody").append("<tr><td colspan='4' style=\"text-align:center\">暂无数据</td></tr>");
	      		$.each(items,function(index,content){
	        		    var tr = "<tr>"+
                            "<td>"+content.robotNo+"</td>"+
                            "<td>"+content.areaNo+"</td>"+
                            "<td>"+content.description+"</td>"+
                            "<td>"+
		                    "    <a class=\"btn-flat icon editRobot\" title=\"编辑\" robotId=\""+content.id+"\">"+
		                    "        <i class=\"icon-edit\"></i>"+
		                    "    </a>"+
		                    "    <a class=\"btn-flat icon checkRobot\" title=\"轨道管理\" areaId=\""+content.areaId+"\">"+
		                    "        <i class=\"icon-check\"></i>"+
		                    "    </a>"+
		                    "    <button class=\"btn-danger btn deleteRobot\" title=\"删除\" robotId=\""+content.id+"\">"+
		                    "        <i class=\"icon-trash\"></i>"+
		                    "    </button>"+
	                        "</td></tr>";
	          		  $(".table tbody").append(tr);
	    		});
        		var logPage = "";/* <ul class=\"pagination\" > */
                var page = result.data.datas.showPages;
                if (pagenum == 1)
                    logPage += "<li class=\"disabled\"><a>&laquo;</a></li>";
                else
                    logPage += "<li> <a onclick=\"getArea(" + (pagenum - 1) + ")\"><span>&laquo;</span></a> </li>";
                //alert(logs.showPages);
                $.each(page, function (index, content) {
                    if (content == pagenum) {
                        logPage += "<li class=\"active disabled\"><a>" + content + "</a></li>";
                    } else if (content == 0) {
                        logPage += "<li><a>...</a></li>";
                    } else {
                        logPage += "<li><a onclick=\"getArea(" + content + ")\"><span>" + content + "</span></a> </li>";
                    }
                });
                if (pagenum == result.data.datas.page.totalPage)
                    logPage += "<li class=\"disabled\"><a>&raquo;</a></li>";
                else
                    logPage += "<li> <a onclick=\"getArea(" + (pagenum + 1) + ")\" ><span>&raquo;</span></a></li>";
                //logPage += "</ul>";	
                $(".pagination").html(logPage);
			}else{
				myAlert(result.info);
			}
		},"json"); 
  	}
    
 // custom uiDropdown element, example can be seen in user-list.html on the 'Filter users' button
	var uiDropdown = new function() {
  	var self;
  	self = this;
  	this.hideDialog = function($el) {
    		return $el.find(".dialog").hide().removeClass("is-visible");
  	};
  	this.showDialog = function($el) {
    		return $el.find(".dialog").show().addClass("is-visible");
  	};
		return this.initialize = function() {
  		$("html").click(function() {
    		$(".ui-dropdown .head").removeClass("active");
      		return self.hideDialog($(".ui-dropdown"));
    		});
    		$(".ui-dropdown .body").click(function(e) {
      		return e.stopPropagation();
    		});
    		return $(".ui-dropdown").each(function(index, el) {
      		return $(el).click(function(e) {
      			e.stopPropagation();
      			$(el).find(".head").toggleClass("active");
      			if ($(el).find(".head").hasClass("active")) {
        			return self.showDialog($(el));
      			} else {
        			return self.hideDialog($(el));
      			}
      		});
    		});
    	};
  	};

  	new uiDropdown();
  	</script>
    <script src="${__static__}/js/drawLine/jquery-ui-1.9.2.custom.js"></script>
    <script src="${__static__}/js/drawLine/jquery.jsPlumb-1.4.0-all.js"></script>
  	<script type="text/javascript">

$(document).on("click",".checkRobot",function(){
  		
  		var html = "<div id=\"map_div\"></div>";
  		$("#myModal .modal-body").html(html);
  		var areaId = $(this).attr("areaId");
  		$.post("${z:u('area/getmap')}",{id:areaId},function(result){
  			$(".saveMap").attr("areaId",areaId);
  			/* $(".changeMap").attr("areaId",$(this).attr("areaId"));
  			alert($(".changeMap").attr("areaId")); */
      		$(".changeMap").show();
      		$(".saveMap").hide();
    		if(result.status!='-1'){
    			if(result.data!=null){
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
    							$("#map_div").css("background","url(${z:u('file/openfile')}?filepath="+result.data+")");
    							//alert($("#map_div").css("background"));
    							$("#map_div").css("height",image_height);
    							$("#map_div").css("width",image_width);
    							$("#map_div").css("left",(610-image_width)/2);
        					}else{
        						image_scare = 610/image_width;
        						image_width = 610;
        						image_height = image_height*image_scare;
    							$("#map_div").css("background","url(${z:u('file/openfile')}?filepath="+result.data+")");
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
    							$("#map_div").css("background","url(${z:u('file/openfile')}?filepath="+result.data+")");
    							$("#map_div").css("background-size","100%");
    							$("#map_div").css("height",image_height);
    							$("#map_div").css("width",image_width);
    							$("#map_div").css("left",(610-image_width)/2);
        					}else{
        						image_scare = 450/image_height;
        						image_height = 450;
        						image_width = image_width*image_scare;
    							$("#map_div").css("background","url(${z:u('file/openfile')}?filepath="+result.data+")");
    							$("#map_div").css("background-size","100%");
    							$("#map_div").css("height",image_height);
    							$("#map_div").css("width",image_width);
    							$("#map_div").css("left",(610-image_width)/2);
        					}
    					}
    				}
    				image.src = "${z:u('file/openfile')}?filepath="+result.data;
    			}else{
    				
    			}
    		}else{
    			myAlert(result.info);
    		}
    	},"json"); 
  		$("#myModal").modal('show').find('.modal-dialog').width(655).find('.modal-body').height(450);
  	});
$(document).on("click",".editRobot",function(){
		
		var robotId = $(this).attr("robotId");
		$.post("${z:u('robot/getrobotinfo')}",{id:robotId},function(result){
			if(result.status!='-1'){
				var areaOptions = "";
				var data = result.data;
				$.each(data.areas,function(index,content){
					if(content.id==data.areaId)
						areaOptions+="<option value='"+content.id+"' selected>"+content.areaNo+"</option>";
					else
						areaOptions+="<option value='"+content.id+"'>"+content.areaNo+"</option>";
				});
				$("#areaOptions").html(areaOptions);
				$("#robotNo").val(data.robotNo);
				$("#robotNo").attr("placeholder",data.robotNo);
				$("#robotIp").val(data.robotIp);
				$("#robotIp").attr("placeholder",data.robotIp);
				$("#description").val(data.description);
				$("#description").attr("placeholder",data.description);
      			$("#editRobotModal").modal('show');
			}else{
				myAlert(result.info);
			}
		},"json"); 
		//$("#myModal").modal('show').find('.modal-dialog').width(655).find('.modal-body').height(450);
	});
    $(function(){
    	$('#editRobotModal').on('hide.bs.modal', function () {setstop=true;});
    	$('#addRobotModal').on('hide.bs.modal', function () {setstop=true;});
    	
    	getRobot(1);
      	/* $(".checkRobot").on("click",function(){
      		$("#myModal").modal('show').find('.modal-dialog').width(655).find('.modal-body').height(450);
      	}); */
      	/* $(".editRobot").on("click",function(){
      		$("#editRobotModal").modal('show');
      	}); */
      	$(".addPoint").on("click",function(){
      		var count = $("#map_div .map_mark").length;
      		var left = ($("#map_div").width()*2)/(count+3);
      		var top = $("#map_div").height()/(count+2);
      		$("#map_div").append("<div class=\"map_mark\" id=\"mark"+count+"\" style=\"left:"+left+"px;top:"+top+"px\" ></div>");
        	$(".addPoint").off("click");
      		addMoveFunction(count);
      		setTimeout("addPoint()",149);
      	});
      	$(".cleanPoint").on("click",function(){
        	jsPlumb.detachEveryConnection();
        	$(".map_mark").remove();
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
    var startEndpoint = {
      uuid:101,
        endpoint:["Dot", { radius:0.5 }],//连接点的形状、大小
        connector: "Straight",//线条形状，可弯曲
        dropOptions : exampleDropOptions
    };
    
    var endEndpoint = {
      uuid:1011,
        endpoint:["Dot", { radius:0.5 }],//连接点的形状、大小
        paintStyle:{ fillStyle:color1 },//连接点的颜色
        connectorStyle:{ strokeStyle:color1, lineWidth:2 },//点与点之间连线颜色
        connector: "Straight",//线条形状，可弯曲
        dropOptions : exampleDropOptions
    };
    var e1 = new Array();
    function addPoint(){
    	//jsPlumb.detachEveryConnection();
		var marks = $(".map_mark");
/* 		for(var i=0;i<marks.length-1;i++){
	        jsPlumb.addEndpoint("mark"+i,{ anchor:"Center" },  startEndpoint);
	        
	        jsPlumb.addEndpoint("mark"+(i+1), { anchor:"Center" }, endEndpoint);
	        //固定连线
	        jsPlumb.connect({uuids:[101, 1011]});
		} */
		
		if(marks.length>2){
			if(marks.length>3)
				jsPlumb.deleteEndpoint(e1[marks.length-2]);
			/* 
			jsPlumb.addEndpoint("mark"+(marks.length-1),{ anchor:"Center" },  startEndpoint);
			
			
	        jsPlumb.addEndpoint("mark"+0, { anchor:"Center" }, endEndpoint);
	        //固定连线
	        jsPlumb.connect({uuids:[101, 1011]}); */
	        
	        
			jsPlumb.addEndpoint("mark"+(marks.length-2),{ anchor:"Center" },  startEndpoint);
	        
	        jsPlumb.addEndpoint("mark"+(marks.length-1), { anchor:"Center" }, endEndpoint);
	        
	        jsPlumb.connect({uuids:[101, 1011]});
	        
	        
	        e1[marks.length-1] = jsPlumb.addEndpoint("mark"+(marks.length-1),{ anchor:"Center" },  startEndpoint);
	        
	        jsPlumb.addEndpoint("mark"+0, { anchor:"Center" }, endEndpoint);
	        
	        jsPlumb.connect({uuids:[101, 1011]});
	        
		}else if(marks.length==2){
			e1[0] = jsPlumb.addEndpoint("mark"+0,{ anchor:"Center" },  startEndpoint);
	        
	        jsPlumb.addEndpoint("mark"+1, { anchor:"Center" }, endEndpoint);
	        
	        jsPlumb.connect({uuids:[101, 1011]});
		}

      	$(".addPoint").on("click",function(){
      		var count = $("#map_div .map_mark").length;
      		var left = ($("#map_div").width()*2)/(count+3);
      		var top = $("#map_div").height()/(count+2);
      		$("#map_div").append("<div class=\"map_mark\" id=\"mark"+count+"\" style=\"left:"+left+"px;top:"+top+"px\" ></div>");
      		$(".addPoint").off("click");
      		addMoveFunction(count);
      		setTimeout("addPoint()",149);
      	});
    }

	var mark_id_down = false;
	var move_count = 0;
	function runJsPlumb(){
    	//jsPlumb.detachEveryConnection();
		var length = $(".map_mark").length;
		if(move_count!=0&&move_count!=(length-1)){
			jsPlumb.deleteEndpoint(e1[move_count-1]);
			
			jsPlumb.deleteEndpoint(e1[move_count]);
			
			e1[move_count-1] = jsPlumb.addEndpoint("mark"+(move_count-1),{ anchor:"Center" },  startEndpoint);
			
	        jsPlumb.addEndpoint("mark"+move_count, { anchor:"Center" }, endEndpoint);
	        
	        jsPlumb.connect({uuids:[101, 1011]});

	        e1[move_count] = jsPlumb.addEndpoint("mark"+move_count,{ anchor:"Center" },  startEndpoint);
	        
	        jsPlumb.addEndpoint("mark"+(move_count+1), { anchor:"Center" }, endEndpoint);
	        
	        jsPlumb.connect({uuids:[101, 1011]});
		}else if(move_count==0){
			jsPlumb.deleteEndpoint(e1[0]);
			
			jsPlumb.deleteEndpoint(e1[length-1]);
			
			e1[0] = jsPlumb.addEndpoint("mark"+0,{ anchor:"Center" },  startEndpoint);
			
	        jsPlumb.addEndpoint("mark"+1, { anchor:"Center" }, endEndpoint);
	        
	        jsPlumb.connect({uuids:[101, 1011]});

	        e1[length-1] = jsPlumb.addEndpoint("mark"+(length-1),{ anchor:"Center" },  startEndpoint);
	        
	        jsPlumb.addEndpoint("mark"+0, { anchor:"Center" }, endEndpoint);
	        
	        jsPlumb.connect({uuids:[101, 1011]});
		}else if(move_count==(length-1)){
			jsPlumb.deleteEndpoint(e1[length-2]);
			
			jsPlumb.deleteEndpoint(e1[length-1]);
			
			e1[length-2] = jsPlumb.addEndpoint("mark"+(length-2),{ anchor:"Center" },  startEndpoint);
			
	        jsPlumb.addEndpoint("mark"+(length-1), { anchor:"Center" }, endEndpoint);
	        
	        jsPlumb.connect({uuids:[101, 1011]});

	        e1[length-1] = jsPlumb.addEndpoint("mark"+(length-1),{ anchor:"Center" },  startEndpoint);
	        
	        jsPlumb.addEndpoint("mark"+0, { anchor:"Center" }, endEndpoint);
	        
	        jsPlumb.connect({uuids:[101, 1011]});
		}
			

    }
	function addMoveFunction(count){
		$("#mark"+count).mousedown(function(e){ 
			var this_ = $(this);
			$(this).css("cursor","move"); 
			mark_id_down = true;
			move_count = count;
			var offset = $(this).offset(); 
			var x = e.pageX - offset.left; 
			var y = e.pageY - offset.top; 
			$("#map_div").bind("mousemove",function(ev){ 
				$(this_).stop();//加上这个之后 
				if(mark_id_down){
					var _x = ev.pageX - x - $(this_).parent().offset().left;//获得X轴方向移动的值 
					var _y = ev.pageY - y - $(this_).parent().offset().top;//获得Y轴方向移动的值
					
					if(_x<=-30)_x = -30;
					if(_x>=$(this_).parent().width()-30)_x =$(this_).parent().width()-30;
					if(_y<=-30)_y = -30;
					if(_y>=$(this_).parent().height()-30)_y = $(this_).parent().height()-30;
					//_x-=37;_y-=10;
					$(this_).animate({left:_x+"px",top:_y+"px"},10); 
				}
			}); 
	
		}); 
		$("#map_div").mouseleave(function(e){
			if(mark_id_down){
	        	runJsPlumb();
			}
        	mark_id_down = false;
			$("#map_div").unbind("mousemove"); 
		}); 
		$("#mark"+count).mouseup(function(){ 
			if(mark_id_down){
	        	runJsPlumb();
				$(this).css("cursor","default"); 
			}
        	mark_id_down = false;
			$("#map_div").unbind("mousemove"); 
		}) 
	}
	
    </script>

</body>
</html>