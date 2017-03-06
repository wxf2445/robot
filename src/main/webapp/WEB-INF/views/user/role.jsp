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
	height:40px;
}
</style>
<body>

        <div id="pad-wrapper" >
            <div class="row header">
                <h3>角色列表</h3>
                
                    <a href="javascript:void(0)" class="btn-flat success pull-right addRole">
                        <span>&#43;</span>
                        	添加角色
                    </a>
            </div>

            <!-- Users table -->
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="col-md-2 sortable">
                                  	 角色名
                                </th>
                                <th class="col-md-3 sortable">
                                   	 <span class="line"></span>描述
                                </th>
                                <th class="col-md-3 sortable">
                                    <span class="line"></span>操作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <!-- <tr class="first">
                            <td>超级管理员</td>
                            <td>最高权限的管理员</td>
                            <td>
		                        <a class="btn-flat icon editRole" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <button class="btn-danger btn" title="删除">
		                            <i class="icon-trash"></i>
		                        </button>
	                        </td>
                        </tr>
                        row
                        <tr>
                            <td>管理员</td>
                            <td>普通权限的管理员</td>
                            <td>
		                        <a class="btn-flat icon editRole" title="编辑">
		                            <i class="icon-edit"></i>
		                        </a>
		                        <button class="btn-danger btn" title="删除">
		                            <i class="icon-trash"></i>
		                        </button>
	                        </td>
                        </tr>
                        row
                        <tr>
                            <td>工作人员</td>
                            <td></td>
                            <td>
		                        <a class="btn-flat icon editRole" title="编辑">
		                            <i class="icon-edit"></i>
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
    <div class="modal fade" id="editRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">编辑用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">角色名:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">描述:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="description" placeholder="" value="">
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

<!-- Modal -->
    <div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">添加用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">角色名:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="add_name">
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
              <button type="button" class="btn btn-primary addRoleSure">保存</button>
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

 $(document).on("click",".editRole",function(){
		var roleId = $(this).attr("roleId");
  		$.post("${z:u('role/getroleinfo')}",{id:roleId},function(result){
			$("#name").val(result.name);
			$("#description").val(result.description);
			$("#editRoleModal").modal('show');
		},"json");
 });
 $(document).on("click",".addRole",function(){
		$("#addRoleModal").modal('show');
});
 $(document).on("click",".addRoleSure",function(){
  		$.post("${z:u('role/add')}",{name:$("#add_name").val(),description:$("#add_description").val()},function(result){
  			if(result==1){
  				$("#addRoleModal").modal('hide');
  				getRole(1);
  				myAlert("添加成功");
  			}
		},"json");
});
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
	function getRole(pagenum){
	 	$.post("${z:u('role/getrole')}",{page:pagenum},function(result){
	 		$(".table tbody").children("tr").remove();
			if(result.status!='-1'){
      		    var items = result.page.items;
      		    if(items.length==0)
      		    	$(".table tbody").append("<tr><td colspan='4' style=\"text-align:center\">暂无数据</td></tr>");
	      		$.each(items,function(index,content){
	        		    var tr = "<tr>"+
                            "<td>"+content.name+"</td>"+
                            "<td>"+content.description+"</td>"+
                            "<td>"+
		                    "    <a class=\"btn-flat icon editRole\" title=\"编辑\" roleId=\""+content.id+"\">"+
		                    "        <i class=\"icon-edit\"></i>"+
		                    "    </a>"+
		                    "    <button class=\"btn-danger btn deleteRole\" title=\"删除\" roleId=\""+content.id+"\">"+
		                    "        <i class=\"icon-trash\"></i>"+
		                    "    </button>"+
	                        "</td></tr>";

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
  	new uiDropdown();
    $(function(){
    	getRole(1);
    })
    </script>

</body>
</html>