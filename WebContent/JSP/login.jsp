<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/layer/mobile/need/layer.css">

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/CSS/layer/layer.js"></script>
<script src="<%=request.getContextPath()%>/jquery.js"></script>
<title>登陆</title>
 <style type="text/css">
        * {
            box-sizing: border-box;
        }
       body {
            margin: 0;
            padding: 0;
            font: 16px/20px microsft yahei;
        }
        .head{
            margin-top: 0;
            padding: 1% 0;
            height: 10%;
            background: #000000 ;
        }
       .head input[type="button"]{
            color: #FFFFFF;
            background: #000000;
            border: none;
        }

        .wrap {
            margin-top: 0px;
            width: 100%;
            height: 100%;
            padding: 10% 0;
            position: relative;
            opacity: 0.8;
            background: linear-gradient(to bottom right,#000000, #656565);
            /* 背景 渐变 */
        }
        .container {
            width: 60%;
            margin: 0 auto;
        }
        .container h1 {
            text-align: center;
            color: #FFFFFF;
            font-weight: 500;
        }
       .container input {
            width: 320px;
            display: block;
            height: 36px;
            border: 0;
            outline: 0;
            padding: 6px 10px;
            line-height: 24px;
            margin: 32px auto;
            -webkit-transition: all 0s ease-in 0.1ms;
            -moz-transition: all 0s ease-in 0.1ms;
            transition: all 0s ease-in 0.1ms;
        }
        .container input[type="text"] , .container input[type="password"]  {
            background-color: #FFFFFF;
            font-size: 16px;
            color: #50a3a2;
        }
        .container input[type='submit'] {
            font-size: 16px;
            letter-spacing: 2px;
            color: #666666;
            background-color: #FFFFFF;
        }
        .container input[type='submit']:hover {
            cursor: pointer;
            font-weight: bold;
        }
        .to_login{
            color: #a7c4c9;
        }
        .text{
            color: #e2dfe4;
        }
        .wrap ul {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            bottom: 0px;
            height: 100%;
            z-index: -20;
        }
        .wrap ul li {
            list-style-type: none;
            display: block;
            position: absolute;
            bottom: 0px;
            width: 15px;
            height: 15px;
            z-index: -8;
            border-radius: 50%;   /*圆*/
            background-color:rgba(255, 255, 255, 0.15);
            animotion: square 25s infinite; /*动画捆绑到选择器 无限循环*/
            -webkit-animation: square 25s infinite;
        }
        .wrap ul li:nth-child(1) {
            left: 0;
            animation-duration: 10s;
            -moz-animation-duration: 10s;
            -o-animation-duration: 10s;
            -webkit-animation-duration: 10s;
        }
        .wrap ul li:nth-child(2) {
            width: 40px; /*覆盖了圆的大小，变大了*/
            height: 40px;
            left: 10%;  /*离左边的距离*/
            animation-duration: 15s;
            -moz-animation-duration: 15s;
            -o-animation-duration: 15s;
            -webkit-animation-duration: 11s;
        }
        .wrap ul li:nth-child(3) {
            left: 20%;
            width: 60px;
            height: 60px;
            animation-duration: 12s;
            -moz-animation-duration: 12s;
            -o-animation-duration: 12s;
            -webkit-animation-duration: 12s;
        }
        .wrap ul li:nth-child(4) {
            width: 50px;
            height: 50px;
            left: 30%;
            -webkit-animation-delay: 3s;  /*谷歌 safari*/
            -moz-animation-delay: 3s; /*火狐*/
            -o-animation-delay: 3s;  /*opera*/
            animation-delay: 3s;
            animation-duration: 12s;
            -moz-animation-duration: 12s;
            -o-animation-duration: 12s;
            -webkit-animation-duration: 12s;
            /*等待3秒，然后开始动画 动画在12秒内完成*/
        }
        .wrap ul li:nth-child(5) {
            width: 60px;
            height: 60px;
            left: 40%;
            animation-duration: 10s;
            -moz-animation-duration: 10s;
            -o-animation-duration: 10s;
            -webkit-animation-duration: 10s;
        }
        .wrap ul li:nth-child(6) {
            width: 75px;
            height: 75px;
            left: 50%;
            -webkit-animation-delay: 2s;
            -moz-animation-delay: 2s;
            -o-animation-delay: 2s;
            animation-delay: 2s;
        }
        .wrap ul li:nth-child(7) {
            left: 60%;
            width: 30px;
            height: 30px;
            animation-duration: 8s;
            -moz-animation-duration: 8s;
            -o-animation-duration: 8s;
            -webkit-animation-duration: 8s;
        }
        .wrap ul li:nth-child(8) {
            width: 90px;
            height: 90px;
            left: 70%;
            -webkit-animation-delay: 4s;
            -moz-animation-delay: 4s;
            -o-animation-delay: 4s;
            animation-delay: 4s;
        }
        .wrap ul li:nth-child(9) {
            width: 50px;
            height: 50px;
            left: 80%;
            animation-duration: 20s;
            -moz-animation-duration: 20s;
            -o-animation-duration: 20s;
            -webkit-animation-duration: 20s;
        }
        .wrap ul li:nth-child(10) {
            width: 75px;
            height: 75px;
            left: 90%;
            -webkit-animation-delay: 6s;
            -moz-animation-delay: 6s;
            -o-animation-delay: 6s;
            animation-delay: 6s;
            animation-duration: 30s;
            -moz-animation-duration: 30s;
            -o-animation-duration: 30s;
            -webkit-animation-duration: 30s;
        }


        @keyframes square {   /*动画*/
            0%  {   /*开始 from*/
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
            100% { /*结束 to*/
                bottom: 600px; /*动画的盒子大小*/
                -webkit-transform: translateY(600); /* 离y轴有600 */
                transform: translateY(600);
            }
        }
        @-webkit-keyframes square {
            0%  {
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
            100% {
                bottom: 600px;
                -webkit-transform: translateY(600);
                transform: translateY(600);
            }
        }
    </style>
</head>
<body>
<div class="head">
        <input type="button" value="返回" onclick="javascript:history.back();" />
        
    </div>
<div class="wrap">
    <div class="container">
        <h1>登陆用户</h1>
        <form method="post">
            <input type="text" name="userName" id="userID" placeholder="请输入你的用户名"/>
            <input type="password" name="password" id="password" placeholder="请输入您的密码" />
            <input type="button" onclick="applyButton()" id="button" value="完成"/>
            <p class="change_link" align="center">
                <span class="text">没有帐户？</span>
                <a href="${pageContext.request.contextPath }/JSP/register.jsp" class="to_login"> 点击这里注册</a>
            </p>
        </form>
    </div>
    <ul>
        <li></li> <!-- 泡泡 -->
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li><!-- 10个泡泡 -->
    </ul> 
</div>
<script type="text/javascript">
function applyButton(){
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/loginServlet",
		data: {userName:$('#userID').val(),password:$('#password').val()},	
		dataType:"json",
	    success:function(data){ 
	      var info = data.info;
	     // alert(info);
	       if (info==1){
	    	 /*  layer.open({
    	   			type: 1,
    	   			title:false,
    	   			closeBtn: 0,
    	   			area: ['1000px', '1000px'],
    	   			shadeClose: true, //点击遮罩关闭
    	   			content: '\<\div style="font-size:18px; padding:85px; background-color:#ebf6f7;">login success \<\/div>'
    	   			}); */
	    	  window.location.href = "${pageContext.request.contextPath}/html/homePage.jsp";
	       }else if(info == -1){
	    	   layer.open({
    	   			type: 1,
    	   			title:"Warm heart warning",
    	   			skin: 'layui-layer-molv',
    	   			closeBtn: 0,
    	   			shadeClose: true,
    	   			shade:0.8,
    	   			area: ['320px', '160px'],
    	   			shadeClose: true, //点击遮罩关闭
    	   			content: '\<\div style="font-size:18px; padding:50px; background-color:#ebf6f7;">your password is wrong \<\/div>'
    	   			});
	       } else if(info == 0){
	    	   layer.open({
    	   			type: 1,
    	   			title:"Warm heart warning",
    	   			skin: 'layui-layer-molv',
    	   			closeBtn: 0,
    	   			shadeClose: true,
    	   			shade:0.8,
    	   			area: ['320px', '160px'],
    	   			shadeClose: true, //点击遮罩关闭
    	   			content: '\<\div style="font-size:18px; padding:50px; background-color:#ebf6f7;">cannot find your name \<\/div>'
    	   			});
	       } 
	    
	    }, error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        }
	});
}
</script>

</body>
</html>