<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://zlzkj.com/tags" prefix="z" %>


<!DOCTYPE html>
<html>
<head>
	<title>相册效果 Bootstrap响应式后台管理系统模版Detail - JS代码网</title>
	<meta name="keywords" content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文,后台管理系统模版,后台模版下载,后台管理系统,后台管理模版" />
	<meta name="description" content="JS代码网提供Bootstrap模版,后台管理系统模版,后台管理界面,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
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
    <link rel="stylesheet" href="${__static__}/css/compiled/gallery.css" type="text/css" media="screen" />

    <!-- open sans font -->
    
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>

        
        <div id="pad-wrapper" class="gallery">
            <div class="row header">
                <div class="col-md-12">
                    <h3>Gallery</h3>
                </div>                
            </div>

            <!-- gallery wrapper -->
            <div class="gallery-wrapper">
                <div class="row gallery-row">
                    <!-- single image -->
                    <div class="col-md-3 img-container">
                        <div class="img-box">
                            <span class="icon edit">
                                <a data-toggle="modal" href="#myModal"><i class="gallery-edit"></i></a>
                            </span>
                            <span class="icon trash">
                                <i class="gallery-trash"></i>
                            </span>
                            <img src="${__static__}/img/gallery3.jpg" class="img-responsive" />
                            <p class="title">
                                Beach pic title
                            </p>
                        </div>
                    </div>
                    <!-- single image -->
                    <div class="col-md-3 img-container">
                        <div class="img-box">
                            <span class="icon edit">
                                <a data-toggle="modal" href="#myModal"><i class="gallery-edit"></i></a>
                            </span>
                            <span class="icon trash">
                                <i class="gallery-trash"></i>
                            </span>
                            <img src="${__static__}/img/gallery2.jpg" class="img-responsive" />
                            <p class="title">
                                Beach pic title 2 
                            </p>
                        </div>
                    </div>
                    <!-- single image -->
                    <div class="col-md-3 img-container">
                        <div class="img-box">
                            <span class="icon edit">
                                <a data-toggle="modal" href="#myModal"><i class="gallery-edit"></i></a>
                            </span>
                            <span class="icon trash">
                                <i class="gallery-trash"></i>
                            </span>
                            <img src="${__static__}/img/gallery1.jpg" class="img-responsive" />
                            <p class="title">
                                Beach pic title 3
                            </p>
                        </div>
                    </div>
                    <!-- single image -->
                    <div class="col-md-3 img-container">
                        <div class="img-box">
                            <span class="icon edit">
                                <a data-toggle="modal" href="#myModal"><i class="gallery-edit"></i></a>
                            </span>
                            <span class="icon trash">
                                <i class="gallery-trash"></i>
                            </span>
                            <img src="${__static__}/img/gallery3.jpg" class="img-responsive" />
                            <p class="title">
                                Beach pic title
                            </p>
                        </div>
                    </div> 
                </div>
                <div class="row gallery-row">
                    <!-- single image -->
                    <div class="col-md-3 img-container">
                        <div class="img-box">
                            <span class="icon edit">
                                <a data-toggle="modal" href="#myModal"><i class="gallery-edit"></i></a>
                            </span>
                            <span class="icon trash">
                                <i class="gallery-trash"></i>
                            </span>
                            <img src="${__static__}/img/gallery2.jpg" class="img-responsive" />
                            <p class="title">
                                Beach pic title 2 
                            </p>
                        </div>
                    </div>
                    <!-- single image -->
                    <div class="col-md-3 img-container">
                        <div class="img-box">
                            <span class="icon edit">
                                <a data-toggle="modal" href="#myModal"><i class="gallery-edit"></i></a>
                            </span>
                            <span class="icon trash">
                                <i class="gallery-trash"></i>
                            </span>
                            <img src="${__static__}/img/gallery1.jpg" class="img-responsive" />
                            <p class="title">
                                Beach pic title 3
                            </p>
                        </div>
                    </div>

                    <!-- new image button -->
                    <div class="col-md-3 new-img">
                        <a data-toggle="modal" href="#myModal">
                            <img src="${__static__}/img/new-gallery-img.png" class="img-responsive" />
                        </a>
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


	<!-- this page scripts -->
    <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap.min.js"></script>
</body>
</html>