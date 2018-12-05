<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.Cookie" %>
   <%@page import="java.net.*" %>
    <%@page import="org.json.JSONObject" %>
    <%@page import="org.json.JSONArray" %>
    <%@page import="warmcoding.classes.user" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!-- layer框架 用于弹框 -->  	<!-- bootstrap框架  -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/layer/mobile/need/layer.css">

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/CSS/layer/layer.js"></script>
<script src="<%=request.getContextPath()%>/jquery.js"></script>

<title>warmcoding-首页</title>
<script type="text/javascript">
$(function test(){
    $.ajax({
          type:"GET",
          url:"${pageContext.request.contextPath}/getAllCurLiveServlet",
          cache: false,
          dataType:"json",
          success:function(json){
         	   // alert("hhhhhhhhhhhh");
         	    var tem = " ";
         	 for(var i=0,l=3;i<l;i++){
                   tem+="<div class='col-md-3'><figure>";
                   tem+="<a href='${pageContext.request.contextPath}/showCurLiveServlet?homeid="+json[i].currentLiveHomeNumber+"'>";
                   tem+=" <img src='${pageContext.request.contextPath}/CSS/images/"+(i%14+1)+".jpg' style='padding:10px' height='300px' width='250px'>";
                   tem+="</a>"+"</figure>";
                   tem+=" <p style='padding:20px;'> 标题:"+json[i].currentLiveTitle+"<br/>分类:"+json[i].currentLiveClass+"<br/>房间号:"+json[i].currentLiveHomeNumber+"<br/>";
                   tem+="</p></div>";  
         	      
         	 }
         	 $("#livediv").html(tem);
          },error: function (XMLHttpRequest, textStatus, errorThrown) {  
              alert(XMLHttpRequest.status);
              alert(XMLHttpRequest.readyState);
              alert(textStatus);
           }
   }); 
});
</script>
</head>
<body style="background-color:  #e9dfe5">

	<!-- 以下部分代码为主要导航栏 -->
<nav style="background:black;" class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="homePage.jsp">Warmcoding</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath }/JSP/homePage.jsp">首  页<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath }/JSP/classPage.jsp">直播分类</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath }/JSP/personPage.jsp">个人中心</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/roomFinderServlet">
      <input class="form-control mr-sm-2"  type="text"  name="shabi" id="shabi" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav> 

<div class="container">
        <div class="row" style="border:1px solid #c0a2c7;background-color: #f8fbf8  ">
            <div class="col-md-7">
                <p style="padding:70px; font-size: 18px; font-family: 楷体;">
                    在本平台<br/>
                    你可以观看他人直播写代码<br/>
                    也可以自己直播写代码<br/>
                    我们的目标就是
                </p>
                <p style="padding:0px 120px 40px 100px; font-family: 黑体; font-size: 20px;">温暖每一个码农的心</p>
            </div>
            <div class="col-md-5">
                <h3 style="padding:50px;">加入我们</h3>
                <span>
                    <button type="button" class="btn btn-default btn-lg" style="border:1px solid rgb(0, 195, 255); color:rgb(0, 195, 255)" ><a href="${pageContext.request.contextPath }/JSP/login.jsp" >登录</a></button>
                </span>
                <span style="padding:50px;">
                    <button type="button" class="btn btn-default btn-lg" style="border:1px solid rgb(0, 195, 255); color:rgb(0, 195, 255)" ><a href="${pageContext.request.contextPath }/JSP/register.jsp" >注册</a></button>
                </span>
            </div>
        </div>
        <div>
            <h3 style="font-family: 黑体 ">推荐</h3>
        </div>
        <div class="row" id="livediv">
    </div>

	

</body>
</html>