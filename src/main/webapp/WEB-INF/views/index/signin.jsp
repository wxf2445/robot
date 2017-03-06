<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://zlzkj.com/tags" prefix="z" %>

<!DOCTYPE html>
<html class="login-bg">
<head>
	<title>火龙科技</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
    <!-- bootstrap -->
    <link href="${__static__ }/css/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="${__static__ }/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet">

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="${__static__ }/css/compiled/layout.css">
    <link rel="stylesheet" type="text/css" href="${__static__ }/css/compiled/elements.css">
    <link rel="stylesheet" type="text/css" href="${__static__ }/css/compiled/icons.css">

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="${__static__ }/css/lib/font-awesome.css">
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="${__static__ }/css/compiled/signin.css" type="text/css" media="screen" />

    <!-- open sans font -->

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>


    <!-- background switcher -->
    <%-- <div class="bg-switch visible-desktop">
        <div class="bgs">
            <a href="#" data-img="landscape.jpg" class="bg active">
                <img src="${__static__}/img/bgs/landscape.jpg" />
            </a>
            <a href="#" data-img="blueish.jpg" class="bg">
                <img src="${__static__}/img/bgs/blueish.jpg" />
            </a>            
            <a href="#" data-img="7.jpg" class="bg">
                <img src="${__static__}/img/bgs/7.jpg" />
            </a>
            <a href="#" data-img="8.jpg" class="bg">
                <img src="${__static__}/img/bgs/8.jpg" />
            </a>
            <a href="#" data-img="9.jpg" class="bg">
                <img src="${__static__}/img/bgs/9.jpg" />
            </a>
            <a href="#" data-img="10.jpg" class="bg">
                <img src="${__static__}/img/bgs/10.jpg" />
            </a>
            <a href="#" data-img="11.jpg" class="bg">
                <img src="${__static__}/img/bgs/11.jpg" />
            </a>
        </div>
    </div> --%>


    <div class="login-wrapper">
        <a href="javascript:void(0)">
            <img class="logo" src="${__static__}/images/logo.png">
        </a>

        <div class="box">
            <div class="content-wrap">
                <h6>登录</h6>
                <input class="form-control" type="text" id="account" placeholder="邮箱地址">
                <input class="form-control" type="password" id="password" placeholder="密码">
                <!-- <a href="#" class="forgot">忘记密码?</a>
                <div class="remember">
                    <input id="remember-me" type="checkbox">
                    <label for="remember-me">记住密码</label>
                </div> -->
                <a class="btn-glow primary login" href="javascript:void(0)">登录</a>
            </div>
        </div>

        <div class="no-account">
            <p>还没账号?</p>
            <a href="signup.html">注册</a>
        </div>
    </div>

	<!-- scripts -->
    <script src="${__static__}/js/jquery-latest.js"></script>
    <script src="${__static__ }/js/bootstrap.min.js"></script>
    <script src="${__static__ }/js/theme.js"></script>

    <!-- pre load bg imgs -->
    <script type="text/javascript">
        $(function () {
        	$(".login").on("click",function(){
        		  $.post("${z:u('check/login')}",{account:$("#account").val(),password:$("#password").val()},function(result){
        			console.log(result);
   	    			if(result=='1'){
   	    				location.href='${z:u('index/index')}';
   	    			}
   	    		},"json");   
        		/* var account = $("#account").val();
        		var password = $("#password").val();
        		if(account==''||password=='')return;
        		$.ajax({
        					url: "${z:u('check/login')}",
        					type: "get",
        					data:{account:account,password:password}, 
        					dataType: "jsonp",
        					jsonp: "callback",
        					success: function(json){
        						if(json.status==1){
        	   	    				location.href='${z:u('index/index')}';
        						}else{
        							//alert("密码错误或账号不存在");
        						}
        					},              
        					error: function(){                  
        						alert("网络错误");
        					}   
        				});  */
   	    	});
        	
            // bg switcher
            /* var $btns = $(".bg-switch .bg");
            $btns.click(function (e) {
                e.preventDefault();
                $btns.removeClass("active");
                $(this).addClass("active");
                var bg = $(this).data("img");

                $("html").css("background-image", "url('${__static__}/img/bgs/" + bg + "')");
            }); */

        });
    </script>
</body>
</html>