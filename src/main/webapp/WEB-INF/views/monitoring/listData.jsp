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
</style>
<body>

        <div id="pad-wrapper" >
            <div class="row header">
                <h3>列表数据</h3>
                <div style="width:800px">
                    <br><br>
                   	<div class="col-md-3"><bb class="form-control" style="border:none">时间范围:</bb></div>
                  	<div class="col-md-3"><input class="form-control input-datepicker" name="start_time" id="start_time" value=""></div>
                   	<div class="col-md-3"><input class="form-control input-datepicker" name="end_time"id="end_time"></div>
                    <a class="btn-flat" onclick="getListData(1);">搜索</a>
                </div>
            </div>

            <!-- Users table -->
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="col-md-3 sortable">
                                   	 坐标
                                </th>
                                <th class="col-md-2 sortable">
                                    <span class="line"></span>温度（℃）
                                </th>
                                <th class="col-md-2 sortable">
                                    <span class="line"></span>ph值
                                </th>
                                <th class="col-md-2 sortable">
                                    <span class="line"></span>溶氧量（mg/L）
                                </th>
                                <th class="col-md-4 sortable">
                                    <span class="line"></span>时间
                                </th>
                                <th class="col-md-4 sortable">
                                    <span class="line"></span>操作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <!-- <tr class="first">
                            <td>(120.350666,30.316745)</td>
                            <td>22</td>
                            <td>6.9</td>
                            <td>8.9</td>
                            <td>2016-11-19 21:37</td>
                            <td>
		                        <a class="btn-flat icon" title="在坐标上查看">
		                            <i class="icon-map-marker"></i>
		                        </a></td>
                        </tr>
                        row
                        <tr>
                            <td>(120.350666,30.316745)</td>
                            <td>21</td>
                            <td>7.0</td>
                            <td>8.9</td>
                            <td>2016-11-19 21:37</td>
                            <td>
		                        <a class="btn-flat icon">
		                            <i class="icon-map-marker" title="在坐标上查看"></i>
		                        </a></td>
                        </tr>
                        <tr>
                            <td>(120.350666,30.316745)</td>
                            <td>22</td>
                            <td>7.0</td>
                            <td>8.3</td>
                            <td>2016-11-19 21:37</td>
                            <td>
		                        <a class="btn-flat icon">
		                            <i class="icon-map-marker" title="在坐标上查看"></i>
		                        </a></td>
                        </tr>
                        <tr>
                            <td>(120.350666,30.316745)</td>
                            <td>22</td>
                            <td>6.9</td>
                            <td><font color="#f00"><i class="icon-exclamation-sign"></i>6.8</font></td>
                            <td>2016-11-19 21:37</td>
                            <td>
		                        <a class="btn-flat icon">
		                            <i class="icon-map-marker" title="在坐标上查看"></i>
		                        </a></td>
                        </tr> -->
                        </tbody>
                    </table>
                </div>                
            </div>
            <div class="page-div">
	            <ul class="pagination">
	                <li><a href="javasricpt:void(0)" title="上一页"><!-- &laquo; -->上一页</a></li>
	                <li class="active"><a href="javasricpt:void(0)">1</a></li>
	                <li><a href="javasricpt:void(0)">2</a></li>
	                <li><a href="javasricpt:void(0)">3</a></li>
	                <li><a href="javasricpt:void(0)">4</a></li>
	                <li><a href="javasricpt:void(0)" title="下一页"><!-- &raquo; -->下一页</a></li>
	            </ul>
            </div>
            <!-- end users table -->
        </div>


	<!-- scripts -->
     <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__}/js/bootstrap.min.js"></script>
    <script src="${__static__}/js/bootstrap-datetimepicker.js"></script>

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
    $(function(){
      	$.fn.datetimepicker.dates['zh-CN'] = {  
                days:       ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六","星期日"],  
                daysShort:  ["日", "一", "二", "三", "四", "五", "六","日"],  
                daysMin:    ["日", "一", "二", "三", "四", "五", "六","日"],  
                months:     ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月","十二月"],  
                monthsShort:  ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],  
                meridiem:    ["上午", "下午"],  
                //suffix:      ["st", "nd", "rd", "th"],  
                today:       "今天"  
        };    

    	$('.input-datepicker').datetimepicker({
            language:  'zh-CN',
            weekStart: 1,
            todayBtn:  1,
    		autoclose: 1,
    		todayHighlight: 1,
    		startView: 2,
    		forceParse: 0,
            showMeridian: 1,
            format: 'yyyy-mm-dd hh:ii:00'///
        });
    	getListData(1);
    })
    function getListData(pagenum){
    	$.post("${z:u('data/getlistdata')}",{page:pagenum,starttime:$("#start_time").val(),endtime:$("#end_time").val()},function(result){
    		if(result.status!='-1'){
      		    //window.location="${z:u('/')}";
      		    $(".table tbody").children("tr").remove();
      		    var items = result.data.datas.page.items;
      		    if(items.length==0)
      		    	$(".table tbody").append("<tr><td colspan='6' style=\"text-align:center\">暂无数据</td></tr>");
      		    $.each(items,function(index,content){
          		    var tr = ""+
	      		    	"<tr>"+
		                "    <td>"+content.coordinate+"</td>"+
		                "    <td>"+content.temp+"</td>"+
		                "    <td>"+content.ph+"</td>"+
		                "    <td>"+content.o2+"</td>"+
		                "    <td>"+content.time+"</td>"+
		                "    <td>"+
		                "        <a class=\"btn-flat icon\">"+
		                "            <i class=\"icon-map-marker\" title=\"在坐标上查看\"></i>"+
		                "        </a></td>"+
		                "</tr>";
            		  $(".table tbody").append(tr);
      		    });
        		var logPage = "";/* <ul class=\"pagination\" > */
                var page = result.data.datas.showPages;
                if (pagenum == 1)
                    logPage += "<li class=\"disabled\"><a>&laquo;</a></li>";
                else
                    logPage += "<li> <a onclick=\"getListData(" + (pagenum - 1) + ")\"><span>&laquo;</span></a> </li>";
                //alert(logs.showPages);
                $.each(page, function (index, content) {
                    if (content == pagenum) {
                        logPage += "<li class=\"active disabled\"><a>" + content + "</a></li>";
                    } else if (content == 0) {
                        logPage += "<li><a>...</a></li>";
                    } else {
                        logPage += "<li><a onclick=\"getListData(" + content + ")\"><span>" + content + "</span></a> </li>";
                    }
                });
                if (pagenum == result.data.datas.page.totalPage)
                    logPage += "<li class=\"disabled\"><a>&raquo;</a></li>";
                else
                    logPage += "<li> <a onclick=\"getListData(" + (pagenum + 1) + ")\" ><span>&raquo;</span></a></li>";
                //logPage += "</ul>";	
                $(".pagination").html(logPage);
        		//createCharts(items);
    		}else{
    			alert(result.info);
    		}
    	},"json");
    }
    </script>

</body>
</html>