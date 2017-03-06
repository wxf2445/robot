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

<link rel="stylesheet" type="text/css" href="${__static__}/css/bmap.css"/>  
</head>
<style>
/* background:url(${__static__}/img/map.png); */
 #area_map{
	height:450px;width:610px;
} 

.page-div{
	text-align:center;
}
</style> 
<body>

        <div id="pad-wrapper"  >
            <div class="row header">
                <h3>区域列表</h3>
                
                    <a href="javascript:void(0)" class="btn-flat success pull-right addArea">
                        <span>&#43;</span>
                        	添加区域
                    </a>
                
            </div>

            <!-- Users table -->
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="col-md-3 sortable">
                                   	 编号
                                </th>
                                <th class="col-md-3 sortable">
                                    <span class="line"></span>描述
                                </th>
                                <th class="col-md-3 sortable">
                                    <span class="line"></span>创建时间
                                </th>
                                <th class="col-md-3 sortable">
                                    <span class="line"></span>操作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <!-- <tr class="first">
                            <td>A-1</td>
                            <td>大明湖A区</td>
                            <td>2016-11-19 19:12</td>
                            <td>
		                        <a class="btn-flat icon editArea" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <a class="btn-flat icon checkArea" title="查看地图详情">
		                            <i class="icon-check"></i>
		                        </a>
		                        <button class="btn-danger btn" title="删除">
		                            <i class="icon-trash"></i>
		                        </button>
	                        </td>
                        </tr>
                        row
                        <tr>
                            <td>A-2</td>
                            <td>大明湖B区</td>
                            <td>2016-11-19 20:43</td>
                            <td>
		                        <a class="btn-flat icon editArea" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <a class="btn-flat icon checkArea" title="查看地图详情">
		                            <i class="icon-check"></i>
		                        </a>
		                        <button class="btn-danger btn" title="删除">
		                            <i class="icon-trash"></i>
		                        </button>
	                        </td>
                        </tr>
                        row
                        <tr>
                            <td>A-3</td>
                            <td>大明湖C区</td>
                            <td>2016-11-19 21:37</td>
                            <td>
		                        <a class="btn-flat icon editArea" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <a class="btn-flat icon checkArea" title="查看地图详情">
		                            <i class="icon-check"></i>
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
              <button type="button" class="btn btn-danger saveMap">保存</button>
              <button type="button" class="btn btn-primary changeMap">修改</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->



    <!-- Modal -->
    <div class="modal fade" id="editAreaModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">编辑区域</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">编号:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="no" placeholder="A-1-1" value="A-1-1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">描述:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="description" placeholder="大明湖A区" value="大明湖A区">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary saveChange">保存</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
     <!-- Modal -->
    <div class="modal fade" id="addAreaModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">添加区域</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
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
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary saveArea">保存</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
	<!-- scripts -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">通知</h4>
            </div>
            <div class="modal-body">
                	确定要删除该条信息吗？
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary sureDelete">确定</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
	
     <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap.min.js"></script>
    <script src="${__static__}/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="${__static__}/js/baidumap.js"></script>

    <script type="text/javascript">
    
    
    
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
  	$(document).on('click','.saveArea',function(){
  		$.post("${z:u('area/add')}",{no:$("#add_no").val(),description:$("#add_description").val()},function(result){
    		if(result.status!='-1'){
    			$("#addAreaModal").modal('hide');
    			myAlert("添加成功");
    			getArea(1);
    		}else{
    			myAlert(result.info);
    		}
    	},"json"); 
  	});
  	var now_page = 1;
  	function getArea(pagenum){
  		now_page = pagenum;
	 	$.post("${z:u('area/getarea')}",{page:pagenum},function(result){
	 		$(".table tbody").children("tr").remove();
			if(result.status!='-1'){
      		    var items = result.data.datas.page.items;
      		    if(items.length==0)
      		    	$(".table tbody").append("<tr><td colspan='6' style=\"text-align:center\">暂无数据</td></tr>");
	      		$.each(items,function(index,content){
	        		    var tr = "<tr>"+
                            "<td>"+content.areaNo+"</td>"+
                            "<td>"+(content.description==null?"":content.description)+"</td>"+
                            "<td>"+content.createtime+"</td>"+
                            "<td>"+
		                    "    <a class=\"btn-flat icon editArea\" title=\"编辑\" areaId=\""+content.id+"\">"+
		                    "        <i class=\"icon-edit\"></i>"+
		                    "    </a>"+
		                    "    <a class=\"btn-flat icon checkArea\" title=\"查看地图详情\" areaId=\""+content.id+"\">"+
		                    "        <i class=\"icon-check\"></i>"+
		                    "    </a>"+
		                    "    <button class=\"btn-danger btn deleteArea\" title=\"删除\" areaId=\""+content.id+"\">"+
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
  	$(document).on("click",".editArea",function(){
  		var areaId = $(this).attr("areaId");
  		$.post("${z:u('area/getinfo')}",{no:$("#add_no").val(),description:$("#add_description").val(),id:areaId},function(result){
    		if(result.status!='-1'){
    	  		$("#no").val(result.data.areaNo);
    	  		$("#no").attr("placeholder",result.data.areaNo);
    	  		$("#description").val(result.data.description);
    	  		$("#description").attr("placeholder",result.data.description);
    	  		$("#editAreaModal").modal('show');
    			$("#editAreaModal .saveChange").attr("areaId",result.data.id);
    		}else{
    			myAlert(result.info);
    		}
    	},"json");
  	});
  	$(document).on("click",".deleteArea",function(){
  		$("#deleteModal").modal("show");
  		$(".sureDelete").off("click");
  		var areaId = $(this).attr("areaId");
  		$(".sureDelete").on("click",function(){
  	  		$.post("${z:u('area/delete')}",{id:areaId},function(result){
  	    		if(result.data==1){
  	    			myAlert("删除成功");
  	    	  		$("#deleteModal").modal("hide");
  	    			getArea(1);
  	    		}else{
  	    			myAlert(result.info);
  	    		}
  	    	},"json");
  		})
  	});
  	$(document).on("click",".saveChange",function(){
  		$.post("${z:u('area/savechange')}",{no:$("#no").val(),description:$("#description").val(),id:$(this).attr("areaId")},function(result){
    		if(result.status!='-1'){
    			$("#editAreaModal").modal('hide');
    			getArea(now_page);
    		}else{
    			myAlert(result.info);
    		}
    	},"json");
  	});
  	$(document).on("click",".checkArea",function(){
  		
  		var html = "<div id=\"area_map\"></div>";
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
    							$("#area_map").css("background","url(${z:u('file/openfile')}?filepath="+result.data+")");
    							//alert($("#area_map").css("background"));
    							$("#area_map").css("height",image_height);
    							$("#area_map").css("width",image_width);
        					}else{
        						image_scare = 610/image_width;
        						image_width = 610;
        						image_height = image_height*image_scare;
    							$("#area_map").css("background","url(${z:u('file/openfile')}?filepath="+result.data+")");
    							$("#area_map").css("background-size","100%");
    							$("#area_map").css("height",image_height);
    							$("#area_map").css("width",image_width);
        					}
    					}else{
        					if(image_height>450){
        						image_scare = image_height/450;
        						image_height = 450;
        						image_width = image_width*image_scare;
    							$("#area_map").css("background","url(${z:u('file/openfile')}?filepath="+result.data+")");
    							$("#area_map").css("background-size","100%");
    							$("#area_map").css("height",image_height);
    							$("#area_map").css("width",image_width);
    							
        					}else{
        						image_scare = 450/image_height;
        						image_height = 450;
        						image_width = image_width*image_scare;
    							$("#area_map").css("background","url(${z:u('file/openfile')}?filepath="+result.data+")");
    							$("#area_map").css("background-size","100%");
    							$("#area_map").css("height",image_height);
    							$("#area_map").css("width",image_width);
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
    $(function(){
    	getArea(1);
      	/* $(".checkArea").on("click",function(){
      		$("#myModal").modal('show').find('.modal-dialog').width(655).find('.modal-body').height(450);
      	}); */
      	/* $(".editArea").on("click",function(){
      		$("#editAreaModal").modal('show');
      	}); */
      	 $(".addArea").on("click",function(){
      		$("#addAreaModal").modal('show');
      	}); 
      	$(".changeMap").on("click",function(){
      		$(this).hide();
      		$(".saveMap").show();
      		var html = "<div class=\"container\" id=\"container\"></div>";
      		$("#myModal .modal-body").html(html);
      		initMap();
      		//$(".saveMap").attr("areaId",$(".changeMap").attr("areaId"));
      	});
      	/* $(".saveMap").on("click",function(){
      		$(this).hide();
      		$(".changeMap").show();
      		$("#myModal").modal('hide');
      	}); */
    });
    </script>

</body>
</html>
<style>
.center{ MARGIN-RIGHT: auto;
MARGIN-LEFT: auto;
vertical-align:middle;
line-height:200px;
}
.container{height:400px;width:500px;border:1px solid gray}
#mapImage{border:1px solid gray}
.BMap_cpyCtrl,.anchorBL{display: none;}
.saveMap{
	display:none;
}

</style>
<script type="text/javascript"> 

var leftbottom_lng = 0 ;//经度
var leftbottom_lat = 0 ;//纬度
var righttop_lng = 0 ;
var righttop_lat = 0 ;

	$(document).on("click",".saveMap",function(){
		var center = (leftbottom_lng+righttop_lng)/2+","+(leftbottom_lat+righttop_lat)/2;
		var height = parseInt((righttop_lat-leftbottom_lat)*500000*22/46);
		var width = parseInt((righttop_lng-leftbottom_lng)*500000*22/46);
		var lefttop_coordinate = "("+leftbottom_lng+","+righttop_lat+")";
		var rightbottom_coordinate = "("+righttop_lng+","+leftbottom_lat+")";
		//alert(height+" "+width);
		//alert(areaId);
		$.post("${z:u('area/savemap')}",
				{id:$(this).attr("areaId"),height:height,width:width,center:center,lefttop_coordinate:lefttop_coordinate,
					rightbottom_coordinate:rightbottom_coordinate},function(result){
			if(result.status!='-1'){
				$("#myModal").modal('hide');
			}else{
				myAlert(result.info);
			}
		},"json"); 
	});
function initMap(){
	//var container = document.getElementById("container");
	var location_lng = 120.35199487364685 ,location_lat = 30.31856157755943;
	/*
	var container = document.getElementById("container");
	container.style.width = clientWidth*0.936+"px";
	container.style.height = clientHeight*0.8+"px";*/
	
	/* BMap.Convertor.translate({lng:location_lng, lat:location_lat}, 1, 5, '6vxe6wNIoVzqpbyAmGxYUkiobfmSyWs8', function (point, status, message) {
	    if(status) return show(message || "转换坐标出错:"+status, true);
	    location_lng = point.lng;
	    location_lat = point.lat;
	    // var curmarker = new BMap.Marker(point);
	    //baidumap.addOverlay(curmarker); 
	}); */
	
	var map = new BMap.Map("container",{mapType: BMAP_NORMAL_MAP});  
	var point = new BMap.Point(116.404, 39.915);    // 创建点坐标  
	map.centerAndZoom(point,19);             // 初始化地图,设置中心点坐标和地图级别。  
	
	//map.addControl(new BMap.NavigationControl());  
	map.enableScrollWheelZoom();                  // 启用滚轮放大缩小。  
	//map.enableKeyboard();  
	var myIcon=new BMap.Icon("${__static__}/images/cu.png",new BMap.Size(38.4,38.4),{
	//BMap.Size类表示以指定的宽度和高度创建一个矩形区域大小，有的时候图标太大，Size太小，可能不能显示图标或显示一部分图标
	  imageSize:new BMap.Size(4,4),//设置显示图像的大小，因为256*256太大，所以可以设置它实际显示的长宽比例为25.6*25.6，相当于缩小十倍了
	  anchor:new BMap.Size(19.2,19.2),//标注指向的地理位置距离图标左上角各偏移13和25.6像素(一般宽度是照片宽的一般，长度是照片的长，这样图标的尖角就能刚好点在坐标点上，否则是图标的中心点在坐标点上)，本例中该位置即是图标中央下端的尖角位置
	});
	//var marker=new BMap.Marker(point,{icon:myIcon});
/*map.addOverlay(marker);*/

	map.clearOverlays(); 
	var new_point = new BMap.Point(location_lng,location_lat);
	/* var marker = new BMap.Marker(new_point);  // 创建标注
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	map.addOverlay(marker);              // 将标注添加到地图中 */
	map.panTo(new_point); 
	
	leftbottom_lng = location_lng-0.000300;
	leftbottom_lat = location_lat-0.000300;
	righttop_lng = location_lng+0.000300;
	righttop_lat = location_lat+0.000300;
	
	var polygon = new BMap.Polygon([
		new BMap.Point(leftbottom_lng,leftbottom_lat),
		new BMap.Point(leftbottom_lng,righttop_lat),
		new BMap.Point(righttop_lng,righttop_lat),
		new BMap.Point(righttop_lng,leftbottom_lat)
	], {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5,fillOpacity: 0.1});  //创建多边形
	map.addOverlay(polygon);   //增加多边形
	//getMap();
	
	var point1 = new BMap.Point(location_lng-0.000300, location_lat-0.000300);     
	//var marker1 = new BMap.Marker(point1);        // 创建标注    
	var marker1=new BMap.Marker(point1,{icon:myIcon});
	map.addOverlay(marker1);                     // 将标注添加到地图中
	marker1.enableDragging();   
	marker1.addEventListener("dragend", function(e){
		leftbottom_lng = e.point.lng;
		leftbottom_lat = e.point.lat;
		map.removeOverlay(polygon); 
		var polygon2 = new BMap.Polygon([
			new BMap.Point(leftbottom_lng,leftbottom_lat),
			new BMap.Point(leftbottom_lng,righttop_lat),
			new BMap.Point(righttop_lng,righttop_lat),
			new BMap.Point(righttop_lng,leftbottom_lat)
		], {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5,fillOpacity: 0.1});  //创建多边形
		map.addOverlay(polygon2);   //增加多边形
		polygon = polygon2;
		//getMap();
	});     
	
	var point2 = new BMap.Point(location_lng+0.000300, location_lat+0.000300);     
	//var marker2 = new BMap.Marker(point2);        // 创建标注    
	var marker2=new BMap.Marker(point2,{icon:myIcon});
	map.addOverlay(marker2);    
	marker2.enableDragging();
	marker2.addEventListener("dragend", function(e){    
		righttop_lng = e.point.lng;
		righttop_lat = e.point.lat;
		map.removeOverlay(polygon); 
		var polygon2 = new BMap.Polygon([
			new BMap.Point(leftbottom_lng,leftbottom_lat),
			new BMap.Point(leftbottom_lng,righttop_lat),
			new BMap.Point(righttop_lng,righttop_lat),
			new BMap.Point(righttop_lng,leftbottom_lat)
		], {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5,fillOpacity: 0.1,});  //创建多边形
		map.addOverlay(polygon2);   //增加多边形   
		polygon = polygon2;
		//getMap();
	});      
	
/*map.addEventListener("click",function(e){
	
	var point2 = new BMap.Point(e.point.lng, e.point.lat);     
	var marker = new BMap.Marker(point2);        // 创建标注    
	map.addOverlay(marker);                     // 将标注添加到地图中
    //prompt("鼠标单击地方的经纬度为：",e.point.lng + "," + e.point.lat);
});*/

}

</script>  