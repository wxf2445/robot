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
                    <h3>设置标准值 </h3>
                </div>                
            </div>

            <!-- gallery wrapper -->
            <div class="gallery-wrapper">
                <div class="row gallery-row">
                    <!-- single image -->
                    <div class="col-md-9 img-container">
                    
                        <div class="alert alert-info">
                          	  温度
                        </div>
                        
  						<label id="temp">温度正常值范围：${temp_l}℃  - ${temp_r}℃</label>
                        <div class="slider slider-tem" v="(${temp_l},${temp_r})"><bb style="float:left">0℃</bb><bb style="float:right">60℃</bb></div>
                        <br><br><br>
                        <div class="alert alert-success">
                          	  PH值
                        </div>
  						<label id="ph">PH值正常值范围：${ph_l}  - ${ph_r}</label>
                        <div class="slider slider-ph" v="(${ph_l},${ph_r})"><bb style="float:left">0</bb><bb style="float:right">14</bb></div>
                        <br><br><br>
                        <div class="alert alert-danger">
                          	  溶氧量
                        </div>
  						<label id="O2">溶氧量正常值范围：${o2_l}mg/L  - ${o2_r}mg/L</label>
                        <div class="slider slider-O2" v="(${o2_l},${o2_r})"><bb style="float:left">0mg/L</bb><bb style="float:right">20mg/L</bb></div>
                        <br><br><br>
                        <a class="btn-flat saveStandard">保存</a>
                    </div>
                </div>
            </div>
        </div>
        
     <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap.min.js"></script>
    <script src="${__static__}/js/jquery-ui-1.10.2.custom.min.js"></script>
    
    <script type="text/javascript">
var temp_l = ${temp_l};
var temp_r = ${temp_r};
var ph_l = ${ph_l};
var ph_r = ${ph_r};
var o2_l = ${o2_l};
var o2_r = ${o2_r};
    $(".slider-tem").slider({
        range: true,
        min: 0,
        max: 60,
        values: [ ${temp_l}, ${temp_r} ],
        step: 0.1,
        slide: function( event, ui ) {
            $( "#temp" ).html("温度正常值范围："+ ui.values[ 0 ] + "℃     - " + ui.values[ 1 ]+"℃" );
            $(".slider-tem").attr("v","("+ui.values[ 0 ]+","+ui.values[ 1 ]+")");
          }
    });
    $(".slider-ph").slider({
        range: true,
        min: 0,
        max: 14,
        values: [ ${ph_l}, ${ph_r} ],
        step: 0.1,
        slide: function( event, ui ) {
            $( "#ph" ).html("PH值正常值范围："+ ui.values[ 0 ] + "  - " + ui.values[ 1 ]);
            $(".slider-ph").attr("v","("+ui.values[ 0 ]+","+ui.values[ 1 ]+")");
          }
    });
    $(".slider-O2").slider({
        range: true,
        min: 0,
        max: 20,
        values: [ ${o2_l}, ${o2_r} ],
        step: 0.1,
        slide: function( event, ui ) {
            $( "#O2" ).html("溶氧量正常值范围："+ ui.values[ 0 ] + "mg/L  - " + ui.values[ 1 ]+"mg/L");
            $(".slider-O2").attr("v","("+ui.values[ 0 ]+","+ui.values[ 1 ]+")");
          }
    });
    $(".saveStandard").on("click",function(){
    	var temStandard = $(".slider-tem").attr("v");
    	var o2Standard = $(".slider-ph").attr("v");
    	var phStandard = $(".slider-O2").attr("v");
    	//alert(temStandard+" "+o2Standard+" "+phStandard);
    	$.post("${z:u('data/standard')}",{temp:temStandard,o2:o2Standard,ph:phStandard},function(result){
    		if(result.status!='-1'){
    			myAlert("修改成功")
    		}else{
    			myAlert(result.info);
    		}
    	},"json");
    })
    </script>
</body>
</html>