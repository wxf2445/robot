<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://zlzkj.com/tags" prefix="z" %>


<!DOCTYPE html>
<html>
<head>
	<title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
<%--     <!-- bootstrap -->
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
    <link rel="stylesheet" href="${__static__}/css/compiled/index.css" type="text/css" media="screen" /> --%>


</head>
<body>



        <div id="pad-wrapper" style="text-align:center;">

            <!-- statistics chart built with jQuery Flot -->
            <div class="row chart">
                <div class="col-md-12">
                    <h4 class="clearfix">
                         <bb>监测数据</bb>
                         <div class="btn-group pull-right chartstab">
                            <button class="glow left" type="temp">温度（℃）</button>
                            <button class="glow middle" type="ph">PH值</button>
                            <button class="glow right active" type="o2">溶氧量（mg/L）</button>
                        </div>
                    </h4>
                </div>
                <div class="col-md-12">
                    <div id="statsChart"></div>
                </div>
            </div>
            
            <!-- end statistics chart -->
            <br>
            <br>
            <br>
            <br>
            <br>
	            <ul class="pagination">
	                <!-- <li><a href="javascript:void(0)" title="上一页">&laquo;上一页</a></li>
	                <li><a href="javascript:void(0)" title="上一条">&lt;前移</a></li>
	                <li class="active"><a href="javascript:void(0)">1</a></li>
	                <li><a href="javascript:void(0)">2</a></li>
	                <li><a href="javascript:void(0)">3</a></li>
	                <li><a href="javascript:void(0)">4</a></li>
	                <li><a href="javascript:void(0)" title="下一条">&gt; 后移</a></li>
	                <li><a href="javascript:void(0)" title="下一页">&raquo;下一页</a></li> -->
	            </ul>
		</div>


	<!-- scripts -->
     <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap.min.js"></script>
    <script src="${__static__}/js/jquery-ui-1.10.2.custom.min.js"></script>
    <!-- knob -->
    <script src="${__static__}/js/jquery.knob.js"></script>
    <!-- flot charts -->
    <script src="${__static__}/js/jquery.flot.js"></script>
    <script src="${__static__}/js/jquery.flot.stack.js"></script>
    <script src="${__static__}/js/jquery.flot.resize.js"></script>

    <script type="text/javascript">
    function createCharts(map){

    	var datas = new Array();
    	var times = new Array();
    	var coors = new Array();

    	for(var i=0;i<map.length;i++){
    		datas[i] = [i,parseFloat(map[i].data)];
    		times[i] = [i,map[i].time.replace(' ','<br>')];
    		coors[i] = map[i].coordinate;
		}
		var ticks = times;//getArrayData(x_axis);
		var data = datas;//getArrayData(y_axis);
		
        
        var plot = $.plot($("#statsChart"),
            [ { data: data, label: ""}/* ,
             { data: visitors, label: "ph值" } */], {
                series: {
                    lines: { show: true,
                            lineWidth: 1,
                            fill: true, 
                            fillColor: { colors: [ { opacity: 0.1 }, { opacity: 0.13 } ] }
                         },
                    points: { show: true, 
                             lineWidth: 2,
                             radius: 3
                         },
                    shadowSize: 0,
                    stack: true
                },
                grid: { hoverable: true, 
                       clickable: true, 
                       tickColor: "#f9f9f9",
                       borderWidth: 0
                    },
                legend: {
                        // show: false
                        labelBoxBorderColor: "#fff"
                    },  
                colors: [ "#30a0eb"],
                xaxis: {
                    ticks: ticks,
                    font: {
                        size: 12,
                        family: "Open Sans, Arial",
                        variant: "small-caps",
                        color: "#697695"
                    }
                },
                yaxis: {
                    ticks:3, 
                    tickDecimals: 0,
                    font: {size:12, color: "#9da3a9"}
                }
             });

             function showTooltip(x, y, contents) {
            $('<div id="tooltip">' + contents + '</div>').css( {
                position: 'absolute',
                display: 'none',
                top: y - 60,
                left: x - 50,
                color: "#fff",
                padding: '2px 5px',
                'border-radius': '6px',
                'background-color': '#000',
                opacity: 0.80
            }).appendTo("body").fadeIn(200);
        } 

        var previousPoint = null;
        $("#statsChart").bind("plothover", function (event, pos, item) {
            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;

                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(0),
                        y = item.datapoint[1].toFixed(2);

                    var month = item.series.xaxis.ticks[item.dataIndex].label;

                    showTooltip(item.pageX, item.pageY,
                                 month + "<br>数据为：" + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });
    }
    function getDataByTypeAndPage(pagenum){
    	$.post("${z:u('data/getdata')}",{type:$(".chartstab .active").attr("type"),page:pagenum},function(result){
    		if(result.status!='-1'){
      		    //window.location="${z:u('/')}";
      		    var items = result.data.datas.page.items;
        		var logPage = "";/* <ul class=\"pagination\" > */
                var page = result.data.datas.showPages;
                if (pagenum == 1)
                    logPage += "<li class=\"disabled\"><a>&laquo;</a></li>";
                else
                    logPage += "<li> <a onclick=\"getDataByTypeAndPage(" + (pagenum - 1) + ")\"><span>&laquo;</span></a> </li>";
                //alert(logs.showPages);
                $.each(page, function (index, content) {
                    if (content == pagenum) {
                        logPage += "<li class=\"active disabled\"><a>" + content + "</a></li>";
                    } else if (content == 0) {
                        logPage += "<li><a>...</a></li>";
                    } else {
                        logPage += "<li><a onclick=\"getDataByTypeAndPage(" + content + ")\"><span>" + content + "</span></a> </li>";
                    }
                });
                if (pagenum == result.data.datas.page.totalPage)
                    logPage += "<li class=\"disabled\"><a>&raquo;</a></li>";
                else
                    logPage += "<li> <a onclick=\"getDataByTypeAndPage(" + (pagenum + 1) + ")\" ><span>&raquo;</span></a></li>";
                //logPage += "</ul>";
                $(".pagination").html(logPage);
        		createCharts(items);
    		}else{
    			alert(result.info);
    		}
    	},"json");
    }
        $(function () {
        	/* [[1, "JAN"], [2, "FEB"], [3, "MAR"], [4,"APR"], [5,"MAY"], [6,"JUN"], 
                        [7,"JUL"], [8,"AUG"], [9,"SEP"], [10,"OCT"], [11,"NOV"], [12,"DEC"]],
    		var array = new Array(1.50,1.40,1.45,1.23,1.55,  1.65,1.61,1.70,1.65,1.75,1.57,1.59); */
    		/* var text =   "[{'time':'2016-11-19 01:37','data':'8.50','coordinate':'(120.350666,30.316745)'},"+
				            "{'time':'2016-11-19 02:37','data':'9.40','coordinate':'(120.350666,30.316745)'},"+
							  "{'time':'2016-11-19 03:37','data':'8.45','coordinate':'(120.350666,30.316745)'},"+
							  "{'time':'2016-11-19 04:37','data':'9.23','coordinate':'(120.350666,30.316745)'},"+
							  "{'time':'2016-11-19 05:37','data':'9.55','coordinate':'(120.350666,30.316745)'},"+
							  "{'time':'2016-11-19 06:37','data':'8.65','coordinate':'(120.350666,30.316745)'},"+
							  "{'time':'2016-11-19 07:37','data':'8.61','coordinate':'(120.350666,30.316745)'},"+
							  "{'time':'2016-11-19 08:37','data':'8.70','coordinate':'(120.350666,30.316745)'},"+
							  "{'time':'2016-11-19 09:37','data':'8.75','coordinate':'(120.350666,30.316745)'},"+
							  "{'time':'2016-11-19 10:37','data':'9.57','coordinate':'(120.350666,30.316745)'}]";
				obj = eval ("(" + text + ")"); */
        	getDataByTypeAndPage(1);
        });
        $(".chartstab button").on("click",function(){
        	$(".chartstab button.active").removeClass("active");
        	$(this).addClass("active");
        	getDataByTypeAndPage(1);
        });
    </script>
 <%--    function drawLine(x0,y0,x1,y1,color)
 {
 var rs = "";
 if (y0 == y1)  //画横线
  {
  if (x0>x1){var t=x0;x0=x1;x1=t}  
  rs = "<span style='top:"+y0+";left:"+x0+";position:absolute;font-size:1px;background-color:"+color+";height:1; width:"+Math.abs(x1-x0)+"'></span>";
  }
 else if (x0 == x1)  //画竖线
  {
  if (y0>y1){var t=y0;y0=y1;y1=t} 
  rs = "<span style='top:"+y0+";left:"+x0+";position:absolute;font-size:1px;background-color:"+color+";width:1;height:"+Math.abs(y1-y0)+"'></span>";
  }
 else
  {
  var lx = x1-x0
  var ly = y1-y0
  var l = Math.sqrt(lx*lx+ly*ly)
  rs = new Array();
  for (var i=0;i<l;i+=1)
   {
   var p = i/l;
   var px = parseInt(x0 + lx*p);
   var py = parseInt(y0 + ly*p);
   rs[rs.length] = "<span style='top:"+py+";left:"+px+";height:1;width:1;position:absolute;font-size:1px;background-color:"+color+"'></span>";
   }
  rs = rs.join("");
  }
 return rs
 } --%>
</body>
</html>