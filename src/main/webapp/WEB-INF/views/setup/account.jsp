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
	
    <!-- bootstrap -->
    <link href="${__static__}/css/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="${__static__}/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet">

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/layout.css">
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/elements.css">
    <link rel="stylesheet" type="text/css" href="${__static__}/css/compiled/icons.css">

    <!-- libraries -->
    <link href="${__static__}/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    

    <!-- this page specific styles -->
    <link rel="stylesheet" href="${__static__}/css/compiled/form-showcase.css" type="text/css" media="screen" />

    <!-- open sans font -->
    
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<style>
.contentCenter{
	text-align:center;
}
</style>
<body>

        
        <div id="pad-wrapper" class="form-page">
            <div class="row header">
                <div class="col-md-12">
                    <h3>账户设置</h3>
                </div>                
            </div>

           <!-- gallery wrapper -->
            <div class="row form-wrapper">
                <div class="col-md-8 column">
                    <div class="field-box">
                        <label>头像:</label>
                        <div class="col-md-7 contentCenter">
                        	<div style="float:left;overflow:hidden;border-radius:5px;height:100px;width:100px;">
                				<img id="img" alt="" src="${z:u('file/openfile')}?filepath=${user.headImage}" error="${__static__}/images/lll.jpg" height="100px">
                        	</div>
                        	<div style="position:absolute;left:230px;top:0px;overflow:hidden;border-radius:5px;height:100px;width:100px;line-height:100px;margin-left:30px">
		                       <a class="btn-flat icon" title="更换头像">
		                           <i class="icon-folder-open"></i>更换头像
		                       </a>
                        	</div>
                        	<form action="${z:u('headimage') }" method="post" enctype="multipart/form-data" id="imageForm">
                        		<input type="file" id="headImage" name="headImage" style="position:absolute;filter:alpha(opacity=0);opacity:0;left:260px;top:0px;height:100px;width:100px;">
                        	</form>
		                    	
                        </div>                            
                    </div>    
                    <div class="field-box">
                        <label>默认机器人:</label>
                        <div class="col-md-7">
                        	<label class="form-control choosedefaultrobot">${user.robotNo }</label>
                        	&nbsp;&nbsp;
                        	<a class="btn-flat icon chooseDefault" title="更换">
                           		<i class="icon-edit"></i>更换
                       		</a>
                        </div>                            
                    </div>   
                    <div class="field-box">
                        <label>昵称:</label>
                        <div class="col-md-7 ">
                            <input class="form-control" type="text" value="${user.name }" id="name"/>
                        </div>                            
                    </div>      
                    <div class="field-box">
                        <label>联系方式:</label>
                        <div class="col-md-7">
                            <input class="form-control" type="text" value="${user.phone }" id="phone" />
                        </div>                            
                    </div>    
                    <div class="field-box">
                        <label>描述:</label>
                        <div class="col-md-7">
                            <input class="form-control" type="text" value="${user.description }" id="description"/>
                        </div>                            
                    </div>      
                    <div class="field-box">
                        <label></label>
                        <div class="col-md-7">
                      <button class="btn-success btn saveinfo" title="保存信息">
                          <i class="icon-download-alt"></i>保存信息
                      </button>
                        </div>                               
                    </div>      
                </div>
            </div>
        </div>
        
        
          <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">Add new image</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">Image:</label>
                        <div class="col-lg-10">
                            <input type="file" id="input1" class="pull-left" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-lg-2 control-label">Description:</label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" id="inputPassword1" placeholder="Description">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
              <!-- Modal -->
    <div class="modal fade" id="chooseDefaultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">选择默认机器人</h4>
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
    <script src="${__static__}/js/drawLine/jquery-ui-1.9.2.custom.js"></script>
    <script src="${__static__}/js/jquery-form.js"></script>
<%--      <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/jquery-ui-1.10.2.custom.min.js"></script>
    <!-- knob -->
    <script src="${__static__}/js/jquery.knob.js"></script> --%>
        <script type="text/javascript">
        function toJson(str){
        	 var json = eval('(' + str + ')');
        	 return json;
        	}
        $("#headImage").on("change",function(){
            $("#imageForm").ajaxSubmit({
                success: function(data) {  
                	$("#img").attr("src","${z:u('file/openfile')}?filepath="+toJson(data).image);    
                 }
            });       
        });
        $(".chooseDefault").on("click",function(){

    		$.post("${z:u('user/getallrobot')}",{},function(result){
    			$("#chooseDefaultModal .modal-body").html("");
    			$.each(result,function(index,content){
    	        	$("#chooseDefaultModal .modal-body").append("<a class=\"btn-flat icon robotc\" robotId=\""+content.id+"\">"+content.robotNo+"</a>&nbsp;&nbsp;");
    			});
				$("#chooseDefaultModal").modal('show');
    		},"json"); 
        });
        $(document).on("click",".robotc",function(){
			var robotId = $(this).attr("robotId");
			var robotNo = $(this).html();
    		$.post("${z:u('user/defaultrobot')}",{id:robotId},function(result){
            	$(".choosedefaultrobot").html(robotNo);
    			$("#chooseDefaultModal").modal('hide');
    		},"json"); 
        });
        $(document).on("click",".saveinfo",function(){
    		$.post("${z:u('user/saveinfo')}",{name:$("#name").val(),phone:$("#phone").val(),description:$("#description").val()},function(result){
            	
    		},"json"); 
        })
        </script>
</body>
</html>