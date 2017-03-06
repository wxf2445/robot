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
                    <h3>服务器信息</h3>
                </div>                
            </div>

           <!-- gallery wrapper -->
            <div class="row form-wrapper">
                <div class="col-md-8 column">
                    <div class="field-box">
                        <label>服务器ip地址:</label>
                        <div class="col-md-7 ">
                        	<label class="form-control" id="ipaddress"><!-- 192.168.1.114 --></label>
                        </div>                            
                    </div>      
                    <div class="field-box">
                        <label>web端端口:</label>
                        <div class="col-md-7">
                        	<label class="form-control">8080</label>
                        </div>                            
                    </div>    
                    <div class="field-box">
                        <label>单片机监听端口:</label>
                        <div class="col-md-7">
                        	<label class="form-control">8086</label>
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
        $(function(){
    		$.post("${z:u('server/getip')}",{},function(result){
    			$("#ipaddress").html(result);
	    	},"json"); 
        });
        </script>
</body>
</html>