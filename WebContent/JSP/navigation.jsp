<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="warmcoding.classes.user"%>
<%@page import="warmcoding.daoiml.UserDaoImpl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="../CSS/leftnav.css">
<link rel="stylesheet" type="text/css" href="../CSS/mainpart.css">
<title>首页</title>
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

	<div class="nav-main">
		<div class="nav-box">
			<div class="nav">
				<ul class="nav-ul">
					<li><a href="#" class="user_name"><span>用户：<%=name%></span></a></li>
					<li><a href="homepage.jsp" class="create_paper"><span>首页</span></a></li>
					<li><a href="#" class="test_manager"><span>分类</span></a></li>
					<li><a href="#" class="personal_space"><span>个人空间</span></a></li>
					<li><a href="#" class="not"><span>帮助</span></a></li>
					<li><a href="#" class="quit"><span>退出</span></a></li>
				</ul>
			</div>
			<div class="nav-slide">
				<div class="nav-slide-o"></div>
				<div class="nav-slide-o"></div>
				<div class="nav-slide-o">
					<ul>
						<li><a href="#"><span>C++<br />
							</span></a></li>
						<li><a href="#"><span>C<br />
							</span></a></li>
						<li><a href="#"><span>Java<br />
							</span></a></li>
						<li><a href="#"><span>C#<br />
							</span></a></li>
						<li><a href="#"><span>Python<br />
							</span></a></li>
						<li><a href="#"><span>JavaScript<br />
							</span></a></li>
						<li><a href="#"><span>CSS<br />
							</span></a></li>
						<li><a href="#"><span>HTML<br />
							</span></a></li>
					</ul>
				</div>
				<div class="nav-slide-o">
					<ul>
						<li><a href="#"><span>用户信息</span></a></li>
						<li><a href="#"><span>用户直播间</span></a></li>
						<li><a href="#"><span>修改个人信息</span></a></li>
					</ul>
				</div>
				<div class="nav-slide-o">
					<ul>
						<li><a href="#"><span>（待定）</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 以下为导航栏部分的js样式代码 -->

	<script type="text/javascript" src="../JS/jquery-1.9.1.min.js"></script>
	<!-- leftnav.js为左侧导航栏的js代码 -->
	<script type="text/javascript" src="../JS/leftnav.js"></script>
	<script type="text/javascript" src="../JS/searchTest1.js"></script>


</body>
</html>