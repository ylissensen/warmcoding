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
<link rel="stylesheet" href="../CSS/layer/mobile/need/layer.css">

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="../CSS/layer/layer.js"></script>
<script src="../jquery.js"></script>

<title>warmcoding-个人中心</title>
</head>
<body>
<%
		/* 得到Cookie自动填写用户名 */
		Cookie[] cookies = request.getCookies();
		String name = "";
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("username")) {
					name = cookies[i].getValue();
				}
			}
		}
		user user = new user();
		user.setUserName(name);


	%>
	<!-- 以下部分代码为主要导航栏 -->
<nav style="background:black;" class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="homePage.jsp">Warmcoding</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="homePage.jsp">首  页<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="classPage.jsp">直播分类</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="personPage.jsp">个人中心</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav> 

<div class="container">
        <div class="row">
            <div class="col-md-6" style="height:550px; width:500px; border:1px solid #e7e7eb">
                <h4 style="padding:40px;">用户信息</h4>
                <p style="padding:40px;">
                    用户名：彭依琳<br/>
                    用户id：2017890<br/>
                </p>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-5"  style=" height:275px; width:500px; border:1px solid #e7e7eb">               
                <h4 style="padding:40px;">用户的直播间</h4>
                <p style="padding:40px;">
                    您还不是主播呢~<br/>
                    <a href="applyHome.jsp">一键</a>开启你的直播间
                </p>
            </div>
        </div>
    </div>



</body>
</html>