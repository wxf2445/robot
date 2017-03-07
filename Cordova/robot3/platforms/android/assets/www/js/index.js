/*---baidu map8 */

var server_path = "http://192.168.1.102:8080/robot/";
var websocket_path = "//192.168.1.102:8080/robot/";
if(localStorage.getItem("server_path")!=null)
	server_path = "http://"+server_path+":8080/robot/";
if(localStorage.getItem("websocket_path")!=null)
	websocket_path = "http://"+websocket_path+":8080/robot/";
/*$.ajax({
    type: "get",
    url: "link.json",
    async: false,
    dataType: 'text',
    success: function(data) {
  	  var json = JSON.parse(data);
  	  server_path = json.server_path;
  	  websocket_path = json.websocket_path;
    },
    error:function(e){
    }
});*/

function closeAlert(this_){
		$(this_).parent().popup('close')
	}
		$(function(){
			$(".openPopup").on("click",function(){
				$(this).closest("div[data-role=page]").find("div[data-role=popup]").popup('open');
			})
			$(".panel-navigation li").on("click",function(){
				var url = $(this).attr("href");
				if(url==null||url=='')return;
				$.mobile.changePage(url,  { transition: "slide"}); 
			})
			$(".openpanel").on("click",function(){
				var url = $(this).attr("panel");
				//$(url).trigger( "updatelayout" );
				$(url).panel( "open" , "push" );
			})
			$("a").not("[data-rel=back],[data-rel=popup]").on("click",function(){
				var url = $(this).attr("href");
				/*var data_transition = $(this).attr("data-transition");*/
				if(url==null||url=='')return;
				/*if(data_transition==null||data_transition=='')
					data_transition = "fade";*/
				$.mobile.changePage(url, "fade");
			})
			$(".warn-div").on("click",function(){
				$.mobile.changePage( "#dialog", { role: "dialog" } );
			})
		}) 
		
		

function getCharts(id,map){
    	var datas = new Array();
    	var times = new Array();
    	var coors = new Array();
    	for(var i=0;i<map.length;i++){
    		datas[i] = parseFloat(map[i].data);
    		times[i] = map[i].time;
    		coors[i] = map[i].coor;
		}
    	//console.log(datas)
		var ticks = times;//getArrayData(x_axis);
		var data = datas;//getArrayData(y_axis);
		
		$(id).highcharts({
	        title: {
	            text: '监测数据表',
	            x: 0 //center
	        },
	        subtitle: {
	            text: '',
	            x: 0
	        },
	        xAxis: {
	            categories: ticks
	            ,
	                    labels: {
                            rotation: 0, 
	                        y: 0, //x轴刻度往下移动20px
	                        style: {
	                            color: '#fff',//颜色
                            	fontSize:'1px',  //字体
	                        }
	                    },
	        },
	        yAxis: {
	            title: {
	                text: ''
	            },
	            /*plotLines: [{
	                value: 12,
	                width: 23,
	                color: '#808080'
	            }],*/
	            labels: {
                    rotation: 0, 
	                y: 0, //x轴刻度往下移动20px
	                style: {
	                    color: '#000',//颜色
	                    fontSize:'1px'  //字体
	                }
	            }
	        },
	        tooltip: {
	            valueSuffix: 'mg/L'
	        },
	        legend: {
	            layout: 'vertical',
	            align: '',
	            verticalAlign: 'top',
	            borderWidth: 0
	        },
            scrollbar: {
		       enabled: true
		    },
	        series: [{
	            name: '溶氧量',
	            data: data
	        }]
	    });
	    $(".highcharts-credits").remove();
	}


var opt_data = {
    preset: 'date', //日期格式 date（日期）|datetime（日期加时间）
    theme: 'jqm', //皮肤样式
    display: 'modal', //显示方式
    mode: 'clickpick', //日期选择模式
    dateFormat: 'yy-mm-dd', // 日期格式
    setText: '确定', //确认按钮名称
    cancelText: '取消',//取消按钮名籍我
    dateOrder: 'yymmdd', //面板中日期排列格式
    dayText: '日', monthText: '月', yearText: '年', //面板中年月日文字
    yearText: '年', monthText: '月',  dayText: '日',  //面板中年月日文字
    endYear:2020, //结束年份
    showNow:true,
    nowText:'今天',
    hourText:'小时',
    minuteText:'分'
};




// 使用定义插件
$(document).on("pageinit", "#chart", function(){
	$("#txtBirthday").mobiscroll(opt_data);
});
$(document).on("click", ".warningDetail", function(){
	$.mobile.changePage("#warningDetail", "fade");
});

function getRandomMap(){
	var txt = "[";
	for(var i=0;i<9;i++)
		txt += "{'time':'2016-11-19 "+i+":37','data':'"+(Math.random()*10).toFixed(2)+"','coor':'(120.350666,30.316745)'},";
	txt += "{'time':'2016-11-19 10:37','data':'"+(Math.random()*10).toFixed(2)+"','coor':'(120.350666,30.316745)'}]";
	return eval ("(" + txt + ")");;
}
$(document).on('pageshow', '#chart', function(){
	var text =   "[{'time':'2016-11-19 01:37','data':'8.50','coor':'(120.350666,30.316745)'},"+
		            "{'time':'2016-11-19 02:37','data':'9.40','coor':'(120.350666,30.316745)'},"+
					  "{'time':'2016-11-19 03:37','data':'8.45','coor':'(120.350666,30.316745)'},"+
					  "{'time':'2016-11-19 04:37','data':'9.23','coor':'(120.350666,30.316745)'},"+
					  "{'time':'2016-11-19 05:37','data':'9.55','coor':'(120.350666,30.316745)'},"+
					  "{'time':'2016-11-19 06:37','data':'8.65','coor':'(120.350666,30.316745)'},"+
					  "{'time':'2016-11-19 07:37','data':'8.61','coor':'(120.350666,30.316745)'},"+
					  "{'time':'2016-11-19 08:37','data':'8.70','coor':'(120.350666,30.316745)'},"+
					  "{'time':'2016-11-19 09:37','data':'8.75','coor':'(120.350666,30.316745)'},"+
					  "{'time':'2016-11-19 10:37','data':'9.57','coor':'(120.350666,30.316745)'}]";
		obj = eval ("(" + text + ")");
	getCharts("#chartDiv",obj); 
	getCharts("#chartDiv1",getRandomMap()); 
	
	var mySwiper = new Swiper ('.swiper-container', {
	    direction: 'horizontal',
	    loop: false,
	    scrollbar: '.swiper-scrollbar',
		onSlideChangeEnd: function(swiper){
			var count = $(".swiper-container div.swiper-slide").length;
				if(swiper.activeIndex+1==count){
			  		mySwiper.appendSlide("<div id=\"chartDiv"+count+"\" class=\"swiper-slide\"></div>");
			  		//mySwiper.slideTo(count);
			  		getCharts("#chartDiv"+count,getRandomMap())
				}
		    }
	  }) 
    });


//login

$(document).on("click",".login",function(){
	var account = $("#account").val();
	var password = $("#password").val();
	if(account==''||password=='')return;
	/*$.post(server_path+'check/login',{account:account,password:password},function(result){
		if(result==1){
			$.mobile.changePage("#home", "fade");
			websocket_init();
		}
	},"json"); */
	$.ajax({
				url: server_path+"app/login",
				type: "get",
				data:{account:account,password:password}, 
				dataType: "jsonp",
				jsonp: "callback",
				success: function(json){
					if(json.status==1){
						$.mobile.changePage("#home", "fade");
						websocket_init();
					}else{
						alert("密码错误或账号不存在");
					}
				},              
				error: function(){                  
					alert("网络错误");
				}   
			}); 
});
function moving(index){
	if(index==3)
		index=1;
	else
		index++;
	var str = "";
	for(var i=0;i<index;i++)
		str +="."; 
	$(".moveto").html("<i class=\"icon-location-circled\"></i>移动中"+str);
	
	timeout = setTimeout("moving("+index+")",500);
}

$(document).on("click",".moveto",function(){
	$.ajax({
		url: server_path+"app/move",
		type: "get",
		data:{}, 
		dataType: "jsonp",
		jsonp: "callback",
		success: function(json){
			timeout = setTimeout("moving(1)",500);
		},              
		error: function(){                  
			alert("网络错误");
		}   
	}); 
});

//getwarning

	function getWarning(){
		$.post(server_path+'app/getwarning',{},function(result){
			$("#warning content ul").html();
			$(".alert_p").html();
			$.each(result,function(index,content){
				var li = 
					"<li class=\"warningDetail\">"+
			        "	<p style=\"white-space: normal !important;\">警报："+content.content+"</p>"+
					"</li>"+
				$("#warning content ul").append(li);
		        
				var p = "<p class=\"warningDetail\" warningId=\""+content.id+"\">警报："+content.content+"</p>";
				$(".alert_p").append(p);
			})
				//alert(msg.content);
		},"json"); 
	}






















