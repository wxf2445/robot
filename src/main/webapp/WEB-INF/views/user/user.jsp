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
.page-div{
	text-align:center;
}
.headImage{
	height:40px;width:40px
}
</style>
<body>

        <div id="pad-wrapper" >
            <div class="row header">
                <h3>用户列表</h3>
                
                    <a href="javascript:void(0)" class="btn-flat success pull-right addUser">
                        <span>&#43;</span>
                        	添加用户
                    </a>
            </div>

            <!-- Users table -->
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="col-md-2 sortable">
                                  	  头像
                                </th>
                                <th class="col-md-2 sortable">
                                   	 <span class="line"></span>姓名
                                </th>
                                <th class="col-md-2 sortable">
                                    <span class="line"></span>角色
                                </th>
                                <th class="col-md-2 sortable">
                                    <span class="line"></span>联系方式
                                </th>
                                <th class="col-md-2 sortable">
                                    <span class="line"></span>描述
                                </th>
                                <th class="col-md-3 sortable">
                                    <span class="line"></span>操作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                       <%--  <tr class="first">
                            <td>
                                <img src="${__static__}/images/lll.jpg" class="img-circle avatar hidden-phone headImage"/>
                            </td>
                            <td>那段路有我相伴丶</td>
                            <td>管理员</td>
                            <td>18788888888</td>
                            <td></td>
                            <td>
		                        <a class="btn-flat icon editUser" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <button class="btn-danger btn" title="删除">
		                            <i class="icon-trash"></i>
		                        </button>
	                        </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="${__static__}/images/contact-img.png" class="img-circle avatar hidden-phone headImage"/>
                            </td>
                            <td>小王</td>
                            <td>工作人员</td>
                            <td>13188888888</td>
                            <td></td>
                            <td>
		                        <a class="btn-flat icon editUser" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <button class="btn-danger btn" title="删除">
		                            <i class="icon-trash"></i>
		                        </button>
	                        </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="${__static__}/images/contact-img2.png" class="img-circle avatar hidden-phone headImage"/>
                            </td>
                            <td>小李</td>
                            <td>工作人员</td>
                            <td>13588888888</td>
                            <td></td>
                            <td>
		                        <a class="btn-flat icon editUser" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <button class="btn-danger btn" title="删除">
		                            <i class="icon-trash"></i>
		                        </button>
	                        </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="${__static__}/images/gallery3.jpg" class="img-circle avatar hidden-phone headImage" />
                            </td>
                            <td>李总</td>
                            <td>超级管理员</td>
                            <td>15688888888</td>
                            <td></td>
                            <td>
	                        </td>
                        </tr> --%>
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
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">添加用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">角色 :</label>
                        <div class="col-lg-10">
                            <select name="roleId" id="add_roleId" class="form-control">
                            	<!-- <option value="1">工作人员</option>
                            	<option value="2">管理员</option>
                            	<option value="3">超级管理员</option> -->
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">账号:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" name="account" id="account">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">密码:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" name="password" id="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">昵称:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" name="add_name" id="add_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">联系方式:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" name="add_phone" id="add_phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">描述:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="add_description" placeholder="" value="">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary addUserSave">保存</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
<!-- Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">编辑用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">角色 :</label>
                        <div class="col-lg-10">
                            <select name="roleId" id="roleId" class="form-control">
                            	<!-- <option value="1">工作人员</option>
                            	<option value="2">管理员</option>
                            	<option value="3">超级管理员</option> -->
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">昵称:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" name="name" id="name" placeholder="小王" value="小王">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">联系方式:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" name="phone" id="phone" placeholder="13188888888" value="13188888888">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">描述:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="inputPassword1" placeholder="" value="">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary saveUser">保存</button>
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
 // custom uiDropdown element, example can be seen in user-list.html on the 'Filter users' button
 
      	 $(document).on("click",".addUser",function(){
    		$.post("${z:u('user/getroles')}",{},function(result){
    			var options = "";
    			$.each(result,function(index,content){
    				options+="<option value='"+content.id+"'>"+content.name+"</option>";
    			});
    			$("#add_roleId").html(options);
          		$("#addUserModal").modal('show');
    		},"json"); 
      	});
      	 $(document).on("click",".addUserSave",function(){
     		$.post("${z:u('user/add')}",{name:$("#add_name").val(),description:$("#add_description").val(),phone:$("#add_phone").val(),
     			roleId:$("#add_roleId").val(),account:$("#account").val(),password:$("#passwrod").val()},function(result){
     			if(result==1){
               		$("#addUserModal").modal('hide');
               		myAlert("添加成功");
               		getUser(1);
     			}
     		},"json"); 
       	});
 $(document).on("click",".editUser",function(){
		
		var userId = $(this).attr("userId");
		$.post("${z:u('user/getuserinfo')}",{id:userId},function(result){
			if(result.status!='-1'){
				var options = "";
				$.each(result.roles,function(index,content){
					if(content.id==result.roleId)
						options+="<option value='"+content.id+"' selected>"+content.name+"</option>";
					else
						options+="<option value='"+content.id+"'>"+content.name+"</option>";
				});
				$("#roleId").html(options);
				$("#name").val(result.name);
				$("#name").attr("placeholder",result.name);
				$("#phone").val(result.phone);
				$("#phone").attr("placeholder",result.phone);
				$("#description").val(result.description);
				$("#description").attr("placeholder",result.description);
				$(".saveUser").attr("userId",userId);
      			$("#editUserModal").modal('show');
			}else{
				myAlert(result.info);
			}
		},"json"); 
		//$("#myModal").modal('show').find('.modal-dialog').width(655).find('.modal-body').height(450);
	});

 $(document).on("click",".saveUser",function(){
		
		var userId = $(this).attr("userId");
		$.post("${z:u('user/getuserinfo')}",
				{id:userId,roleId:$("#roleId").val(),name:$("#name").val(),phone:$("#phone").val(),description:$("#description").val()},
			function(result){
					if(result.status!='-1'){
		      			$("#editUserModal").modal('hide');
						getUser(1);
					}else{
						myAlert(result.info);
					}
		},"json"); 
		//$("#myModal").modal('show').find('.modal-dialog').width(655).find('.modal-body').height(450);
	});
 function getUser(pagenum){
	 	$.post("${z:u('user/getuser')}",{page:pagenum},function(result){
	 		$(".table tbody").children("tr").remove();
			if(result.status!='-1'){
      		    var items = result.users.page.items;
      		    if(items.length==0)
      		    	$(".table tbody").append("<tr><td colspan='4' style=\"text-align:center\">暂无数据</td></tr>");
	      		$.each(items,function(index,content){
	        		    var tr = "<tr>"+
                            "<td><img src=\""+(content.headImage==null?"${__static__}/img/logo.png":"${z:u('file/openfile')}?filepath="+content.headImage)+"\" onerror=\"${__static__}/img/logo.png\" class=\"img-circle avatar hidden-phone headImage\"/></td>"+
                            "<td>"+content.name+"</td>"+
                            "<td>"+content.roleName+"</td>"+
                            "<td>"+content.phone+"</td>"+
                            "<td>"+content.description+"</td>"+
                            "<td>"+
		                    "    <a class=\"btn-flat icon editUser\" title=\"编辑\" userId=\""+content.id+"\">"+
		                    "        <i class=\"icon-edit\"></i>"+
		                    "    </a>"+
		                    "    <button class=\"btn-danger btn deleteUser\" title=\"删除\" userId=\""+content.id+"\">"+
		                    "        <i class=\"icon-trash\"></i>"+
		                    "    </button>"+
	                        "</td></tr>";

	          		  $(".table tbody").append(tr);
	    		});
        		var logPage = "";/* <ul class=\"pagination\" > */
                var page = result.users.showPages;
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
                if (pagenum == result.users.page.totalPage)
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
    $(function(){
    	getUser(1);
    })
    </script>

</body>
</html>