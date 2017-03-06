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

    <!-- libraries -->
    <link href="${__static__}/css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="${__static__}/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/layout.css">
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/elements.css">
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/icons.css">

    <!-- this page specific styles -->
    <link rel="stylesheet" href="${__static__}/css/compiled/index.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>-->

    <!-- lato font -->
    <!-- <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>-->

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<style>
.map_mark{
	background:url(${__static__}/img/mark.png);background-size:100%;position:absolute;width:60px;height:60px;left:0px;top:0px;z-indez:10000;
}

#map_div{
	margin:0 auto;background:url(${__static__}/img/map.png);height:450px;width:610px;background-size:100%;position:absolute
}
.map_div_div{
	height:450px;width:610px;float:left;
}
#now_position{
	left:100px;top:200px;
} 
</style>
<body onload="websocket_init()"> <!--  -->
    <!-- navbar -->
    <header class="navbar navbar-inverse" role="banner">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" id="menu-toggler">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            	 
            <a class="navbar-brand" href="index.html"><img src="${__static__}/img/logo.png" height="26px"></a> 
        </div>
        <ul class="nav navbar-nav pull-right hidden-xs">
            <li class="hidden-xs hidden-sm">
                <input class="search" type="text" />
            </li>
            <li class="notification-dropdown hidden-xs hidden-sm">
                <a href="javasricpt:void(0)" class="trigger">
                    <i class="icon-warning-sign"></i>
                    <span class="count"  style="background:#f00">${warnings.size() }</span>
                </a>
                <div class="pop-dialog">
                    <div class="pointer right">
                        <div class="arrow"></div>
                        <div class="arrow_border"></div>
                    </div>
                    <div class="body warning-body">
                        <a href="javasricpt:void(0)" class="close-icon"><i class="icon-remove-sign"></i></a>
                        <div class="notifications">
                            <h3 size="${warnings.size() }">你共收到${warnings.size() }条警报</h3>
                            <c:forEach var="warning" items="${warnings}">
	                            <a href="${z:u('index/warning') }" class="item" warningId="${warning.id }">
	                                <i class="icon-signin"></i>警报：${warning.content } <br>
	                                <span class="time"><i class="icon-time"></i> ${warning.time } </span>
	                            </a>
						    </c:forEach>
                            <!-- <a href="javasricpt:void(0)" class="item">
                                <i class="icon-signin"></i> 警报：A-1-3区域坐标点(120.350667,30.316748)数据(溶氧量:6.9（mg/L）)过低。
                                <span class="time"><i class="icon-time"></i> 8分钟前.</span>
                            </a> -->
                            <div class="footer">
                                <a href="javasricpt:void(0)" class="logout">查看所有消息</a>
                            </div>
                        </div>
                    </div>
                </div>
            </li>

            <li class="dropdown">
                <a href="javasricpt:void(0)" class="dropdown-toggle hidden-xs hidden-sm" data-toggle="dropdown">
                    	${user.name }
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="javascript:void(0)" tar-href="${z:u('setup/account') }">个人信息</a></li>
                    <li><a href="javascript:void(0)">修改密码</a></li>
                </ul>
            </li>
            <!-- <li class="settings hidden-xs hidden-sm">
                <a href="personal-info.html" role="button">
                    <i class="icon-cog"></i>
                </a>
            </li> -->
            <li class="settings hidden-xs hidden-sm">
                <a href="${z:u('login') }" role="button" >
                    <i class="icon-share-alt"></i>
                </a>
            </li>
        </ul>
    </header>
    <!-- end navbar -->

    <!-- sidebar -->
    <div id="sidebar-nav">
        <ul id="dashboard-menu">
            <li class="active">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div> 
                <a href="${z:u('/') }">
                    <i class="icon-home"></i>
                    <span>首页</span>
                </a>
            </li>            
            <li>
                <a class="dropdown-toggle" href="javasricpt:void(0)">
                    <i class="icon-signal"></i>
                    <span>数据监控</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="javasricpt:void(0)" tar-href="${z:u('monitoring/charts') }">图标数据</a></li>
                    <li><a href="javasricpt:void(0)" tar-href="${z:u('monitoring/listData') }">列表数据</a></li>
                    <li><a href="javasricpt:void(0)" tar-href="${z:u('monitoring/standard') }">设置数据标准值</a></li>
                </ul>
            </li>
            <li class="one-level-li"> 
                <a href="javascript:void(0)" tar-href="${z:u('index/robotManage') }">
                    <i class="icon-tasks"></i>
                    <span>操作机器人</span>
                </a>
            </li>        
            <li>
                <a class="dropdown-toggle" href="javasricpt:void(0)">
                    <i class="icon-road"></i>
                    <span>设备管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="javasricpt:void(0)" tar-href="${z:u('equipment/area') }">区域管理</a></li>
                    <li><a href="javasricpt:void(0)" tar-href="${z:u('equipment/robot') }">机器人管理</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="javasricpt:void(0)">
                    <i class="icon-group"></i>
                    <span>用户管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="javasricpt:void(0)" tar-href="${z:u('user/user') }">用户管理</a></li>
                    <li><a href="javasricpt:void(0)" tar-href="${z:u('user/role') }">角色管理</a></li>
                </ul>
            </li>
            <li class="one-level-li">
                <a href="javascript:void(0)" tar-href="${z:u('index/warning') }">
                    <i class="icon-warning-sign"></i>
                    <span>警报管理</span>
                </a>
            </li>
            <%-- <li class="one-level-li">
                <a href="javascript:void(0)" tar-href="${z:u('index/gallery') }">
                    <i class="icon-picture"></i>
                    <span>相册</span>
                </a>
            </li> --%>
            <li class="one-level-li">
                <a href="javascript:void(0)" tar-href="${z:u('index/statistical') }">
                    <i class="icon-bar-chart"></i>
                    <span>统计</span>
                </a>
            </li>
            <li>
                <a class="dropdown-toggle" href="javasricpt:void(0)">
                    <i class="icon-cog"></i>
                    <span>设置</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="javascript:void(0)" tar-href="${z:u('setup/account') }">账号管理</a></li>
                    <li><a href="javascript:void(0)" tar-href="${z:u('setup/server') }">服务器信息</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- end sidebar -->


	<!-- main container -->
    <div class="content" id="main-content">
        <div id="pad-wrapper">
            <div class="row header">
                <h3>机器人当前位置</h3>
            </div>
           <!-- gallery wrapper -->
            <div>
                <div>
                    <div class="map_div_div">
                       	<div id="map_div">
                       		<div id="now_position" class="map_mark"></div> 
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
                    </div>
                </div>
            </div>
        </div>
    </div>


<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">通知</h4>
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

	<!-- scripts -->
     <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap.min.js"></script>
    <script src="${__static__}/js/jquery-ui-1.10.2.custom.min.js"></script>
    <!-- flot charts -->
    <script src="${__static__}/js/theme.js"></script>

    <script type="text/javascript">
    function myAlert(str){
    	$("#alertModal .modal-body").html(str);
    	$("#alertModal").modal("show");
    }
        $(function () {


        	$("#dashboard-menu li a").on("click",function(){
                var url = $(this).attr("tar-href"); //被加载的页面url
                if($(this).parent().find(".submenu").length==0)
            		$("#dashboard-menu li a").css("color","#4c535a");
               // alert(url);
                $("#main-content").load(url,null,function(){/* alert("加载成功") */}); 
                if($(this).closest("ul").hasClass("submenu")){
                	$(this).css("color","#D94600");
            		$("#dashboard-menu .active .pointer").remove();
            		$("#dashboard-menu .active").removeClass("active");
            		$(this).closest("ul").parent().addClass("active");
            		$(this).closest("ul").parent().prepend(
            				"<div class=\"pointer\">"+
    	                        "<div class=\"arrow\"></div>"+
    	                        "<div class=\"arrow_border\"></div>"+
    	                    "</div> ");
                }
                	
        	})
        	
        	$(".one-level-li").on("click",function(){
		        $(".submenu").slideUp("fast");
        		$("#dashboard-menu .active .pointer").remove();
        		$("#dashboard-menu .active").removeClass("active");
        		$(this).addClass("active");
        		$(this).prepend(
        				"<div class=\"pointer\">"+
	                        "<div class=\"arrow\"></div>"+
	                        "<div class=\"arrow_border\"></div>"+
	                    "</div> ");
        	})
        	
		  // sidebar menu dropdown toggle
		  $("#dashboard-menu .dropdown-toggle:not(.one-level-li)").on("click",function (e) {
			    e.preventDefault();
		    var $item = $(this).parent();
		
			//$("#dashboard-menu .active").removeClass("active");
		    
		    if($item.find(".submenu").css("display")=="none"){

		        $(".submenu").slideUp("fast");
		        $item.find(".submenu").slideDown("fast");
		    }else{
		        $item.find(".submenu").slideUp("fast");
		    }
		  });

            

        });
    </script>

<script type="text/javascript" src="${__static__}/websocket/web_socket.js"></script>
<script src="${__static__}/js/websocket.js"></script>
<script src="${__static__}/js/method.js"></script>	
</body>
</html>