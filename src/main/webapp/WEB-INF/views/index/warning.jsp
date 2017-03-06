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
	background:url(${__static__}/img/map.png);background-size:100%;height:450px;width:610px;
}

.page-div{
	text-align:center;
}
</style> 
<body>

        <div id="pad-wrapper"  >
            <div class="row header">
                <h3>警报列表</h3>
                <div>
                    <br><br>
                   	<div class="col-md-1">
                    	<h4>状态：</h4>
                    </div>
                  	<!-- <div class="col-md-3">
                  		<select class="form-control areaChoose">
                  			<option>全部区域</option>
                  			<option>A-1</option>
                  			<option>A-2</option>
                  		</select>
                  	</div>
                   	<div class="col-md-3">
                  		<select class="form-control robotChoose">
                  			<option>全部机器人</option>
                  			<option>A-1-1</option>
                  			<option>A-1-2</option>
                  			<option>A-1-3</option>
                  		</select>
                  	</div> -->
                   	<div class="col-md-3">
                  		<select class="form-control statusChoose">
                  			<option value="0">全部</option>
                  			<option value="1">警报中</option>
                  			<option value="2">处理中</option>
                  			<option value="3">已处理</option>
                  		</select>
                  	</div>
                </div>
            </div>

            <!-- Users table -->
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="col-md-4 sortable">
                                    <span class="line"></span>警报内容
                                </th>
                                <th class="col-md-1 sortable">
                                    <span class="line"></span>状态
                                </th>
                                <th class="col-md-2 sortable">
                                    <span class="line"></span>备注
                                </th>
                                <th class="col-md-2 sortable">
                                    <span class="line"></span>警报时间
                                </th>
                                <th class="col-md-3 sortable">
                                    <span class="line"></span>操作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <!-- <tr class="first">
                            <td>A-1区域坐标点(120.350666,30.316745)数据(溶氧量:6.9（mg/L）)过低。</td>
                            <td><span class="label label-danger">警报中</span></td>
                            <td></td>
                            <td>2016-11-19 19:12</td>
                            <td>
		                        <a class="btn-flat icon editArea" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <a class="btn-flat icon checkArea" title="查看地图详情">
		                            <i class="icon-check"></i>
		                        </a>
		                        <button class="btn-warning btn" title="前往处理">
		                            <i class="icon-wrench"></i>
		                        </button>
		                        <button class="btn-success btn" title="已处理">
		                            <i class="icon-ok"></i>
		                        </button>
	                        </td>
                        </tr>
                        row
                        <tr>
                            <td>A-1区域坐标点(120.350667,30.316748)数据(溶氧量:6.9（mg/L）)过低。</td>
                            <td><span class="label label-warning">处理中</span></td>
                            <td>工作人员（小王）正在处理。</td>
                            <td>2016-11-19 20:43</td>
                            <td>
		                        <a class="btn-flat icon editArea" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <a class="btn-flat icon checkArea" title="查看地图详情">
		                            <i class="icon-check"></i>
		                        </a>
		                        <button class="btn-danger btn" title="重新警报">
		                            <i class="icon-warning-sign"></i>
		                        </button>
		                        <button class="btn-success btn" title="已处理">
		                            <i class="icon-ok"></i>
		                        </button>
	                        </td>
                        </tr>
                        
                        <tr>
                            <td>A-1区域坐标点(120.350667,30.316748)数据(溶氧量:6.9（mg/L）)过低。</td>
                            <td><span class="label label-danger">警报中</span></td>
                            <td></td>
                            <td>2016-11-19 20:48</td>
                            <td>
		                        <a class="btn-flat icon editArea" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <a class="btn-flat icon checkArea" title="查看地图详情">
		                            <i class="icon-check"></i>
		                        </a>
		                        <button class="btn-warning btn" title="前往处理">
		                            <i class="icon-wrench"></i>
		                        </button>
		                        <button class="btn-success btn" title="已处理">
		                            <i class="icon-ok"></i>
		                        </button>
	                        </td>
                        </tr>
                        row
                        <tr>
                            <td>A-1区域坐标点(120.350634,30.316788)数据(PH值:7.3（mg/L）)过高。</td>
                            <td><span class="label label-success">已处理</span></td>
                            <td>水泥误入水域边角，工作人员（小王）已处理。</td>
                            <td>2016-11-12 15:33</td>
                            <td>
		                        <a class="btn-flat icon editArea" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <a class="btn-flat icon checkArea" title="查看地图详情">
		                            <i class="icon-check"></i>
		                        </a>
		                        <button class="btn-danger btn" title="重新警报">
		                            <i class="icon-warning-sign"></i>
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
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">区域地图</h4>
            </div>
            <div class="modal-body">
              	<div id="area_map"></div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    
    <div class="modal fade" id="reWarningModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">重新警报</h4>
            </div>
            <div class="modal-body">
              	确认将该条消息改成警报状态？
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger confirm">确认</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    
    <div class="modal fade" id="processingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">处理中</h4>
            </div>
            <div class="modal-body">
              	确认将该条消息改成处理中的状态？
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger confirm">确认</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div class="modal fade" id="doneModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">已处理</h4>
            </div>
            <div class="modal-body">
              	确认将该条消息改成已处理的状态？
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger confirm">确认</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

	<!-- scripts -->
     <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap.min.js"></script>
    <script src="${__static__}/js/bootstrap-datetimepicker.js"></script>

    <script type="text/javascript">
    var now_page = 0,now_status = 0;
    function getLatLng(coordinate){
    	coordinate = coordinate.replace("(","").replace(")","").split(",");
    	return {lng:coordinate[0],lat:coordinate[1]};
    }

    $(document).on("click",".reWarning",function(){
    	var warningId = $(this).attr("warningId");
    	$("#reWarningModal").modal("show");
    	$("#reWarningModal .confirm").off("click");
    	$("#reWarningModal .confirm").on("click",function(){
    		$.post("${z:u('warning/rewarn')}",{id:warningId},function(result){
	    			if(result!='-1'){
	    				$("#reWarningModal").modal('hide');
	    		    	getWarning(now_page,now_status);
	    				myAlert("操作成功");
	    			}else{
	    				myAlert("操作失败");
	    			}
	    		},"json"); 
	    	});
    });

    $(document).on("click",".processing",function(){
    	var warningId = $(this).attr("warningId");
    	$("#processingModal").modal("show");
    	$("#processingModal .confirm").off("click");
    	$("#processingModal .confirm").on("click",function(){
    		$.post("${z:u('warning/processing')}",{id:warningId},function(result){
	    			if(result!='-1'){
	    				$("#processingModal").modal('hide');
	    		    	getWarning(now_page,now_status);
	    				myAlert("操作成功");
	    			}else{
	    				myAlert("操作失败");
	    			}
	    		},"json"); 
	    	});
    });
    $(document).on("click",".done",function(){
    	var warningId = $(this).attr("warningId");
    	$("#doneModal").modal("show");
    	$("#doneModal .confirm").off("click");
    	$("#doneModal .confirm").on("click",function(){
    		$.post("${z:u('warning/done')}",{id:warningId},function(result){
	    			if(result!='-1'){
	    				$("#doneModal").modal('hide');
	    		    	getWarning(now_page,now_status);
	    				myAlert("操作成功");
	    			}else{
	    				myAlert("操作失败");
	    			}
	    		},"json"); 
	    	});
    });
$(document).on("click",".checkArea",function(){
  		
  		var html = "<div id=\"area_map\"><div class=\"map_mark\"></div></div>";
  		$("#myModal .modal-body").html(html);
  		var warningId = $(this).attr("warningId");
  		$.post("${z:u('warning/positioning')}",{id:warningId},function(result){
  			/* $(".changeMap").attr("areaId",$(this).attr("areaId"));
  			alert($(".changeMap").attr("areaId")); */
    		if(result.status!='-1'){
    			if(result.area.mapImage!=null){
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
    							$("#area_map").css("background","url(${z:u('file/openfile')}?filepath="+result.area.mapImage+")");
    							//alert($("#area_map").css("background"));
    							$("#area_map").css("height",image_height);
    							$("#area_map").css("width",image_width);
        					}else{
        						image_scare = 610/image_width;
        						image_width = 610;
        						image_height = image_height*image_scare;
    							$("#area_map").css("background","url(${z:u('file/openfile')}?filepath="+result.area.mapImage+")");
    							$("#area_map").css("background-size","100%");
    							$("#area_map").css("height",image_height);
    							$("#area_map").css("width",image_width);
        					}
    					}else{
        					if(image_height>450){
        						image_scare = image_height/450;
        						image_height = 450;
        						image_width = image_width*image_scare;
    							$("#area_map").css("background","url(${z:u('file/openfile')}?filepath="+result.area.mapImage+")");
    							$("#area_map").css("background-size","100%");
    							$("#area_map").css("height",image_height);
    							$("#area_map").css("width",image_width);
    							
        					}else{
        						image_scare = 450/image_height;
        						image_height = 450;
        						image_width = image_width*image_scare;
    							$("#area_map").css("background","url(${z:u('file/openfile')}?filepath="+result.area.mapImage+")");
    							$("#area_map").css("background-size","100%");
    							$("#area_map").css("height",image_height);
    							$("#area_map").css("width",image_width);
        					}
    					}
    					var lefttop = getLatLng(result.area.LT_coordinate);
    					var rightbottom = getLatLng(result.area.RB_coordinate);
    					var position = getLatLng(result.area.coordinate);
    					var map_mark = $("#area_map .map_mark");
    					map_mark.css("left",(position.lng-lefttop.lng)/(rightbottom.lng-lefttop.lng)*image_width);
    					map_mark.css("top",(position.lat-lefttop.lat)/(rightbottom.lat-lefttop.lat)*image_height);
    				}
    				image.src = "${z:u('file/openfile')}?filepath="+result.area.mapImage;
    			}else{
    				
    			}
    		}else{
    			myAlert(result.info);
    		}
    	},"json"); 
  		$("#myModal").modal('show').find('.modal-dialog').width(655).find('.modal-body').height(450);
  	});
    $(function(){
    	getWarning(1,0);
  		/* $.post("${z:u('robot/getarea')}",{},function(result){
    		if(result.status!='-1'){
    			var areaOptions = "<option value='0'>全部</option>";
    			$.each(result.data.areas,function(index,content){
    				areaOptions+="<option value='"+content.id+"'>"+content.areaNo+"</option>";
    			});
    			$(".areaChoose").html(areaOptions);

    	  		$.post("${z:u('robot/getrobotbyarea')}",{areaId:$(".areaChoose").val()},function(result){
    	   			var options =  "<option value='0'>全部</option>";
    	   			$.each(result,function(index,content){
    	   				options+="<option value='"+content.id+"'>"+content.robotNo+"</option>";
    	   			});
    	   			$(".robotChoose").html(options);
    	    	},"json"); 
    		}
    	},"json");  */
    });
    /* $(document).on("change",".areaChoose",function(){
  		$.post("${z:u('robot/getrobotbyarea')}",{areaId:$(".areaChoose").val()},function(result){
   			var options =  "<option value='0'>全部</option>";
   			$.each(result,function(index,content){
   				options+="<option value='"+content.id+"'>"+content.robotNo+"</option>";
   			});
   			$(".robotChoose").html(options);
    	},"json"); 
    });
    $(document).on("change",".robotChoose",function(){
    	getWarning(pagenum)
    }); */

    $(document).on("change",".statusChoose",function(){
    	getWarning(now_page,$(this).val());
    }); 
    
 // custom uiDropdown element, example can be seen in user-list.html on the 'Filter users' button
 function getWarning(pagenum,status){
	 now_status = status;
	 now_page = pagenum;
	 	$.post("${z:u('warning/getwarning')}",{page:pagenum,status:now_status},function(result){
	 		$(".table tbody").children("tr").remove();
			if(result.status!='-1'){
      		    var items = result.page.items;
      		    if(items.length==0)
      		    	$(".table tbody").append("<tr><td colspan='4' style=\"text-align:center\">暂无数据</td></tr>");
	      		$.each(items,function(index,content){
	      			var tr = "";
	      			if(content.status==1){
	        		    tr = "<tr>"+
                        "    <td>"+content.content+"</td>"+
                        "    <td><span class=\"label label-danger\">警报中</span></td>"+
                        "    <td>"+(content.description==null?"":content.description)+"</td>"+
                        "    <td>"+content.time+"</td>"+
                        "    <td>"+
		                "        <a class=\"btn-flat icon checkArea\" title=\"查看地图详情\" warningId=\""+content.id+"\">"+
		                "            <i class=\"icon-check\"></i>"+
		                "        </a>"+
		                "        <button class=\"btn-warning btn processing\" title=\"前往处理\" warningId=\""+content.id+"\">"+
		                "            <i class=\"icon-wrench\"></i>"+
		                "        </button>"+
		                "        <button class=\"btn-success btn done\" title=\"已处理\" warningId=\""+content.id+"\">"+
		                "            <i class=\"icon-ok\"></i>"+
		                "        </button>"+
	                    "    </td>"+
                        "</tr>";
	      			}else if(content.status==2){

	        		    tr = "<tr>"+
                        "    <td>"+content.content+"</td>"+
                        "    <td><span class=\"label label-warning\">处理中</span></td>"+
                        "    <td>"+(content.description==null?"":content.description)+"</td>"+
                        "    <td>"+content.time+"</td>"+
                        "    <td>"+
		                "        <a class=\"btn-flat icon checkArea\" title=\"查看地图详情\" warningId=\""+content.id+"\">"+
		                "            <i class=\"icon-check\"></i>"+
		                "        </a>"+
		                "        <button class=\"btn-danger btn reWarning\" title=\"重新警报\" warningId=\""+content.id+"\">"+
		                "            <i class=\"icon-warning-sign\"></i>"+
		                "        </button>"+
		                "        <button class=\"btn-success btn done\" title=\"已处理\" warningId=\""+content.id+"\">"+
		                "            <i class=\"icon-ok\"></i>"+
		                "        </button>"+
	                    "    </td>"+
                        "</tr>";
	      			}else if(content.status==3){
	        		    tr = "<tr>"+
	                    "    <td>"+content.content+"</td>"+
	                    "    <td><span class=\"label label-success\">已处理</span></td>"+
	                    "    <td>"+(content.description==null?"":content.description)+"</td>"+
	                    "    <td>"+content.time+"</td>"+
	                    "    <td>"+
		                "        <a class=\"btn-flat icon checkArea\" title=\"查看地图详情\" warningId=\""+content.id+"\">"+
		                "            <i class=\"icon-check\"></i>"+
		                "        </a>"+
		                "        <button class=\"btn-danger btn reWarning\" title=\"重新警报\" warningId=\""+content.id+"\">"+
		                "            <i class=\"icon-warning-sign\"></i>"+
		                "        </button>"+
	                    "    </td>"+
	                    "</tr>";
	      			}
	          		  $(".table tbody").append(tr);
	    		});
        		var logPage = "";/* <ul class=\"pagination\" > */
                var page = result.showPages;
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
                if (pagenum == result.page.totalPage)
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

</body>
</html>